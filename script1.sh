#!/bin/bash

STUDENT_NAME="Mradula Chouhan"
REG_NO="24BCE11337"
SOFTWARE_CHOICE="MySQL"
LICENSE_NAME="GNU General Public License v2 (GPL v2)"

KERNEL=$(uname -r)
DISTRO=$(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S %Z')

echo "========================================================"
echo "         Open Source Audit - System Identity Report      "
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Reg. No   : $REG_NO"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------"
echo "  System Information"
echo "--------------------------------------------------------"
echo "  Distribution  : $DISTRO"
echo "  Kernel Version: $KERNEL"
echo "  Logged-in User: $USER_NAME"
echo "  Home Directory: $HOME_DIR"
echo "  System Uptime : $UPTIME"
echo "  Date          : $CURRENT_DATE"
echo "  Time          : $CURRENT_TIME"
echo ""
echo "--------------------------------------------------------"
echo "  License Information"
echo "--------------------------------------------------------"
echo "  The OS kernel (Linux) is covered under:"
echo "  $LICENSE_NAME"
echo ""
echo "  MySQL is also distributed under: $LICENSE_NAME"
echo "  (with a commercial dual-licensing option)"
echo "========================================================"
