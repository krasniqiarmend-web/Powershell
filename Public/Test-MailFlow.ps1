function Test-MailFlow {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Sender,

        [Parameter(Mandatory)]
        [string]$Recipient
    )

    try {

        $trace = Get-MessageTrace `
            -SenderAddress $Sender `
            -RecipientAddress $Recipient `
            -StartDate (Get-Date).AddHours(-4) `
            -EndDate (Get-Date)

        if ($trace) {

            Write-Log "Mail flow trace found between $Sender and $Recipient"
            return $trace

        }

        else {

            Write-Log "No mail flow records found" "WARN"

        }

    }

    catch {

        Write-Log "Mail flow test failed: $_" "ERROR"
        throw

    }
}