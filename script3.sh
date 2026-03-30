#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Aniket Pandey | Reg: 24BSA10012

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # --max-depth=0 stops it from scanning inside, prevents hanging on /tmp
        SIZE=$(du -sh --max-depth=0 "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

# Check if Git's config file exists and print its permissions
echo ""
echo "Checking Git config..."
GIT_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "$GIT_CONFIG => Permissions: $PERMS"
else
    echo "No git config file found at $GIT_CONFIG"
fi