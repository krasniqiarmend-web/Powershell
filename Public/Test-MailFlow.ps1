function Test-MailFlow {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Sender,

        [Parameter(Mandatory)]
        [string]$Recipient
    )

    try {
        $traceParams = @{
            SenderAddress    = $Sender
            RecipientAddress = $Recipient
            StartDate        = (Get-Date).AddHours(-4)
            EndDate          = (Get-Date)
        }

        $trace = Get-MessageTrace @traceParams

        if ($trace) {
            Write-Log "Mail flow trace found $($trace.Count) messages between $Sender and $Recipient" "INFO"
            return $trace
        }
        else {
            Write-Log "No mail flow records found in the last 4 hours." "WARN"
        }
    }
    catch {
        Write-Log "Mail flow test failed: $($_.Exception.Message)" "ERROR"
    }
}