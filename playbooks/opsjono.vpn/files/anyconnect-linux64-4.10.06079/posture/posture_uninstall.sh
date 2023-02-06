#!/bin/sh

INSTPREFIX="/opt/cisco/hostscan"
BINDIR="${INSTPREFIX}/bin"
LIBDIR="${INSTPREFIX}/lib"
INIT_SRC="ciscod_init"
INIT="ciscod"
SYSVSTART="S85"
SYSVSTOP="K25"
SYSVLEVELS="2 3 4 5"
LOGDIR="/var/log/anyconnect"
LOG="${LOGDIR}/posture-uninstall.log"

# Create log directory if not exist
if [ ! -d ${LOGDIR} ]; then
  mkdir -p ${LOGDIR} >/dev/null 2>&1
fi

DIR=`dirname $0 2> /dev/null` || 
  DIR=`/usr/bin/dirname $0 2> /dev/null` || 
  DIR=`/bin/dirname $0 2> /dev/null` || 
  DIR=.

ID=`id -u  2> /dev/null` || ID=`/usr/bin/id -u  2> /dev/null` ||
  ID=`/usr/bin/id -u  2> /dev/null`

# Find out  if we are using insserv
if [ -x "/sbin/insserv" ]; then
    INSSERV="/sbin/insserv"
elif [ -x "/usr/sbin/insserv" ]; then
    INSSERV="/usr/sbin/insserv"
fi
${INSSERV} > /dev/null 2> /dev/null
if [ $? != 0 ]; then
    INSSERV=""
fi

# Find out if we are using chkconfig
if [ -x "/sbin/chkconfig" ]; then
  CHKCONFIG="/sbin/chkconfig"
elif [ -x "/usr/sbin/chkconfig" ]; then
  CHKCONFIG="/usr/sbin/chkconfig"
else
  CHKCONFIG="chkconfig"
fi
if [ `${CHKCONFIG} --list 2> /dev/null | wc -l` -lt 1 ]; then
  CHKCONFIG=""
  echo "(chkconfig not found or not used)" >> ${LOG}
fi

# Find out if we are using update-rc.d
if [ -x "/usr/sbin/update-rc.d" ]; then
    UPDATERCD="/usr/sbin/update-rc.d"
elif [ -x "/sbin/update-rc.d" ]; then
    UPDATERCD="/sbin/update-rc.d"
else
    UPDATERCD="update-rc.d"
fi
${UPDATERCD} > /dev/null 2> /dev/null
if [ $? = 127 ]; then
    UPDATERCD=""
fi

echo "Uninstalling Cisco AnyConnect Posture Module..."
echo "Uninstalling Cisco AnyConnect Posture Module..." > "${LOG}"
echo `whoami` "invoked $0 from " `pwd` " at " `date` >> "${LOG}"

# Check for root privileges
if [ "x${ID}" != "x0" ]; then
  echo "Sorry, you need super user privileges to run this script."
  echo "Sorry, you need super user privileges to run this script." >> "${LOG}"
  exit 1
fi

echo -n "Determining system initialization script location ..."
if [ -e "/etc/init.d/${INIT}" ]; then
  INITD="/etc/init.d"
elif [ -e "/etc/rc.d/init.d/${INIT}" ]; then
  INITD="/etc/rc.d/init.d"
elif [ -e "/etc/rc.d/${INIT}" ]; then
  INITD="/etc/rc.d"
elif [ -d "/etc/init.d" ]; then
  INITD="/etc/init.d"
elif [ -d "/etc/rc.d/init.d" ]; then
  INITD="/etc/rc.d/init.d"
else
  INITD="/etc/rc.d"
fi

if [ -d "/etc/rc.d" ]; then
  RCD="/etc/rc.d"
else
  RCD="/etc"
fi
echo "done."

if [ "x${INITD}" != "x" ]; then
  echo -n "Stopping the security agent... " 
  echo "Stopping the security agent..." >> "${LOG}"
  echo "${INITD}/${INIT} stop" >> "${LOG}"
  ${INITD}/${INIT} stop >> "${LOG}" 2> /dev/null
  echo "done."
  logger "Stopping the security agent..."
fi

echo -n "Removing the system initialization script "
if [ "x${INSSERV}" != "x" ]; then
    echo -n "(using insserv)... "
    echo ${INSSERV} -r ${INIT} >> ${LOG}
    ${INSSERV} -r ${INIT} >> ${LOG} 2> /dev/null
elif [ "x${CHKCONFIG}" != "x" ]; then
    echo -n "(using chkconfig)... "
    echo ${CHKCONFIG} --del ${INIT} >> ${LOG}
    ${CHKCONFIG} --del ${INIT} >> ${LOG} 2> /dev/null
elif [ "x${UPDATERCD}" != "x" ]; then
    echo -n "(using update-rc.d)... "
    echo ${UPDATERCD} -f ${INIT} remove >> ${LOG}
    ${UPDATERCD} -f ${INIT} remove >> ${LOG} 2> /dev/null
else
    echo -n "(using brute force)... "
# Make sure our runlevel symlinks are removed, in case of BSD-style init
    for LEVEL in ${SYSVLEVELS}; do
	DIR="rc${LEVEL}.d"
	if [ -d "${RCD}/${DIR}" ]; then
	    echo "rm -f ${RCD}/${DIR}/${SYSVSTART}${INIT}" >> "${LOG}"
	    rm -f ${RCD}/${DIR}/${SYSVSTART}${INIT}
	    echo "rm -f ${RCD}/${DIR}/${SYSVSTOP}${INIT}" >> "${LOG}"
	    rm -f ${RCD}/${DIR}/${SYSVSTOP}${INIT}
	fi
    done
fi
echo "done."
# 
if [ "x${INITD}" != "x" ]; then
  echo "rm ${INITD}/${INIT}" >> "${LOG}"
  rm -f ${INITD}/${INIT} || echo "Warning: unable to remove init script"
fi

# update the VPNManifest.dat
ANYCONNECT_INSTPREFIX="/opt/cisco/anyconnect"
POSTUREMANIFEST="ACManifestPOS.xml"

echo "${BINDIR}/manifesttool_posture -x ${ANYCONNECT_INSTPREFIX} ${ANYCONNECT_INSTPREFIX}/${POSTUREMANIFEST}" >> "${LOG}"
${BINDIR}/manifesttool_posture -x ${ANYCONNECT_INSTPREFIX} ${ANYCONNECT_INSTPREFIX}/${POSTUREMANIFEST} >> "${LOG}"

rm -f ${ANYCONNECT_INSTPREFIX}/${POSTUREMANIFEST}

# Remove the main directory.
echo -n "Removing installed files... "
if [ -d ${INSTPREFIX} ]; then
  echo "rm -rf ${INSTPREFIX}" >> "${LOG}"
  rm -rf ${INSTPREFIX} >> "${LOG}" 2>&1
fi
echo "done."

echo "Successfully removed Cisco AnyConnect Posture Module from the system." >> "${LOG}"
echo "Successfully removed Cisco AnyConnect Posture Module from the system."

exit 0
