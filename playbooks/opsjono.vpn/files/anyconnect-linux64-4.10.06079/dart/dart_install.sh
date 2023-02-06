#!/bin/sh

BASH_BASE_SIZE=0x00000000
CISCO_AC_TIMESTAMP=0x0000000000000000
CISCO_AC_OBJNAME=1234567890123456789012345678901234567890123456789012345678901234
# BASH_BASE_SIZE=0x00000000 is required for signing
# CISCO_AC_TIMESTAMP is also required for signing
# comment is after BASH_BASE_SIZE or else sign tool will find the comment

version() { echo "$@" | awk -F. '{ printf("%d%03d%05d\n", $1,$2,$3); }'; }

checkInstalledVersion()
{
  failed=false
  # version of DART being installed has to be greater than the current DART version
  if [ -f ${DARTMANIFEST} ]; then
      DARTPREVVERSION=$(awk -F"\"" '/file version/ { print $2 }' ${DARTMANIFEST})
      DARTCURRVERSION=4.10.06079

      if [ $(version $DARTCURRVERSION) -le $(version $DARTPREVVERSION) ]; then
        failed=true
      fi
  fi

  if [ "$failed" = true ]; then
    if [ $(version $DARTCURRVERSION) -eq $(version $DARTPREVVERSION) ]; then
      echo "Version ${DARTCURRVERSION} is already installed!"
      echo "Version ${DARTCURRVERSION} is already installed!" >> /tmp/${LOGFNAME}
    else
      echo "A higher version ${DARTPREVVERSION} of DART is already installed!"
      echo "A higher version ${DARTPREVVERSION} of DART is already installed!" >> /tmp/${LOGFNAME}
    fi
    echo "Exiting now."
    echo "Exiting now." >> /tmp/${LOGFNAME}
    exit 1
  fi
}

LEGACY_DARTBIN="/opt/cisco/vpn/dart"
LEGACY_UNINSTALL="${LEGACY_DARTBIN}/dart_uninstall.sh"

INSTPREFIX="/opt/cisco/anyconnect"
VPNBIN="${INSTPREFIX}/bin"
DART="dart"
DARTDIR="${INSTPREFIX}/${DART}"
RESOURCESDIR="${DARTDIR}/resources"
CONFIGDIR="${DARTDIR}/xml/config"
REQUESTDIR="${DARTDIR}/xml/request"
UNINSTALL="${VPNBIN}/dart_uninstall.sh"
INSTALL=install
MARKER=$((`grep -an "[B]EGIN\ ARCHIVE" $0 | cut -d ":" -f 1` + 1))
MARKER_END=$((`grep -an "[E]ND\ ARCHIVE" $0 | cut -d ":" -f 1` - 1))
LOGFNAME=`date "+anyconnect-linux64-4.10.06079-dart-webdeploy-k9-%Y%m%d%H%M%S.log"`

DARTMANIFEST="${INSTPREFIX}/ACManifestDART.xml"

# Make sure we are root
if [ `id | sed -e 's/(.*//' ` != "uid=0" ]; then
    echo "Sorry, you need super user privileges to run this script."
    exit 1
fi

echo "Installing Cisco AnyConnect Diagnostics and Reporting Tool..."
echo "Installing Cisco AnyConnect Diagnostics and Reporting Tool..." > /tmp/${LOGFNAME}

echo `whoami` "invoked $0 from " `pwd` " at " `date` >>/tmp/${LOGFNAME}

# display license agreement 

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
                   echo "Please wait while Cisco DART is being installed..."
                   break
                   ;;
           [Yy])
                   echo "You have accepted the license agreement."
                   echo "Please wait while Cisco DART is being installed..."
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

checkInstalledVersion

if [ "`basename $0`" != "dart_install.sh" ]; then
# dartsetup.sh is the binary that's been called
  if which mktemp >/dev/null 2>&1; then
    TEMPDIR=`mktemp -d /tmp/dart.XXXXXX`
    RMTEMP="yes"
  else
    TEMPDIR="/tmp"
    RMTEMP="no"
  fi
else
# standalone
  TEMPDIR="."
fi

# check for and uninstall any previous version
if [ -x "${LEGACY_UNINSTALL}" ]; then
    echo "Removing previous installation..."
    echo "Removing previous installation: "${LEGACY_UNINSTALL} >> /tmp/${LOGFNAME}
    STATUS=`${LEGACY_UNINSTALL}`
    if [ "${STATUS}" ]; then
        echo "Error removing previous installation! Continuing..." >> /tmp/${LOGFNAME}
    fi
elif [ -x "${UNINSTALL}" ]; then
    echo "Removing previous installation..."
    echo "Removing previous installation: "${UNINSTALL} >> /tmp/${LOGFNAME}
    STATUS=`${UNINSTALL}`
    if [ "${STATUS}" ]; then
        echo "Error removing previous installation! Continuing..." >> /tmp/${LOGFNAME}
    fi
fi

echo "Installing Cisco DART..."

if [ "${TEMPDIR}" != "." ]; then
  TARNAME=`date +%N`
  TARFILE=${TEMPDIR}/dartinst${TARNAME}.tgz

  echo "Extracting installation files to ${TARFILE}..."
  echo "Extracting installation files to ${TARFILE}..." >> /tmp/${LOGFNAME}

  head -n ${MARKER_END} $0 | tail -n +${MARKER} | head -c -1 2>> /tmp/${LOGFNAME} > ${TARFILE} || exit 1

  echo "Unarchiving installation files to ${TEMPDIR}..."
  echo "Unarchiving installation files to ${TEMPDIR}..." >> /tmp/${LOGFNAME}
  tar xvzf ${TARFILE} -C ${TEMPDIR} >> /tmp/${LOGFNAME} 2>&1 || exit 1

  rm -f ${TARFILE}

  NEWTEMP="${TEMPDIR}/${DART}"
else
  NEWTEMP="."
fi

# make sure destination directories exist
# /opt/cisco/anyconnect/dart folder will be automatically created
echo "Installing :${VPNBIN}" >> /tmp/${LOGFNAME}
${INSTALL} -d ${VPNBIN} || exit 1
echo "Installing "${RESOURCESDIR} >> /tmp/${LOGFNAME}
${INSTALL} -d ${RESOURCESDIR} || exit 1
echo "Installing "${CONFIGDIR} >> /tmp/${LOGFNAME}
${INSTALL} -d ${CONFIGDIR} || exit 1
echo "Installing "${REQUESTDIR} >> /tmp/${LOGFNAME}
${INSTALL} -d ${REQUESTDIR} || exit 1

#Copy files to their home
if [ -f "${NEWTEMP}/dart_uninstall.sh" ]; then
    echo "Installing "${NEWTEMP}/dart_uninstall.sh >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/dart_uninstall.sh ${VPNBIN} || exit 1
else
    echo "${NEWTEMP}/dart_uninstall.sh does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/dartui" ]; then 
    echo "Installing "${NEWTEMP}/dartui >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/dartui ${DARTDIR} || exit 1
else
    echo "${NEWTEMP}/dartui does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/dartcli" ]; then
    echo "Installing "${NEWTEMP}/dartcli >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/dartcli ${DARTDIR} || exit 1
else
    echo "${NEWTEMP}/dartui does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/darthelper" ]; then
    echo "Installing "${NEWTEMP}/darthelper >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/darthelper ${DARTDIR} || exit 1
else
    echo "${NEWTEMP}/darthelper does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/libdartdbusclient.so" ]; then
    echo "Installing "${NEWTEMP}/libdartdbusclient.so >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/libdartdbusclient.so ${DARTDIR} || exit 1
else
    echo "${NEWTEMP}/libdartdbusclient.so does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/com.cisco.anyconnect.dart.helper.service" ]; then
    echo "Installing "${NEWTEMP}/com.cisco.anyconnect.dart.helper.service >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/com.cisco.anyconnect.dart.helper.service /usr/share/dbus-1/system-services/com.cisco.anyconnect.dart.helper.service || exit 1
else
    echo "${NEWTEMP}/com.cisco.anyconnect.dart.helper.service does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/com.cisco.anyconnect.dart.policy" ]; then
    echo "Installing "${NEWTEMP}/com.cisco.anyconnect.dart.policy >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/com.cisco.anyconnect.dart.policy /usr/share/polkit-1/actions/com.cisco.anyconnect.dart.policy || exit 1
else
    echo "${NEWTEMP}/com.cisco.anyconnect.dart.policy does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/com.cisco.anyconnect.dart.conf" ]; then
    echo "Installing "${NEWTEMP}/com.cisco.anyconnect.dart.conf >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/com.cisco.anyconnect.dart.conf /etc/dbus-1/system.d/com.cisco.anyconnect.dart.conf || exit 1
else
    echo "${NEWTEMP}/com.cisco.anyconnect.dart.conf does not exist. It will not be installed."
fi

if [ -d "${NEWTEMP}/resources" ]; then
    for FILE in ${NEWTEMP}/resources/*; do
        echo "Installing ${FILE}" >> /tmp/${LOGFNAME}
        ${INSTALL} -o root -m 444 ${FILE} ${RESOURCESDIR} || exit 1
    done
else
    echo "resources not found... Installation failed."
    exit 1;
fi

if [ -f "${NEWTEMP}/AnyConnectConfig.xml" ]; then
    echo "Installing "${NEWTEMP}/AnyConnectConfig.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/AnyConnectConfig.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/AnyConnectConfig.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/BaseConfig.xml" ]; then
    echo "Installing "${NEWTEMP}/BaseConfig.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/BaseConfig.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/BaseConfig.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/Posture.xml" ]; then 
    echo "Installing "${NEWTEMP}/Posture.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/Posture.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/Posture.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/ISEPosture.xml" ]; then
    echo "Installing "${NEWTEMP}/ISEPosture.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/ISEPosture.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/ISEPosture.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/NetworkVisibility.xml" ]; then
    echo "Installing "${NEWTEMP}/NetworkVisibility.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/NetworkVisibility.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/NetworkVisibility.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/DART.xml" ]; then
    echo "Installing "${NEWTEMP}/DART.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/DART.xml ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/DART.xml does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/ConfigXMLSchema.xsd" ]; then
    echo "Installing "${NEWTEMP}/ConfigXMLSchema.xsd >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/ConfigXMLSchema.xsd ${CONFIGDIR} || exit 1
else
    echo "${NEWTEMP}/ConfigXMLSchema.xsd does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/RequestXMLSchema.xsd" ]; then
    echo "Installing "${NEWTEMP}/RequestXMLSchema.xsd >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/RequestXMLSchema.xsd ${REQUESTDIR} || exit 1
else
    echo "${NEWTEMP}/RequestXMLSchema.xsd does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/cisco-anyconnect-dart.menu" ]; then
    echo "Installing ${NEWTEMP}/cisco-anyconnect-dart.menu" >> /tmp/${LOGFNAME}
    mkdir -p /etc/xdg/menus/applications-merged || exit
    # there may be an issue where the panel menu doesn't get updated when the applications-merged 
    # folder gets created for the first time.
    # This is an ubuntu bug. https://bugs.launchpad.net/ubuntu/+source/gnome-panel/+bug/369405

    ${INSTALL} -o root -m 644 ${NEWTEMP}/cisco-anyconnect-dart.menu /etc/xdg/menus/applications-merged/
else
    echo "${NEWTEMP}/cisco-anyconnect-dart.menu does not exist. It will not be installed."
fi


if [ -f "${NEWTEMP}/cisco-anyconnect-dart.directory" ]; then
    echo "Installing ${NEWTEMP}/cisco-anyconnect-dart.directory" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/cisco-anyconnect-dart.directory /usr/share/desktop-directories/
else
    echo "${NEWTEMP}/cisco-anyconnect-dart.directory does not exist. It will not be installed."
fi


# if the update cache utility exists then update the menu cache
# otherwise on some gnome systems, the short cut will disappear
# after user logoff or reboot. This is neccessary on some gnome desktops.
if [ -f "${NEWTEMP}/com.cisco.anyconnect.dart.desktop" ]; then
    echo "Installing "${NEWTEMP}/com.cisco.anyconnect.dart.desktop >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/com.cisco.anyconnect.dart.desktop /usr/share/applications || exit 1
    if [ -x "/usr/share/gnome-menus/update-gnome-menus-cache" ]; then
        for CACHE_FILE in $(ls /usr/share/applications/desktop.*.cache); do
            echo "updating ${CACHE_FILE}" > /tmp/${LOGFNAME}
            /usr/share/gnome-menus/update-gnome-menus-cache /usr/share/applications/ > ${CACHE_FILE}
        done
    fi
else
    echo "${NEWTEMP}/com.cisco.anyconnect.dart.desktop does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/resources/dartTypical.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical.png /usr/share/icons/hicolor/48x48/apps/cisco-anyconnect-dart.png
else
    echo "${NEWTEMP}/resources/dartTypical.png does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/resources/dartTypical64.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical64.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical64.png /usr/share/icons/hicolor/64x64/apps/cisco-anyconnect-dart.png
else
    echo "${NEWTEMP}/resources/dartTypical64.png does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/resources/dartTypical96.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical96.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical96.png /usr/share/icons/hicolor/96x96/apps/cisco-anyconnect-dart.png
else
    echo "${NEWTEMP}/resources/dartTypical96.png does not exist. It will not be installed."
fi


if [ -f "${NEWTEMP}/resources/dartTypical128.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical128.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical128.png /usr/share/icons/hicolor/128x128/apps/cisco-anyconnect-dart.png
else
    echo "${NEWTEMP}/resources/dartTypical128.png does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/resources/dartTypical256.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical256.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical256.png /usr/share/icons/hicolor/256x256/apps/cisco-anyconnect-dart.png
else
    echo "${NEWTEMP}/resources/dartTypical256.png does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/resources/dartTypical512.png" ]; then
    echo "Installing ${NEWTEMP}/resources/dartTypical512.png" >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 644 ${NEWTEMP}/resources/dartTypical512.png /usr/share/icons/hicolor/512x512/apps/cisco-anyconnect-dart.png >/dev/null 2>&1
else
    echo "${NEWTEMP}/resources/dartTypical512.png does not exist. It will not be installed."
fi

echo "Updating GTK icon cache" >> /tmp/${LOGFNAME}
gtk-update-icon-cache -f -t /usr/share/icons/hicolor >> /tmp/${LOGFNAME}  2>&1

if [ -f "${NEWTEMP}/manifesttool_dart" ]; then
    echo "Installing "${NEWTEMP}/manifesttool_dart >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 755 ${NEWTEMP}/manifesttool_dart ${VPNBIN} || exit 1
else
    echo "${NEWTEMP}/manifesttool_dart does not exist. It will not be installed."
fi

if [ -f "${NEWTEMP}/ACManifestDART.xml" ]; then
    echo "Installing "${NEWTEMP}/ACManifestDART.xml >> /tmp/${LOGFNAME}
    ${INSTALL} -o root -m 444 ${NEWTEMP}/ACManifestDART.xml ${INSTPREFIX} || exit 1
else
    echo "${NEWTEMP}/ACManifestDART.xml does not exist. It will not be installed."
fi

# generate/update the VPNManifest.dat file
if [ -f ${VPNBIN}/manifesttool_dart ]; then
    ${VPNBIN}/manifesttool_dart -i ${INSTPREFIX} ${INSTPREFIX}/ACManifestDART.xml
fi

if [ "${RMTEMP}" = "yes" ]; then
    echo rm -rf ${TEMPDIR} >> /tmp/${LOGFNAME}
    rm -rf ${TEMPDIR}
fi

echo "Done!"
echo "Done!" >> /tmp/${LOGFNAME}

# move the log file to the installed directory
mv /tmp/${LOGFNAME} ${DARTDIR}

exit 0;

--BEGIN ARCHIVE--
