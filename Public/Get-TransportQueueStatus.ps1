function Get-TransportQueueStatus {

    [CmdletBinding()]
    param()

    try {

        if (Get-Command Get-Queue -ErrorAction SilentlyContinue) {

            $queues = Get-Queue

            return $queues | Select Identity, Status, MessageCount, NextHopDomain

        }

        else {

            Write-Log "Transport queue cmdlet not available" "WARN"

        }

    }

    catch {

        Write-Log "Transport queue check failed: $_" "ERROR"
        throw

    }

}