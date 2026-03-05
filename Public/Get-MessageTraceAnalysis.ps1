function Get-MessageTraceAnalysis {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Recipient
    )

    try {

        $trace = Get-MessageTrace `
            -RecipientAddress $Recipient `
            -StartDate (Get-Date).AddDays(-1) `
            -EndDate (Get-Date)

        foreach ($message in $trace) {

            Get-MessageTraceDetail `
                -MessageTraceId $message.MessageTraceId `
                -RecipientAddress $Recipient

        }

        Write-Log "Detailed message trace executed for $Recipient"

    }

    catch {

        Write-Log "Message trace analysis failed: $_" "ERROR"
        throw

    }

}