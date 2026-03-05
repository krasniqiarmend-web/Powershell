# Example troubleshooting workflow for Exchange administrators

Import-Module ../ExchangeAdminToolkit.psm1

Write-Host "Checking Exchange Service Health..."
Get-ExchangeServiceHealth

Write-Host "Checking Transport Queues..."
Get-TransportQueueStatus

Write-Host "Running Message Trace..."
Get-MessageTraceAnalysis -Recipient "user@company.com"

Write-Host "Testing Autodiscover..."
Test-Autodiscover -EmailAddress "user@company.com"