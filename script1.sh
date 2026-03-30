#!/bin/bash
# Script 1: System Identity Report
# Author: Aniket Pandey | Reg: 24BSA10012 | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="Aniket Pandey"
SOFTWARE_CHOICE="Git"

# --- Helpers ---
get_uptime() {
	# Preferred: native uptime command (Linux/Unix)
	if command -v uptime >/dev/null 2>&1; then
		if uptime -p >/dev/null 2>&1; then
			uptime -p | sed 's/^up //'
			return
		fi
		uptime 2>/dev/null | awk '{print $3, $4}' | tr -d ','
		return
	fi

	# Fallback: /proc/uptime (available on many Unix-like environments)
	if [ -r /proc/uptime ]; then
		local total days hours mins
		total=$(awk '{print int($1)}' /proc/uptime)
		days=$((total / 86400))
		hours=$(((total % 86400) / 3600))
		mins=$(((total % 3600) / 60))

		if [ "$days" -gt 0 ]; then
			echo "${days}d ${hours}h ${mins}m"
		elif [ "$hours" -gt 0 ]; then
			echo "${hours}h ${mins}m"
		else
			echo "${mins}m"
		fi
		return
	fi

	# Last resort on Windows Git Bash/MSYS
	if command -v powershell.exe >/dev/null 2>&1; then
		powershell.exe -NoProfile -Command "(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime | ForEach-Object { '{0}d {1}h {2}m' -f $_.Days, $_.Hours, $_.Minutes }" 2>/dev/null | tr -d '\r'
		return
	fi

	echo "Unavailable"
}

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(get_uptime)
DISTRO=$(uname -o)
DATE=$(date '+%d %B %Y, %I:%M %p')

# --- Display ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"
echo "Distro  : $DISTRO"
echo "Date    : $DATE"
echo "License : Git runs under GPL v2 — free to use, read, and share."
echo "Software: $SOFTWARE_CHOICE"
echo "================================"