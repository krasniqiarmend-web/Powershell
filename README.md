# Exchange Admin Toolkit (Personal Lab Project)

This repository contains PowerShell scripts I designed to automate common administration and troubleshooting tasks in Microsoft Exchange environments. 

### Why I Built This
While working with Exchange environments, I found myself running the same core commands to check mail flow and service health. I built this toolkit to move away from messy "one-liner" commands and toward reusable, structured functions. This standardizes how actions are logged and ensures we aren't manually typing out long `Get-MessageTrace` parameters every time an issue is reported.

### Key Features
* **Automated Logging:** All scripts use a centralized `Write-Log` function with color-coded status levels.
* **Safe Execution:** Provisioning scripts use `$PSCmdlet.ShouldProcess`, allowing the use of `-WhatIf` before making changes.
* **Splatting:** I use parameter splatting throughout to ensure the code is readable and maintainable.
* **Dynamic Security:** Mailbox creation scripts generate secure, random temporary passwords rather than relying on hardcoded strings.

### How to Use
1. Clone the repository.
2. Ensure all function `.ps1` files are located in the `Public` folder.
3. Import the module: `Import-Module .\ExchangeAdminToolkit.psm1`
4. Use the functions, for example: `Test-MailFlow -Sender admin@company.com -Recipient user@company.com`