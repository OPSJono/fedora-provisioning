#!/bin/bash

# Script to build NVM kernel module in /tmp dir.
# It will be called from "nvm_install.sh" script
# Note: This script should not be invoked independently.

ACKDF="anyconnect_kdf"
ACKDFKO="anyconnect_kdf.ko"
KDFSRCTARFILE="ac_kdf_src.tar.gz"
KDFDIR="kdf/lkm"
INSTPREFIX="/opt/cisco/anyconnect"
NVMDIR="${INSTPREFIX}/NVM"
RETVAL=0
CCFLAG=""

# Make sure we are root.
if [ `id | sed -e 's/(.*//'` != "uid=0" ]; then
  echo "You need super user privileges to run this script."
  exit 1
fi

# Check if valid parameter is passed.
if [ -z $1 ]; then
    echo "Usage: build_ac_ko.sh {build|rebuild}"
    exit 1
fi

if [ $1 == "build" ]; then
    if [ -z $2 ]; then
        echo "Usage: build_ac_ko.sh build <target dir>"
        exit 1
    fi
fi

# Check if Target dir is passed else use /lib/modules
if [ -z $2 ]; then
    DIRTOCOPYACKDFKO=/lib/modules/$(uname -r)/extra/cisco/
    build_and_install=1
else
    DIRTOCOPYACKDFKO=$(realpath $2)
    build_and_install=0
fi

# checks if kernel-headers/linux-headers pkg is installed.
isKernelHeaderInstalled()
{
    linux_kernel_header_pkg=0
    installed_linux_kernel_header_pkg=0
    KERNEL_VERSION=$(uname -r)

    if [ -f /etc/redhat-release ]; then
        linux_kernel_header_pkg=kernel-devel-${KERNEL_VERSION}
        installed_linux_kernel_header_pkg=`rpm -q kernel-devel-${KERNEL_VERSION}`
    else
        linux_kernel_header_pkg=linux-headers-${KERNEL_VERSION}
        installed_linux_kernel_header_pkg=`dpkg -s linux-headers-${KERNEL_VERSION} | grep Package | awk '{ print $2 }'`
    fi

    if [ "${linux_kernel_header_pkg}" != "${installed_linux_kernel_header_pkg}" ]; then
        echo "${linux_kernel_header_pkg} should be installed. Install ${linux_kernel_header_pkg} to proceed."
        echo "Exiting now."
        exit 1
    fi 
}

getInstalledGccVersion()
{
    # Return "major" version for gcc major version > 4
    # else return "major.minor"
    gcc_path=$1
    MAJOR=$(echo __GNUC__ | ${gcc_path} -E - | tail -n 1)
    if [ ${MAJOR} -gt 4 ]; then
        echo -n ${MAJOR}
    else
        MINOR=$(echo __GNUC_MINOR__ | ${gcc_path} -E - | tail -n 1)
        echo -n ${MAJOR}"."${MINOR}
    fi
}

# Checks if installed gcc release is same with which kernel has been built.

# In the past, GCC 4.6, 4.7, 4.8, 4.9 were indeed different releases (which could have ABI changes)
# but now, only the major number corresponds to some given release: 5, 6, 7, 8, 9
# (GCC was using X.Y.Z where Z was a patchlevel, and now uses X.Y where Y is a patchlevel)

# It checks against "major.minor" version of gcc for major version <= 4
# e.g. For gcc version "4.4.x", it compares 4.4 and discards x.
# It checks against "major" version of gcc for major version > 4
# e.g. For gcc version "7.x.y", it compares 7 and discards x and y.

checkGccVersion()
{
    gcc_in_proc_version=`grep -Eo 'gcc (version |\([^)]+\) )?[^ ]+' /proc/version | awk '{ print $NF }' | grep -Eo '[0-9]+\.[0-9]+'`
    proc_gcc_major_version_no=`echo ${gcc_in_proc_version} | awk -F'.' '{ print $1 }'`

    # check for gcc major version > 4
    # Use the major version to determine the preferred gcc
    # else use "major.minor" version

    if [ ${proc_gcc_major_version_no} -gt 4 ]; then
        gcc_version_required=${proc_gcc_major_version_no}
    else
        gcc_version_required=${gcc_in_proc_version}
    fi

    # First look for system's default gcc in /usr/bin dir to check,
    if [ -f /usr/bin/gcc ]; then
        installed_gcc_version=$(getInstalledGccVersion /usr/bin/gcc)
        if [ "${installed_gcc_version}" == "${gcc_version_required}" ]; then
            CCFLAG="/usr/bin/gcc"
        fi
    fi

    # Couldn't find /usr/bin/gcc same as of gcc used to build kernel.
    # looking for version specific gcc in /usr/bin/ dir.
    if [ -z ${CCFLAG} ] && [ -f /usr/bin/gcc"-${gcc_in_proc_version}" ]; then
        installed_gcc_version=$(getInstalledGccVersion /usr/bin/gcc"-${gcc_in_proc_version}")
        if [ "${installed_gcc_version}" == "${gcc_version_required}" ]; then
            CCFLAG="/usr/bin/gcc-${gcc_in_proc_version}"
        fi
    fi

    # In Ubuntu 16 version specific gcc naming convention is like "gcc-x"
    # So search finally for "gcc-x"
    if [ -z ${CCFLAG} ] && [ -f "/usr/bin/gcc-${proc_gcc_major_version_no}" ]; then
        installed_gcc_version=$(getInstalledGccVersion /usr/bin/gcc"-${proc_gcc_major_version_no}")
        if [ "${installed_gcc_version}" == "${gcc_version_required}" ]; then
            CCFLAG="/usr/bin/gcc-${proc_gcc_major_version_no}"
        fi
    fi

    # Couldn't find gcc installed in the system, which was used to build kernel.
    # Failure case.
    if [ -z ${CCFLAG} ]; then
        echo "gcc-${gcc_in_proc_version} should be installed. Install gcc-${gcc_in_proc_version} to proceed."
        echo "Exiting now."
        exit 1
    fi
}

# Checks if anyconnect_kdf.ko is compatible with current kernel version.
isAcKoCompatible()
{
    if [ ! -f ${DIRTOCOPYACKDFKO}/${ACKDFKO} ]; then
        # NVM is not installed, do nothing.
        # return success.
        return 0
    fi

    # get vermagic value of anyconnect_kdf.ko & kernel release.
    ACKDFKOVERSION=`modinfo -F vermagic ${ACKDF} | awk '{ print $1 }'`
    KERNELRELEASE=`uname -r`

    if [ "${ACKDFKOVERSION}" == "${KERNELRELEASE}" ]; then
        # AnyConnect Kernel module  is compatible with current kernel release.
        # return success.
        return 2
    fi
 
    # anyconnect_kdf.ko is incompatible with current kernel version.
    # return failure.
    return 1
}

installKDF()
{
  mkdir -p ${DIRTOCOPYACKDFKO}
  echo "Installing "${ACKDFKO}
  install -o root -m 755 ${ACKDFKO} ${DIRTOCOPYACKDFKO}  || exit 1
  echo "Updating kernel module dependencies"
  /sbin/depmod -a

# Check the kernel driver compatiblity
  echo "Checking if kernel driver is compatible."
  if ! /sbin/modprobe -q anyconnect_kdf; then
      echo "Error. Unable to load the Kernel driver."
      echo "Exiting installation."
      return 1
  fi
  return 0
}

# Builds anyconnect_kdf.ko, if it is not compatible with current kernel version.
rebuildAcKdfKo()
{
    # Check if anyconnect_kdf.ko is compatible with current kernel version. 
    isAcKoCompatible
    ret=$?
    if [ ${ret} == 2 ]; then
        # AnyConnect Kernel module is compatible with current kernel release.
        return 2
    fi
 
    # Kernel module not present/Incompatible kernel module present

    if [ ${ret} == 1 ]; then
        # Remove existing anyconnect_kdf.ko and invoke kdf build script to create compatible anyconnect_kdf.ko
        rm -rf ${DIRTOCOPYACKDFKO}/${ACKDFKO}
    fi
 
    # make anyconnect_kdf.ko module.
    cd ${NVMDIR}
    buildAcKdfKo
    if [ $? == 0 ]; then
        # AnyConnect kernel module is upgraded successfully.
        # return success
        return 0
    fi

    # Failed to upgrade anyconnect_kdf.ko
    return 1
}

# Makes anyconnect_kdf.ko module.
buildAcKdfKo()
{

# check if GNU Make utility exists
    if ! which make; then
        echo "GNU Make should be installed, Install GNU Make to proceed."
        echo "Exiting now."
        exit 1
    fi

# check if kernel-header pkg installed.
    isKernelHeaderInstalled

# check if installed gcc version is same with which kernel is built.
    checkGccVersion

    #locate a unique temp dir, to build kdf src.
    if which mktemp >/dev/null 2>&1; then
        TEMPDIR=`mktemp -d /tmp/lkm.XXXXXX`
    else
        TEMPDIR="/tmp"
    fi

    # copy kdf src in tmp dir & make.
    cp -af ${KDFSRCTARFILE} ${TEMPDIR} || exit 1

    cd ${TEMPDIR}
    tar -xvzf ${KDFSRCTARFILE} || exit 1
    cd ${KDFDIR}
 
    if make CC=${CCFLAG}; then
        echo "Built AnyConnect kernel module successfully."
        if [ ${build_and_install} == 1 ]; then
	        installKDF
        else
            # copy .ko in DIRTOCOPYACKDFKO dir.
            mkdir -p ${DIRTOCOPYACKDFKO}
            cp -f ${ACKDFKO} ${DIRTOCOPYACKDFKO} || exit 1
            chmod 755 ${DIRTOCOPYACKDFKO}/${ACKDFKO}
        fi
        return $?
    else
        echo "Failed to build AnyConnect Kernel module, exiting now."
        return 1
    fi
}

# See how we were called.
case "$1" in
  build)
    buildAcKdfKo
    ;;
  rebuild)
    rebuildAcKdfKo
    ;;
  *)
    echo "Usage: build_ac_ko.sh build <TARGET-DIR>"
    echo "       build_ac_ko.sh rebuild [TARGET-DIR]"
    exit 1
esac

ret=$?
# cleanup
rm -rf ${TEMPDIR}

exit ${ret}
