function Get-MessageTraceAnalysis {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Recipient
    )

    try {
        $traceParams = @{
            RecipientAddress = $Recipient
            StartDate        = (Get-Date).AddDays(-1)
            EndDate          = (Get-Date)
        }

        $traceResults = Get-MessageTrace @traceParams

        if (-not $traceResults) {
            Write-Log "No messages found for $Recipient in the last 24 hours." "WARN"
            return
        }

        foreach ($msg in $traceResults) {
            Get-MessageTraceDetail -MessageTraceId $msg.MessageTraceId -RecipientAddress $Recipient
        }

        Write-Log "Successfully analyzed $($traceResults.Count) messages for $Recipient" "INFO"
    }
    catch {
        Write-Log "Message trace failed: $($_.Exception.Message)" "ERROR"
    }
}