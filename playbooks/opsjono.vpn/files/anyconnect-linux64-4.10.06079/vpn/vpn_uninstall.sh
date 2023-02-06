#!/bin/sh

INSTPREFIX="/opt/cisco/anyconnect"
NVM_DIR="${INSTPREFIX}/NVM"
ROOTCERTSTORE=/opt/.cisco/certificates/ca
ROOTCACERT="DigiCertAssuredIDRootCA.pem"
ROOTCACERT_OLD="VeriSignClass3PublicPrimaryCertificationAuthority-G5.pem"
BINDIR="${INSTPREFIX}/bin"
LIBDIR="${INSTPREFIX}/lib"
PROFDIR="${INSTPREFIX}/profile"
SCRIPTDIR="${INSTPREFIX}/script"
HELPDIR="${INSTPREFIX}/help"
PLUGINDIR="${BINDIR}/plugins"
MENUDIR="/etc/xdg/menus/applications-merged/"
DIRECTORYDIR="/usr/share/desktop-directories/"
DESKTOPDIR="/usr/share/applications"
ICONSDIR="/usr/share/icons"
INIT="vpnagentd"
SYSTEMD_CONF="/etc/systemd/system/vpnagentd.service"
AGENT="vpnagentd"
SYSVSTART="S85"
SYSVSTOP="K25"
SYSVLEVELS="2 3 4 5"
ACMANIFESTDAT="${INSTPREFIX}/VPNManifest.dat"
VPNMANIFEST="ACManifestVPN.xml"
LOGDIR="/var/log/anyconnect"
UNINSTALLLOG="${LOGDIR}/vpn-uninstall.log"

# List of files to remove
FILELIST="${BINDIR}/vpnagentd \
          ${BINDIR}/vpn_uninstall.sh \
          ${BINDIR}/anyconnect_uninstall.sh \
          ${LIBDIR}/libacciscossl.so \
          ${LIBDIR}/libacciscocrypto.so \
          ${LIBDIR}/cfom.so \
          ${LIBDIR}/libaccurl.so.4 \
          ${LIBDIR}/libaccurl.so.4.8.0 \
          ${LIBDIR}/libvpnagentutilities.so \
          ${LIBDIR}/libvpncommon.so \
          ${LIBDIR}/libvpncommoncrypt.so \
          ${LIBDIR}/libvpnapi.so \
          ${LIBDIR}/libacruntime.so \
          ${BINDIR}/vpnui \
          ${BINDIR}/vpn \
          ${BINDIR}/vpndownloader \
          ${BINDIR}/vpndownloader-cli \
          ${PLUGINDIR}/libacdownloader.so \
          ${BINDIR}/acinstallhelper \
          ${BINDIR}/acwebhelper \
          ${BINDIR}/acextwebhelper \
          ${BINDIR}/manifesttool \
          ${BINDIR}/manifesttool_vpn \
          ${BINDIR}/load_tun.sh \
          ${MENUDIR}/cisco-anyconnect.menu \
          ${DIRECTORYDIR}/cisco-anyconnect.directory \
          ${DESKTOPDIR}/com.cisco.anyconnect.gui.desktop \
          ${ICONSDIR}/hicolor/48x48/apps/cisco-anyconnect.png \
          ${ICONSDIR}/hicolor/64x64/apps/cisco-anyconnect.png \
          ${ICONSDIR}/hicolor/96x96/apps/cisco-anyconnect.png \
          ${ICONSDIR}/hicolor/128x128/apps/cisco-anyconnect.png \
          ${ICONSDIR}/hicolor/256x256/apps/cisco-anyconnect.png \
          ${ICONSDIR}/hicolor/512x512/apps/cisco-anyconnect.png \
          ${INSTPREFIX}/resources/* \
          ${INSTPREFIX}/${VPNMANIFEST} \
          ${INSTPREFIX}/update.txt \
          ${INSTPREFIX}/OpenSource.html \
          ${PROFDIR}/AnyConnectProfile.xsd \
          ${INSTPREFIX}/AnyConnectLocalPolicy.xsd \
          ${LIBDIR}/libboost_date_time.so* \
          ${LIBDIR}/libboost_filesystem.so* \
          ${LIBDIR}/libboost_system.so* \
          ${LIBDIR}/libboost_thread.so* \
          ${LIBDIR}/libboost_signals.so* \
          ${LIBDIR}/libboost_chrono.so* \
          ${LIBDIR}/libboost_regex.so* \
          ${PLUGINDIR}/libvpnipsec.so \
          ${PLUGINDIR}/libacfeedback.so \
          ${PLUGINDIR}/libacwebhelper.so \
          ${ROOTCERTSTORE}/${ROOTCACERT} \
          ${ROOTCERTSTORE}/${ROOTCACERT_OLD}"

# Create log directory if not exist
if [ ! -d ${LOGDIR} ]; then
  mkdir -p ${LOGDIR} >/dev/null 2>&1
fi

echo "Uninstalling Cisco AnyConnect Secure Mobility Client..."
echo "Uninstalling Cisco AnyConnect Secure Mobility Client..." > ${UNINSTALLLOG}
echo `whoami` "invoked $0 from " `pwd` " at " `date` >> ${UNINSTALLLOG}

# Check for root privileges
if [ `id | sed -e 's/(.*//'` != "uid=0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  echo "Sorry, you need super user privileges to run this script." >> ${UNINSTALLLOG}
  exit 1
fi

# update the VPNManifest.dat
echo "${BINDIR}/manifesttool_vpn -x ${INSTPREFIX} ${INSTPREFIX}/${VPNMANIFEST}" >> ${UNINSTALLLOG}
${BINDIR}/manifesttool_vpn -x ${INSTPREFIX} ${INSTPREFIX}/${VPNMANIFEST} >> ${UNINSTALLLOG}

# We need to check for, and try to remove, our init script.
if [ `chkconfig --list 2> /dev/null | wc -l` -gt 0 ]; then
  chkconfig --del ${INIT} >/dev/null 2>&1 # We don't exit on error in case user manually
                                          # removed from chkconfig
fi

if [ -e "/etc/init.d/${INIT}" ]; then
  INITD="/etc/init.d"
elif [ -e "/etc/rc.d/init.d/${INIT}" ]; then
  INITD="/etc/rc.d/init.d"
else
  INITD="/etc/rc.d"
fi

if [ -d "/etc/rc.d" ]; then
  RCD="/etc/rc.d"
else
  RCD="/etc"
fi

# Make sure our runlevel symlinks are removed, in case of BSD-style init
for LEVEL in ${SYSVLEVELS}; do
  DIR="rc${LEVEL}.d"
  if [ -d "${RCD}/${DIR}" ]; then
    echo "rm -f ${RCD}/${DIR}/${SYSVSTART}${INIT}" >> ${UNINSTALLLOG}
    rm -f ${RCD}/${DIR}/${SYSVSTART}${INIT}
    echo "rm -f ${RCD}/${DIR}/${SYSVSTOP}${INIT}" >> ${UNINSTALLLOG}
    rm -f ${RCD}/${DIR}/${SYSVSTOP}${INIT}
  fi
done

# Attempt to stop the service if it is running, and remove the init script.
if [ "x${INITD}" != "x" ]; then
  echo "Stopping the VPN agent..." >> ${UNINSTALLLOG}
  TESTINIT=`ls -l /proc/1/exe`
  if [ -z "${TESTINIT##*"systemd"*}" ]; then
    echo systemctl stop ${INIT} >> ${UNINSTALLLOG}
    systemctl stop ${INIT} >> ${UNINSTALLLOG} 2>&1
    echo systemctl disable ${INIT} >> ${UNINSTALLLOG}
    systemctl disable ${INIT} >> ${UNINSTALLLOG} 2>&1
  else
    echo "${INITD}/${INIT} stop" >> ${UNINSTALLLOG}
    ${INITD}/${INIT} stop >> ${UNINSTALLLOG}
  fi
  echo "rm ${INITD}/${INIT}" >> ${UNINSTALLLOG}
  logger "Stopping the VPN agent..."

  max_seconds_to_wait=10
  ntests=$max_seconds_to_wait
  # Wait up to max_seconds_to_wait seconds for the agent to finish.
  while [ -n "`ps -A -o command | grep \"/opt/cisco/anyconnect/bin/${AGENT}\" | egrep -v 'grep'`" ]
    do
        ntests=`expr  $ntests - 1`
        if [ $ntests -eq 0 ]; then
          logger "Timeout waiting for agent to stop."
          echo "Timeout waiting for agent to stop." >> ${UNINSTALLLOG}
          break
        fi
        sleep 1
    done
  
  if [ -e ${INITD}/${INIT} ]; then
    rm ${INITD}/${INIT} || echo "Warning: unable to remove init script"
  fi

  if [ -e ${SYSTEMD_CONF} ]; then
    rm ${SYSTEMD_CONF} || echo "Warning: unable to remove systemd conf"
  fi   
fi

# ensure that the agent, gui and cli are not running
OURPROCS=`ps -A -o pid,command | grep '/opt/cisco/anyconnect/bin' | egrep -v 'grep|vpn_uninstall|anyconnect_uninstall' | awk '{print $1}'`
if [ -n "${OURPROCS}" ] ; then
    for DOOMED in ${OURPROCS}; do
        echo Killing `ps -A -o pid,command -p ${DOOMED} | grep ${DOOMED} | egrep -v 'ps|grep'` >> ${UNINSTALLLOG}
        kill -KILL ${DOOMED} >> ${UNINSTALLLOG} 2>&1
    done
fi

# Remove only those files that we know we installed
for FILE in ${FILELIST}; do
  echo "rm -f ${FILE}" >> ${UNINSTALLLOG}
  rm -f ${FILE} >> ${UNINSTALLLOG} 2>&1
done

# Remove desktop file in Autostart Directory
if [ -z "$XDG_CONFIG_DIRS" ]; then
    AUTOSTART_DIR=/etc/xdg/autostart
else
    AUTOSTART_DIR=$XDG_CONFIG_DIRS
fi
echo "rm -f $AUTOSTART_DIR/com.cisco.anyconnect.gui.desktop" >> ${UNINSTALLLOG}
rm -f $AUTOSTART_DIR/com.cisco.anyconnect.gui.desktop >> ${UNINSTALLLOG} 2>&1

# Remove the plugins directory
echo "rm -rf ${PLUGINDIR}" >> ${UNINSTALLLOG}
rm -rf ${PLUGINDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the bin directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${BINDIR}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${BINDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the lib directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${LIBDIR}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${LIBDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the script directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${SCRIPTDIR}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${SCRIPTDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the help directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${HELPDIR}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${HELPDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the profile directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${PROFDIR}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${PROFDIR} >> ${UNINSTALLLOG} 2>&1

# Remove the cert store directory if it is empty
echo "rmdir --ignore-fail-on-non-empty ${ROOTCERTSTORE}" >> ${UNINSTALLLOG}
rmdir --ignore-fail-on-non-empty ${ROOTCERTSTORE} >> ${UNINSTALLLOG} 2>&1

# update the menu cache so that the AnyConnect short cut in the
# applications menu is removed. This is neccessary on some
# gnome desktops(Ubuntu 10.04)
if [ -x "/usr/share/gnome-menus/update-gnome-menus-cache" ]; then
    for CACHE_FILE in $(ls /usr/share/applications/desktop.*.cache); do
        echo "updating ${CACHE_FILE}" >> ${UNINSTALLLOG}
        /usr/share/gnome-menus/update-gnome-menus-cache /usr/share/applications/ > ${CACHE_FILE}
    done
fi

echo "Updating GTK icon cache" >> ${UNINSTALLLOG}
gtk-update-icon-cache -f -t /usr/share/icons/hicolor >> ${UNINSTALLLOG} 2>&1

echo "Successfully removed Cisco AnyConnect Secure Mobility Client from the system." >> ${UNINSTALLLOG}
echo "Successfully removed Cisco AnyConnect Secure Mobility Client from the system."
exit 0

