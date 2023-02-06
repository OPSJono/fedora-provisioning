#!/bin/sh

version() { echo "$@" | awk -F. '{ printf("%d%03d%05d\n", $1,$2,$3); }'; }

showLicense()
{
    ## The web-based installer used for VPN client installation and upgrades does
    ## not have the license.txt in the current directory, intentionally skipping
    ## the license agreement. Bug CSCtc45589 has been filed for this behavior.
    if [ -f "license.txt" ]; then
        cat ./license.txt
        echo
        echo -n "Do you accept the terms in the license agreement? [y/n] "
        read LICENSEAGREEMENT
        while : 
        do
          case ${LICENSEAGREEMENT} in
               [Yy][Ee][Ss])
                       echo "You have accepted the license agreement."
                       echo "Please wait while ${CLIENTNAME} is being installed..."
                       break
                       ;;
               [Yy])
                       echo "You have accepted the license agreement."
                       echo "Please wait while ${CLIENTNAME} is being installed..."
                       break
                       ;;
               [Nn][Oo])
                       echo "The installation was cancelled because you did not accept the license agreement."
                       exit 1
                       ;;
               [Nn])
                       echo "The installation was cancelled because you did not accept the license agreement."
                       exit 1
                       ;;
               *)    
                       echo "Please enter either \"y\" or \"n\"."
                       read LICENSEAGREEMENT
                       ;;
          esac
        done
    fi
}

createTempDir()
{
  if [ "`basename $0`" != $1 ]; then
    if which mktemp >/dev/null 2>&1; then
      TEMPDIR=`mktemp -d /tmp/nvm.XXXXXX`
      RMTEMP="yes"
    else
      TEMPDIR="/tmp"
      RMTEMP="no"
    fi
  else
    TEMPDIR="."
  fi
}

deleteKDFFilesDuringUpgrade()
{
  # In upgrades, build_ac_ko.sh & kdf src tar file should be deleted from NVM dir,
  # before moving NVM files to temp dir.
  if [ -f ${NVMDIR}/${KDFSRCTARFILE} ]; then
    echo "rm -f ${NVMDIR}/${KDFSRCTARFILE}" >> /tmp/${LOGFNAME}
    rm -f ${NVMDIR}/${KDFSRCTARFILE} >> /tmp/${LOGFNAME} 2>&1
  fi

  if [ -f ${NVMDIR}/build_ac_ko.sh ]; then
    echo "rm -f ${NVMDIR}/build_ac_ko.sh" >> /tmp/${LOGFNAME}
    rm -f ${NVMDIR}/build_ac_ko.sh >> /tmp/${LOGFNAME} 2>&1
  fi
}

copyNVMFilesToTempDuringUpgrade()
{
  # In upgrades, NVM files will be copied to a temp directory and moved back
  if [ -d ${NVMDIR} ]; then
    echo "mv -f ${NVMDIR} ${TMPNVMDIR}" >> /tmp/${LOGFNAME}
    mkdir -p ${TMPNVMDIR}
    # Except folders all files within the NVM directory will be cached
    find ${NVMDIR} -maxdepth 1 -type f ! -name lib,bin -exec cp -t ${TMPNVMDIR} {} + >> /tmp/${LOGFNAME} 2>&1
  fi
}

uninstallPreviousVersion()
{
 if [ -x $1 ]; then
    echo "Removing previous installation..."
    echo "Removing previous installation: ${UNINSTALLSCRIPT}" >> /tmp/${LOGFNAME}
    if ! $1; then
      echo "Error removing previous installation!  Continuing..."
      echo "Error removing previous installation!  Continuing..." >> /tmp/${LOGFNAME}
    fi
  fi
}

extractAndUnarchive()
{
  if [ "${TEMPDIR}" != "." ]; then
    TARNAME=`date +%N`
    TARFILE=${TEMPDIR}/nvminst${TARNAME}.tgz

    echo "Extracting installation files to ${TARFILE}..."
    echo "Extracting installation files to ${TARFILE}..." >> /tmp/${LOGFNAME}
    # "head --bytes=-1" used to remove '\n' prior to MARKER_END
    head -n ${MARKER_END} $0 | tail -n +${MARKER} | head --bytes=-1 2>> /tmp/${LOGFNAME} > ${TARFILE} || exit 1

    echo "Unarchiving installation files to ${TEMPDIR}..."
    echo "Unarchiving installation files to ${TEMPDIR}..." >> /tmp/${LOGFNAME}
    tar xvzf ${TARFILE} -C ${TEMPDIR} >> /tmp/${LOGFNAME} 2>&1 || exit 1

    rm -f ${TARFILE}

    NEWTEMP="${TEMPDIR}/${TARROOT}"
  else
    NEWTEMP="."
  fi
}

checkVersionFeasibilityWithVPN()
{
  failed=false
  # version of NVM being installed has to be same as installed VPN version
  if [ -f ${VPNMANIFEST} ]; then
      VPNVERSION=$(awk -F"\"" '/file version/ { print $2 }' ${VPNMANIFEST})
      NVMCURRVERSION=4.10.06079

      if [ "$STANDALONE_FLAG" = true ]; then
        failed=true
      elif [ $(version $VPNVERSION) -ne $(version $NVMCURRVERSION) ]; then
        failed=true
      fi
  fi

  if [ "$failed" = true ]; then
      echo "Please use nvm installer from Anyconnect package with version ${VPNVERSION} for the installation"
      echo "Please use nvm installer from Anyconnect package with version ${VPNVERSION} for the installation" >> /tmp/${LOGFNAME}
      echo "Exiting now."
      echo "Exiting now." >> /tmp/${LOGFNAME}
      exit 1
  fi
}

checkVersionFeasibilityWithNVM()
{
  failed=false
  # version of NVM being installed has to be greater than the current NVM version
  if [ "$STANDALONE_FLAG" = true ] && [ -f ${NVMMANIFEST} ]; then
      NVMPREVVERSION=$(awk -F"\"" '/file version/ { print $2 }' ${NVMMANIFEST})
      NVMCURRVERSION=4.10.06079

      if [ $(version $NVMCURRVERSION) -le $(version $NVMPREVVERSION) ]; then
        failed=true
      fi
  fi

  if [ "$failed" = true ]; then
    if [ $(version $NVMCURRVERSION) -eq $(version $NVMPREVVERSION) ]; then
      echo "Version ${NVMCURRVERSION} is already installed!"
      echo "Version ${NVMCURRVERSION} is already installed!" >> /tmp/${LOGFNAME}
    else
      echo "A higher version ${NVMPREVVERSION} of NVM is already installed!"
      echo "A higher version ${NVMPREVVERSION} of NVM is already installed!" >> /tmp/${LOGFNAME}
    fi
    echo "Exiting now."
    echo "Exiting now." >> /tmp/${LOGFNAME}
    exit 1
  fi
}

buildKDF()
{
  # build KDF first, if .ko doesn't exist.
  cd ${NEWTEMP}
  ACKDFKO="anyconnect_kdf.ko"
  if [ ! -f "${ACKDFKO}" ]; then
      echo "Starting to build AnyConnect Kernel Module..."
      echo "./build_ac_ko.sh build `pwd`" >> /tmp/${LOGFNAME}
      ./build_ac_ko.sh build `pwd` >> /tmp/${LOGFNAME} 2>&1
      if [ $? != 0 ]; then
          echo "Failed to build AnyConnect Kernel module."
          echo "Exiting now."
          exit 1
      else
          echo "AnyConnect Kernel module built successfully."
      fi
  fi
}

installKDF()
{
  mkdir -p ${KERNELDRIVERDIR}
  echo "Installing "${NEWTEMP}/${ACKDFKO} >> /tmp/${LOGFNAME}
  ${INSTALL} -o root -m 755 ${NEWTEMP}/${ACKDFKO} ${KERNELDRIVERDIR}  || exit 1
  echo "Updating kernel module dependencies"
  /sbin/depmod -a

# Check the kernel driver compatiblity
  echo "Checking if kernel driver is compatible."
  echo "Checking if kernel driver is compatible." >> /tmp/${LOGFNAME}
  echo "/sbin/modprobe -q anyconnect_kdf" >> /tmp/${LOGFNAME}
  if ! /sbin/modprobe -q anyconnect_kdf; then
      echo "Error. Unable to load the Kernel driver." >> /tmp/${LOGFNAME}
      echo "Error. Unable to load the Kernel driver."
      echo "Exiting installation." >> /tmp/${LOGFNAME}
      echo "Exiting installation."
      exit 1
  fi
}

createDir()
{
  DIR=$1
  echo "Installing "${DIR} >> /tmp/${LOGFNAME}
  ${INSTALL} -d ${DIR} || exit 1
}

copyKDFFilesToNVMDir()
{
  # Copy KDF source & build_ac_kdf_ko.sh to NVM dir.
  if [ -d ${NVMDIR} ]; then
      echo "cp -af ${NEWTEMP}/${KDFSRCTARFILE} ${NVMDIR}" >> /tmp/${LOGFNAME}
      cp -af ${NEWTEMP}/${KDFSRCTARFILE} ${NVMDIR} >> /tmp/${LOGFNAME}

      echo "cp -af ${NEWTEMP}/build_ac_kdf_ko.sh ${NVMDIR}" >> /tmp/${LOGFNAME}
      cp -af ${NEWTEMP}/build_ac_ko.sh ${NVMDIR} >> /tmp/${LOGFNAME}
  fi
}

copyFiles()
{
  echo "Installing "${NEWTEMP}/$1 >> /tmp/${LOGFNAME}
  ${INSTALL} -o root -m 755 ${NEWTEMP}/$1 $2 || exit 1
}

updateVPNManifestFile()
{
  # Generate/update the VPNManifest.dat file
  ${BINDIR}/manifesttool_nvm -i ${INSTPREFIX} ${INSTPREFIX}/ACManifestNVM.xml
}

removeTMPDIR()
{
  if [ "${RMTEMP}" = "yes" ]; then
    echo rm -rf ${TEMPDIR} >> /tmp/${LOGFNAME}
    rm -rf ${TEMPDIR}
  fi
}

restoreNVMDirDuringUpgrade()
{
  # In upgrades, we restore the NVM directory from the temp dir
  if [ -d ${TMPNVMDIR} ]; then
    echo "Moving NVM config files back to NVM directory" >> /tmp/${LOGFNAME}
    mkdir -p ${NVMDIR}
    tar cf - -C ${TMPNVMDIR} . | (cd ${NVMDIR}; tar xf -) >> /tmp/${LOGFNAME} 2>&1
    rm -rf ${TMPNVMDIR}
  fi  
}

BASH_BASE_SIZE=0x00000000
CISCO_AC_TIMESTAMP=0x0000000000000000
CISCO_AC_OBJNAME=1234567890123456789012345678901234567890123456789012345678901234
# BASH_BASE_SIZE=0x00000000 is required for signing
# CISCO_AC_TIMESTAMP is also required for signing
# comment is after BASH_BASE_SIZE or else sign tool will find the comment

TARROOT="nvm"
INSTPREFIX=/opt/cisco/anyconnect
NVMDIR=${INSTPREFIX}/NVM
BINDIR=${NVMDIR}/bin
LIBDIR=${NVMDIR}/lib
TMPNVMDIR=${INSTPREFIX}/NVM.tmp
KERNELDRIVERDIR=/lib/modules/$(uname -r)/extra/cisco/
INSTALL=install
MARKER=$((`grep -an "[B]EGIN\ ARCHIVE" $0 | cut -d ":" -f 1` + 1))
MARKER_END=$((`grep -an "[E]ND\ ARCHIVE" $0 | cut -d ":" -f 1` - 1))
LOGFNAME=`date "+anyconnect-linux64-4.10.06079-nvm-install-%H%M%S%d%m%Y.log"`
CLIENTNAME="Cisco AnyConnect Network Visibility Client"
VPNMANIFEST="${INSTPREFIX}/ACManifestVPN.xml"
NVMMANIFEST="${INSTPREFIX}/ACManifestNVM.xml"
KDFSRCTARFILE="ac_kdf_src.tar.gz"
LEGACY_UNINST="${INSTPREFIX}/bin/nvm_uninstall.sh"
UNINST=${BINDIR}/nvm_uninstall.sh
TEMPDIR="."
RMTEMP=""
NEWTEMP="."
VPNVERSION=""
NVMCURRVERSION=""
NVMPREVVERSION=""
ACKDFKO=""

UNINSTALLER_SCRIPTS="${LEGACY_UNINST} \
                     ${UNINST}"

echo "Installing ${CLIENTNAME}..."
echo "Installing ${CLIENTNAME}..." > /tmp/${LOGFNAME}
echo `whoami` "invoked $0 from " `pwd` " at " `date` >> /tmp/${LOGFNAME}

#Set a trap so that the log file is moved to ${INSTPREFIX}/. in any exit path
trap 'mv /tmp/${LOGFNAME} ${INSTPREFIX}/.' EXIT

# Make sure we are root
if [ `id | sed -e 's/(.*//'` != "uid=0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  exit 1
fi

#!/bin/sh

PLUGINDIR=${INSTPREFIX}/bin/plugins
STANDALONE_FLAG=false

# NVM requires VPN to be installed. We check the presence of the vpn manifest file to check if it is installed.
if [ ! -f ${VPNMANIFEST} ]; then
    echo "VPN should be installed before NVM installation. Install VPN to proceed."
    echo "Exiting now."
    exit 1
fi

showLicense

# version of NVM being installed has to be greater than the current NVM version
checkVersionFeasibilityWithNVM

# version of NVM being installed has to be same as installed VPN version
checkVersionFeasibilityWithVPN

createTempDir "nvm_install.sh"

# In upgrades, build_ac_ko.sh & kdf src tar file should be deleted from NVM dir, 
# before moving NVM files to temp dir.
deleteKDFFilesDuringUpgrade

# In upgrades, NVM files will be copied to a temp directory and moved back
copyNVMFilesToTempDuringUpgrade

for UNINSTALLER_SCRIPT in ${UNINSTALLER_SCRIPTS};do
  #Check for and uninstall any previous version.
  uninstallPreviousVersion ${UNINSTALLER_SCRIPT}
done

extractAndUnarchive

# build KDF first, if .ko doesn't exist.
buildKDF

# Return to previous directory.
cd -

# Make sure destination directories exist
# Since vpn installer creates these directories need to revisit
DIRS="${BINDIR} \
      ${LIBDIR} \
      ${NVMDIR} \
      ${PLUGINDIR}"

for DIR in ${DIRS}; do
  createDir ${DIR}
done

# Copy KDF source & build_ac_kdf_ko.sh to NVM dir.
copyKDFFilesToNVMDir

BINFILES="nvm_uninstall.sh \
          acnvmagent \
          manifesttool_nvm"

LIBFILES="libacruntime.so \
          libacciscossl.so \
          libacciscocrypto.so \
          libsock_fltr_api.so \
          libboost_date_time.so \
          libboost_filesystem.so \
          libboost_system.so \
          libboost_thread.so \
          libboost_chrono.so"

for BINFILE in ${BINFILES}; do
    copyFiles ${BINFILE} ${BINDIR}
done

for LIBFILE in ${LIBFILES}; do
    copyFiles ${LIBFILE} ${LIBDIR}
done

installKDF

echo "Installing "${NEWTEMP}/plugins/libacnvmctrl.so >> /tmp/${LOGFNAME}
${INSTALL} -o root -m 755 ${NEWTEMP}/plugins/libacnvmctrl.so ${PLUGINDIR} || exit 1

echo "Installing "${NEWTEMP}/ACManifestNVM.xml >> /tmp/${LOGFNAME}
${INSTALL} -o root -m 444 ${NEWTEMP}/ACManifestNVM.xml ${INSTPREFIX} || exit 1

# Generate/update the VPNManifest.dat file
updateVPNManifestFile

removeTMPDIR

# In upgrades, we restore the NVM directory from the temp dir
restoreNVMDirDuringUpgrade


echo "${CLIENTNAME} is installed successfully."
echo "${CLIENTNAME} is installed successfully." >> /tmp/${LOGFNAME}

exit 0

--BEGIN ARCHIVE--
