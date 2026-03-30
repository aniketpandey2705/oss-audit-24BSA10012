# oss-audit-24BSA10012

**Student:** Aniket Pandey
**Registration Number:** 24BSA10012
**Course:** Open Source Software (OSS NGMC)
**Software Chosen:** Git

---

## What This Project Is

This is my capstone audit for the Open Source Software course. I chose Git because it is the one tool I actually use every day — pushing code, managing branches, collaborating on projects. This audit goes beyond what Git does and looks at why it exists, who built it, what its license actually means, and how it fits into the broader open source world.

The repository contains five shell scripts that demonstrate practical Linux skills alongside the written report.

---

## Repository Structure

```
oss-audit-24BSA10012/
├── README.md
├── script1.sh       # System Identity Report
├── script2.sh       # FOSS Package Inspector
├── script3.sh       # Disk and Permission Auditor
├── script4.sh       # Log File Analyzer
└── script5.sh       # Open Source Manifesto Generator
```

---

## Scripts

### Script 1 — System Identity Report (`script1.sh`)
Displays a welcome screen with information about the current Linux system — kernel version, logged-in user, home directory, uptime, date and time, and a note about the OS license.

**Concepts used:** variables, command substitution `$()`, `echo`, basic output formatting

---

### Script 2 — FOSS Package Inspector (`script2.sh`)
Checks whether Git is installed on the system, prints its version, and uses a `case` statement to display a short philosophy note about Git and other common open source packages.

**Concepts used:** `if-then-else`, `case` statement, `command -v`, pipes with `grep`

---

### Script 3 — Disk and Permission Auditor (`script3.sh`)
Loops through a list of important system directories and reports the permissions, owner, group, and size of each one. Also checks for Git's system-wide config file.

**Concepts used:** `for` loop, `ls -ld`, `du -sh`, `awk`, `cut`

---

### Script 4 — Log File Analyzer (`script4.sh`)
Reads a log file line by line, counts how many lines contain a given keyword (default: `error`), and prints the last 5 matching lines. Accepts the file path and keyword as command-line arguments.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments `$1` and `$2`, `grep`, `tail`

---

### Script 5 — Open Source Manifesto Generator (`script5.sh`)
Asks three interactive questions, then generates a personalised open source philosophy statement and saves it to a `.txt` file named after the current user.

**Concepts used:** `read` for user input, string variables, writing to a file with `>` and `>>`, `date` command, `cat`

---

## How to Run the Scripts

### On Windows (using Git Bash)
Since these scripts are written for Linux, the easiest way to run them on Windows is through Git Bash, which comes bundled with Git for Windows.

1. Open Git Bash
2. Navigate to the folder where you saved the scripts:
   ```bash
   cd /path/to/oss-audit-24BSA10012
   ```
3. Make the scripts executable:
   ```bash
   chmod +x *.sh
   ```
4. Run any script:
   ```bash
   bash script1.sh
   bash script2.sh
   bash script3.sh
   bash script4.sh /var/log/syslog error
   bash script5.sh
   ```

### On Linux or WSL
Same steps as above. All scripts should run without any additional setup.

---

## Dependencies

- **Git** — required for Script 2 (the package being inspected)
- **Bash** — all scripts use standard bash, no external tools needed
- **Standard Unix utilities** — `uname`, `whoami`, `uptime`, `du`, `ls`, `grep`, `awk`, `cut`, `tail` — all available by default on any Linux system or Git Bash

---

## Notes

- Script 4 requires a log file path as an argument. You can test it with any `.log` or `.txt` file on your system.
- Script 5 saves the output to `manifesto_<yourusername>.txt` in the same directory where you run it.
- All scripts are commented throughout to explain what each section does.