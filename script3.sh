#!/bin/bash

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

MYSQL_CONFIG_DIRS=("/etc/mysql" "/etc/my.cnf.d" "/var/lib/mysql" "/var/log/mysql")

echo "========================================================"
echo "         Disk and Permission Auditor                     "
echo "========================================================"
echo ""
echo "  Auditing standard system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "Directory" "Permissions (perms user grp)" "Size"
echo "  ---------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" 2>/dev/null | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "  %-20s %-25s\n" "$DIR" "Directory does not exist"
    fi
done

echo ""
echo "--------------------------------------------------------"
echo "  MySQL Configuration Directory Audit"
echo "--------------------------------------------------------"
echo ""

MYSQL_FOUND=false

for MDIR in "${MYSQL_CONFIG_DIRS[@]}"; do
    if [ -d "$MDIR" ]; then
        MYSQL_FOUND=true
        PERMS=$(ls -ld "$MDIR" 2>/dev/null | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$MDIR" 2>/dev/null | cut -f1)
        echo "  Found   : $MDIR"
        echo "  Perms   : $PERMS"
        echo "  Size    : ${SIZE:-N/A}"
        echo ""
    fi
done

if [ -f "/etc/my.cnf" ]; then
    MYSQL_FOUND=true
    PERMS=$(ls -l /etc/my.cnf 2>/dev/null | awk '{print $1, $3, $4}')
    echo "  Found   : /etc/my.cnf"
    echo "  Perms   : $PERMS"
    echo ""
fi

if [ "$MYSQL_FOUND" = false ]; then
    echo "  MySQL config directories not found on this system."
    echo "  Expected paths: /etc/mysql, /etc/my.cnf.d, /var/lib/mysql"
    echo "  Install MySQL to populate these directories."
fi

echo "========================================================"
