#!/bin/sh

VPNINSTPREFIX="/opt/cisco/anyconnect"
BINDIR="${VPNINSTPREFIX}/bin"
INSTPREFIX="${VPNINSTPREFIX}/dart"
CONFIGDIR="${INSTPREFIX}/xml/config"
REQUESTDIR="${INSTPREFIX}/xml/request"
RESOURCESDIR="${INSTPREFIX}/resources"
MENUDIR="/etc/xdg/menus/applications-merged/"
DIRECTORYDIR="/usr/share/desktop-directories/"
DESKTOPDIR="/usr/share/applications"
ICONSDIR="/usr/share/icons"
DBUSSERVICEDIR="/usr/share/dbus-1/system-services"
DBUSCONFIGDIR="/etc/dbus-1/system.d"
POLKITPOLICYDIR="/usr/share/polkit-1/actions"
LOGDIR="/var/log/anyconnect"
LOGFILE="${LOGDIR}/dart-uninstall.log"
ACMANIFESTDAT="${VPNINSTPREFIX}/VPNManifest.dat"
DARTMANIFEST="ACManifestDART.xml"

# List of files to remove
FILELIST="${CONFIGDIR}/AnyConnectConfig.xml \
          ${CONFIGDIR}/BaseConfig.xml \
          ${CONFIGDIR}/Posture.xml \
          ${CONFIGDIR}/NetworkVisibility.xml \
          ${CONFIGDIR}/ConfigXMLSchema.xsd \
          ${REQUESTDIR}/RequestXMLSchema.xsd \
          ${RESOURCESDIR}/* \
          ${INSTPREFIX}/dartui \
          ${INSTPREFIX}/dartcli \
          ${INSTPREFIX}/darthelper \
          ${INSTPREFIX}/libdartdbusclient.so \
          ${BINDIR}/dart_uninstall.sh \
          ${BINDIR}/manifesttool_dart \
          ${BINDIR}/SetUIDTool_dart \
          ${MENUDIR}/cisco-anyconnect-dart.menu \
          ${DIRECTORYDIR}/cisco-anyconnect-dart.directory \
          ${DESKTOPDIR}/com.cisco.anyconnect.dart.desktop \
          ${ICONSDIR}/hicolor/48x48/apps/cisco-anyconnect-dart.png \
          ${ICONSDIR}/hicolor/64x64/apps/cisco-anyconnect-dart.png \
          ${ICONSDIR}/hicolor/96x96/apps/cisco-anyconnect-dart.png \
          ${ICONSDIR}/hicolor/128x128/apps/cisco-anyconnect-dart.png \
          ${ICONSDIR}/hicolor/256x256/apps/cisco-anyconnect-dart.png \
          ${ICONSDIR}/hicolor/512x512/apps/cisco-anyconnect-dart.png \
          ${VPNINSTPREFIX}/${DARTMANIFEST} \
          ${DBUSSERVICEDIR}/com.cisco.anyconnect.dart.helper.service \
          ${POLKITPOLICYDIR}/com.cisco.anyconnect.dart.policy \
          ${DBUSCONFIGDIR}/com.cisco.anyconnect.dart.conf"

# Create log directory if not exist
if [ ! -d ${LOGDIR} ]; then
  mkdir -p ${LOGDIR} >/dev/null 2>&1
fi

echo "Uninstalling Cisco AnyConnect Diagnostics and Reporting Tool..."
echo "Uninstalling Cisco AnyConnect Diagnostics and Reporting Tool..." > ${LOGFILE}
echo `whoami` "invoked $0 from " `pwd` " at " `date` >> ${LOGFILE}

# Check for root privileges
if [ `id | sed -e 's/(.*//'` != "uid=0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  echo "Sorry, you need super user privileges to run this script." >> ${LOGFILE}
  exit 1
fi

# make sure gui is not running
PROCS=`ps -A -o pid,command | grep '/opt/cisco/anyconnect/dart' | egrep -v 'grep|dart_uninstall' | awk '{print $1}'`
if [ -n "${PROCS}" ]; then 
    echo Killing `ps -A -o pid,command -p ${PROCS} | grep ${PROCS} | egrep -v 'ps|grep'` >> ${LOGFILE}
    kill -KILL ${PROCS} >> ${LOGFILE} 2>&1
fi

# update the VPNManifest.dat
echo "${BINDIR}/manifesttool_dart -x ${VPNINSTPREFIX} ${VPNINSTPREFIX}/${DARTMANIFEST}" >> ${LOGFILE}
${BINDIR}/manifesttool_dart -x ${VPNINSTPREFIX} ${VPNINSTPREFIX}/${DARTMANIFEST} >> ${LOGFILE}

for FILE in ${FILELIST}; do
  echo "rm -f ${FILE}" >> ${LOGFILE}
  rm -f ${FILE}
done

echo "Removing ${INSTPREFIX} folder" >> ${LOGFILE}
rm -rf ${INSTPREFIX} 

# update the menu cache so that the DART shortcut in the
# applications menu is removed. This is neccessary on some
# gnome desktops(Ubuntu 10.04)
if [ -x "/usr/share/gnome-menus/update-gnome-menus-cache" ]; then
    for CACHE_FILE in $(ls /usr/share/applications/desktop.*.cache); do
        echo "updating ${CACHE_FILE}" >> ${LOGFILE}
        /usr/share/gnome-menus/update-gnome-menus-cache /usr/share/applications/ > ${CACHE_FILE}
    done
fi

echo "Updating GTK icon cache" >> ${LOGFILE}
gtk-update-icon-cache -f -t /usr/share/icons/hicolor >> ${LOGFILE} 2>&1

echo "Successfully removed Cisco AnyConnect Diagnostics and Reporting Tool from the system." >> ${LOGFILE}
echo "Successfully removed Cisco AnyConnect Diagnostics and Reporting Tool from the system."

exit 0
