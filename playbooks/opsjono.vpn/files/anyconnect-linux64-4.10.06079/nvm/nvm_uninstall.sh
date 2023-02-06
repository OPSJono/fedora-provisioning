#!/bin/sh

updateVPNManifest()
{
  echo "${BINDIR}/manifesttool_nvm -x ${INSTPREFIX} ${INSTPREFIX}/${NVMMANIFEST}" >> ${UNINSTALLLOG}
  ${BINDIR}/manifesttool_nvm  -x ${INSTPREFIX} ${INSTPREFIX}/${NVMMANIFEST} >> ${UNINSTALLLOG}
}

removeManifestTool()
{
  if [ ! -f ${ACMANIFESTDAT} ] && [ -f ${BINDIR}/manifesttool ]; then
    echo "Removing ${BINDIR}/manifesttool" >> ${UNINSTALLLOG}
    rm -f ${BINDIR}/manifesttool
  fi
}

killNVMAgent()
{
  local nvmagentpid=$(pidof ${NVMAGENT})
  if [ ! "x${nvmagentpid}" = "x" ] ; then
      echo Killing `ps -A -o pid,command -p ${nvmagentpid} | grep ${nvmagentpid} | egrep -v 'ps|grep'` >> ${UNINSTALLLOG}
      kill -KILL ${nvmagentpid} >> ${UNINSTALLLOG} 2>&1
  fi
}

removeKDF()
{
# Unload the kernel driver
  if /sbin/lsmod | grep anyconnect_kdf > /dev/null; then
    echo "/sbin/modprobe -r anyconnect_kdf" >> ${UNINSTALLLOG}
    /sbin/modprobe -r anyconnect_kdf >> ${UNINSTALLLOG} 2>&1
  fi

# Remove the kernel driver
  if [ -f "${KERNELDRIVERDIR}/anyconnect_kdf.ko" ]; then
      echo "Removing ${KERNELDRIVERDIR}/anyconnect_kdf.ko" >> ${UNINSTALLLOG}
      rm -f ${KERNELDRIVERDIR}/anyconnect_kdf.ko
      echo "Updating kernel module dependencies"
      /sbin/depmod -a
  fi
# Remove the kernel driver folder if it is empty
  rmdir --ignore-fail-on-non-empty -p ${KERNELDRIVERDIR}
}

removeInstalledFiles()
{
  echo "rm -f $1" >> ${UNINSTALLLOG}
  rm -f $1 >> ${UNINSTALLLOG} 2>&1
}

removeNVMDir()
{
  if [ -d ${NVMDIR} ]; then
    echo "rm -rf "${NVMDIR}"" >> ${UNINSTALLLOG}
    rm -rf "${NVMDIR}" >> ${UNINSTALLLOG} 2>&1
  fi
}

INSTPREFIX="/opt/cisco/anyconnect"
NVMDIR="${INSTPREFIX}/NVM"
BINDIR="${NVMDIR}/bin"
LIBDIR="${NVMDIR}/lib"
NVMAGENT="acnvmagent"
KERNELDRIVERDIR=/lib/modules/$(uname -r)/extra/cisco
ACMANIFESTDAT="${INSTPREFIX}/VPNManifest.dat"
NVMMANIFEST="ACManifestNVM.xml"
LOGDIR="/var/log/anyconnect"
UNINSTALLLOG="${LOGDIR}/nvm-uninstall.log"

# Copy the config files under NVM dir to a NVM.temp dir if saveconfig flag is set
if [ "$1" = "-saveconfig" ]; then
    TMPNVMDIR="${INSTPREFIX}/NVM.tmp"
    mkdir -p ${TMPNVMDIR}
    # Except folders all files within the NVM directory will be cached
    find ${NVMDIR} -maxdepth 1 -type f ! -name lib,bin -exec cp -t ${TMPNVMDIR} {} +
fi

# Array of commom files to remove
COMMONFILELIST="${INSTPREFIX}/${NVMMANIFEST} \
          ${BINDIR}/${NVMAGENT} \
          ${LIBDIR}/libsock_fltr_api.so \
          ${LIBDIR}/libacciscossl.so \
          ${LIBDIR}/libacciscocrypto.so \
          ${LIBDIR}/libacruntime.so \
          ${LIBDIR}/libboost_date_time.so \
          ${LIBDIR}/libboost_filesystem.so \
          ${LIBDIR}/libboost_system.so \
          ${LIBDIR}/libboost_thread.so \
          ${LIBDIR}/libboost_chrono.so \
          ${BINDIR}/nvm_uninstall.sh"

# Make sure we are root
if [ `id | sed -e 's/(.*//'` != "uid=0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  exit 1
fi

# Create log directory if not exist
if [ ! -d ${LOGDIR} ]; then
  mkdir -p ${LOGDIR} >/dev/null 2>&1
fi
#!/bin/sh

PLUGINDIR=${INSTPREFIX}/bin/plugins
# update the VPNManifest.dat; if no entries remain in the .dat file then
# this tool will delete the file - DO NOT blindly delete VPNManifest.dat by
# adding it to the FILELIST above - allow this tool to delete the file if needed
updateVPNManifest

# check the existence of the manifest file - if it does not exist, remove the manifesttool
removeManifestTool

# move the plugins to a different folder to stop the NVM agent and then remove
# these plugins once NVM agent is stopped.
if [ -f "${PLUGINDIR}/libacnvmctrl.so" ]; then
  mv -f ${PLUGINDIR}/libacnvmctrl.so ${INSTPREFIX} >/dev/null 2>&1
  echo "mv -f ${PLUGINDIR}/libacnvmctrl.so ${INSTPREFIX}" >> ${UNINSTALLLOG}
fi


ntests=10

# Wait up to 10 seconds for the agent to finish.
while [ -n "$(pidof ${NVMAGENT})" ]
  do
    ntests=`expr  $ntests - 1`
    if [ $ntests -eq 0 ]; then
      echo "Timeout waiting for agent to stop." >> ${UNINSTALLLOG}
      break
    fi
    sleep 1
  done

# ensure that the NVM agent is not running
killNVMAgent

# Remove the KDF
removeKDF

# Remove service plugin
echo "rm -f ${INSTPREFIX}/libacnvmctrl.so" >> ${UNINSTALLLOG}
rm -f ${INSTPREFIX}/libacnvmctrl.so >> ${UNINSTALLLOG} 2>&1

# Remove only those files that we know we installed
for FILE in ${COMMONFILELIST}; do
  removeInstalledFiles ${FILE}
done

# Remove the NVM directory
# During an upgrade, this dir(profile,cache,kconfig files) will be moved and restored by
# installer scripts
removeNVMDir

echo "Successfully removed Cisco AnyConnect Network Visibility Module from the system." >> ${UNINSTALLLOG}
echo "Successfully removed Cisco AnyConnect Network Visibility Module from the system."

exit 0
