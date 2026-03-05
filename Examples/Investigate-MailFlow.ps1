# Example troubleshooting runbook for Exchange administrators

# Safely load the toolkit module first
$modulePath = Join-Path $PSScriptRoot "ExchangeAdminToolkit.psm1"
if (Test-Path $modulePath) {
    Import-Module $modulePath -Force
} else {
    Write-Host "Could not find module at $modulePath" -ForegroundColor Red
    exit
}

Write-Log "Starting Exchange Diagnostic Runbook..." "INFO"

# Check Transport Queues
$queues = Get-TransportQueueStatus
if ($queues) {
    $queues | Format-Table -AutoSize
}

# Run Message Trace
$testUser = Read-Host "Enter the user email to trace"
Get-MessageTraceAnalysis -Recipient $testUser

# Test Autodiscover
Test-Autodiscover -EmailAddress $testUser

Write-Log "Runbook execution complete." "INFO"