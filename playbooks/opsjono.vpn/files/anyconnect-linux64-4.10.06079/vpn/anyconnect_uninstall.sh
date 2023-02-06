#!/bin/sh

ANYCONNECT_BINDIR="/opt/cisco/anyconnect/bin"
NVM_BINDIR="/opt/cisco/anyconnect/NVM/bin"
POSTURE_BINDIR="/opt/cisco/hostscan/bin"

VPN_UNINST=${ANYCONNECT_BINDIR}/vpn_uninstall.sh
POSTURE_UNINST=${POSTURE_BINDIR}/posture_uninstall.sh
NVM_UNINST=${NVM_BINDIR}/nvm_uninstall.sh
ISEPOSTURE_UNINST=${ANYCONNECT_BINDIR}/iseposture_uninstall.sh
ISECOMPLIANCE_UNINST=${ANYCONNECT_BINDIR}/isecompliance_uninstall.sh

if [ -x "${ISECOMPLIANCE_UNINST}" ]; then
  ${ISECOMPLIANCE_UNINST}
  if [ $? -ne 0 ]; then
    echo "Error uninstalling AnyConnect ISE Compliance Module."
  fi
fi

if [ -x "${ISEPOSTURE_UNINST}" ]; then
  ${ISEPOSTURE_UNINST}
  if [ $? -ne 0 ]; then
    echo "Error uninstalling AnyConnect ISE Posture Module."
  fi
fi

if [ -x "${POSTURE_UNINST}" ]; then
  ${POSTURE_UNINST}
  if [ $? -ne 0 ]; then
    echo "Error uninstalling AnyConnect Posture Module."
  fi
fi

if [ -x "${NVM_UNINST}" ]; then
  ${NVM_UNINST}
  if [ $? -ne 0 ]; then
  echo "Error uninstalling Network Visibility Module."
  fi
fi


if [ -x "${VPN_UNINST}" ]; then
  ${VPN_UNINST}
  if [ $? -ne 0 ]; then
    echo "Error uninstalling AnyConnect Secure Mobility Client."
  fi
fi

exit 0
