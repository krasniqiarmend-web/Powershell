function Test-Autodiscover {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$EmailAddress
    )

    try {
        if (-not (Get-Command Test-OutlookWebServices -ErrorAction SilentlyContinue)) {
            Write-Log "Test-OutlookWebServices not found. Ensure Exchange tools are loaded." "ERROR"
            return
        }

        $results = Test-OutlookWebServices -Identity $EmailAddress -ErrorAction Stop
        $failures = $results | Where-Object Result -match "Failure|Error"

        if ($failures) {
            Write-Log "Autodiscover test completed with errors for $EmailAddress" "WARN"
            return $failures
        } else {
            Write-Log "Autodiscover test passed successfully for $EmailAddress" "INFO"
        }
    }
    catch {
        Write-Log "Autodiscover test failed to run: $($_.Exception.Message)" "ERROR"
    }
}