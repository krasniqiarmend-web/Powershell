function Test-Autodiscover {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$EmailAddress
    )

    try {

        Test-OutlookWebServices -Identity $EmailAddress

        Write-Log "Autodiscover test executed for $EmailAddress"

    }

    catch {

        Write-Log "Autodiscover test failed: $_" "ERROR"
        throw

    }

}