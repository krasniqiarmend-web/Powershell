\# Exchange PowerShell Administration Toolkit



This repository contains PowerShell scripts designed to help automate common administration and troubleshooting tasks in Microsoft Exchange environments.



The scripts are focused on real operational scenarios such as mail flow troubleshooting, mailbox provisioning, service health verification, and hybrid Exchange management.



---



\## What This Repository Does



This toolkit provides scripts that help administrators perform common Exchange tasks more efficiently.



Examples include:



\- Mail flow diagnostics

\- Message trace investigation

\- Autodiscover troubleshooting

\- Transport queue inspection (Exchange On-Prem)

\- Exchange service health checks

\- Mailbox creation

\- Permission management

\- Hybrid migration preparation



The goal is to automate tasks that Exchange administrators frequently perform when troubleshooting or managing messaging environments.



---



\## Who This Repository Is For



This repository is intended for:



\- Exchange Administrators

\- Microsoft 365 Administrators

\- Messaging Engineers

\- IT Support Engineers working with Exchange

\- System Administrators managing hybrid Exchange environments



The scripts are designed for environments that include:



\- Microsoft Exchange Online

\- Microsoft Exchange Server (On-Premises)

\- Hybrid Exchange deployments



---



\## Example Use Cases



\### Test Mail Flow Between Two Users



```powershell

Test-MailFlow -Sender admin@company.com -Recipient user@company.com

