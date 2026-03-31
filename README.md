## OSS Audit - MySQL
Student Name: Mradula Chouhan
Registration Number: 24BCE11337
Course: Open Source Software (OSS NGMC)
Chosen Software: MySQL
Repository: oss-audit-24BCE11337

## Project Description
This repository contains the complete submission for the Open Source Audit capstone project. The project involves a structured audit of MySQL - one of the world's most widely deployed open-source relational database management systems. Alongside the written report, five shell scripts demonstrate practical Linux skills including system inspection, package management, file system auditing, log analysis, and interactive user input.

## Software Chosen: MySQL
MySQL is an open-source relational database management system originally developed by Michael Widenius and David Axmark in 1995. It is now maintained by Oracle Corporation and distributed under the GNU General Public License v2, with a commercial licensing option available for proprietary use cases.
MySQL powers the data layer of millions of applications globally, including platforms like Facebook, Twitter, and YouTube in their early and growth phases. It forms the "M" in the classic LAMP stack (Linux, Apache, MySQL, PHP/Python/Perl).

## Repository Structure
oss-audit-24BCE11337/
├── script1.sh         # System Identity Report
├── script2.sh         # FOSS Package Inspector
├── script3.sh         # Disk and Permission Auditor
├── script4.sh         # Log File Analyzer
├── script5.sh         # Open Source Manifesto Generator
├── README.md          # This file
└── report.pdf         # Full project report (submitted via portal)

## Script Descriptions
script1.sh - System Identity Report
Generates a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, current date and time, and the open-source license covering the OS and the chosen software (MySQL). Uses shell variables, command substitution via $(), and echo formatting.
script2.sh - FOSS Package Inspector
Checks whether MySQL is installed on the system and displays its version, license, and summary. Works on both Debian-based (dpkg) and RPM-based (rpm) systems. Uses an if-then-else block and a case statement to print a philosophy note based on the package name. Also handles systems where MySQL is installed but not via a package manager.
script3.sh - Disk and Permission Auditor
Loops through a predefined list of important system directories using a for loop and reports permissions, ownership, and disk usage for each. Also specifically checks and reports on MySQL-related directories such as /etc/mysql, /var/lib/mysql, and /var/log/mysql. Uses ls -ld, du, and awk.
script4.sh - Log File Analyzer
Accepts a log file path and an optional keyword as command-line arguments. Reads the file line by line using a while-read loop, counts keyword occurrences using an if-then block and a counter variable, and prints the last 5 matching lines. Includes a retry loop if the file is not found. Defaults the keyword to "error" if none is provided.
script5.sh - Open Source Manifesto Generator
An interactive script that asks the user three questions using read, composes a personalised open source philosophy statement using string concatenation and the date command, and writes the output to a .txt file named after the logged-in user. Demonstrates file writing with >> and includes an alias tip in the output.

## Dependencies
The following tools must be available on your Linux system. Most are pre-installed on standard distributions.
ToolPurposeInstall CommandbashScript interpreterPre-installedunameKernel infoPre-installedwhoamiCurrent userPre-installeduptimeSystem uptimePre-installeddateDate and timePre-installedls, du, dfFile/disk infoPre-installedawk, cut, grepText processingPre-installeddpkg or rpmPackage inspectionDistro-specificmysql (optional)Installed for script2 demoSee below
Installing MySQL (Optional - for full script2 output)
Ubuntu / Debian:
bashsudo apt update
sudo apt install mysql-server
RHEL / CentOS / Fedora:
bashsudo yum install mysql-server
sudo systemctl start mysqld

## How to Run the Scripts
Step 1: Clone the repository
bashgit clone https://github.com/<your-username>/oss-audit-24BCE11337.git
cd oss-audit-24BCE11337
Step 2: Make all scripts executable
bashchmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
Step 3: Run each script
Script 1 - System Identity Report
bash./script1.sh
No arguments needed. Outputs a formatted system summary.
Script 2 - FOSS Package Inspector
bash./script2.sh
No arguments needed. Detects MySQL and prints version, license, and philosophy note.
Script 3 - Disk and Permission Auditor
bash./script3.sh
No arguments needed. Audits system directories and MySQL config paths.
Script 4 - Log File Analyzer
bash./script4.sh /var/log/syslog error
Replace /var/log/syslog with any valid log file path. Second argument is the keyword (default: error).
For MySQL logs specifically:
bash./script4.sh /var/log/mysql/error.log Warning
Script 5 - Open Source Manifesto Generator
bash./script5.sh
Interactive. Follow the three prompts. Output is saved as manifesto_<username>.txt.

## Notes

Scripts are tested on Ubuntu 22.04 LTS and CentOS 8.
Script 4 requires an existing, readable log file. Use /var/log/syslog on Debian-based systems or /var/log/messages on RHEL-based systems.
Script 2 will still run meaningfully even if MySQL is not installed - it will report the installation status and show the case statement output.
All scripts use only POSIX-compatible bash constructs and standard Linux utilities. No third-party packages are required beyond the optional MySQL installation.


## Academic Integrity
All written content in the project report is original work by Mradula Chouhan. The shell scripts were written and tested independently. Any external resources used as reference are cited within the report itself.
