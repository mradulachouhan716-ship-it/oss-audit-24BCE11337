#!/bin/bash

PACKAGE="mysql"

if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    PKG_MANAGER="none"
fi

INSTALLED=false

if [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l | grep -iq "$PACKAGE" &>/dev/null; then
        INSTALLED=true
        VERSION=$(dpkg -l | grep -i "$PACKAGE" | awk '{print $3}' | head -1)
        LICENSE_INFO="GPL v2"
        SUMMARY=$(dpkg -s mysql-server 2>/dev/null | grep Description | head -1 | cut -d: -f2)
    fi
elif [ "$PKG_MANAGER" = "rpm" ]; then
    if rpm -q mysql &>/dev/null || rpm -q mysql-server &>/dev/null; then
        INSTALLED=true
        VERSION=$(rpm -qi mysql 2>/dev/null | grep Version | awk '{print $3}' | head -1)
        LICENSE_INFO=$(rpm -qi mysql 2>/dev/null | grep License | awk -F: '{print $2}' | xargs)
        SUMMARY=$(rpm -qi mysql 2>/dev/null | grep Summary | awk -F: '{print $2}' | xargs)
    fi
fi

if command -v mysql &>/dev/null || command -v mysqld &>/dev/null; then
    INSTALLED=true
    VERSION=$(mysql --version 2>/dev/null | awk '{print $5}' | tr -d ',')
    [ -z "$VERSION" ] && VERSION=$(mysqld --version 2>/dev/null | awk '{print $4}')
    LICENSE_INFO="GPL v2 / Commercial"
    SUMMARY="MySQL Database Management System"
fi

echo "========================================================"
echo "         FOSS Package Inspector                          "
echo "========================================================"
echo ""

if [ "$INSTALLED" = true ]; then
    echo "  Status  : $PACKAGE is INSTALLED on this system."
    echo "  Version : ${VERSION:-Not detected}"
    echo "  License : ${LICENSE_INFO:-GPL v2}"
    echo "  Summary : ${SUMMARY:-MySQL - Open Source Relational Database}"
else
    echo "  Status  : $PACKAGE is NOT installed on this system."
    echo "  You can install it using:"
    echo "    Ubuntu/Debian : sudo apt install mysql-server"
    echo "    RHEL/CentOS   : sudo yum install mysql-server"
fi

echo ""
echo "--------------------------------------------------------"
echo "  Open Source Philosophy Notes"
echo "--------------------------------------------------------"

case $PACKAGE in
    mysql)
        echo "  MySQL: The backbone of millions of web applications worldwide,"
        echo "  MySQL is an open-source relational database that put structured"
        echo "  data management in the hands of developers everywhere for free."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet - powering"
        echo "  over 30 percent of all active websites, it proved open source"
        echo "  could outperform any proprietary alternative."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's answer to a closed web - Mozilla's browser"
        echo "  champions privacy and open standards against corporate browsers."
        ;;
    vlc)
        echo "  VLC: Born in a French university dorm, VLC plays literally anything"
        echo "  and ships with no proprietary codecs - freedom in multimedia form."
        ;;
    git)
        echo "  Git: Linus Torvalds built git in two weeks when proprietary version"
        echo "  control failed him - today it powers every major software project."
        ;;
    *)
        echo "  $PACKAGE: An open-source tool that embodies the spirit of shared"
        echo "  knowledge, community development, and software freedom."
        ;;
esac

echo "========================================================"
