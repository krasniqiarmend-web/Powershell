function Get-TransportQueueStatus {
    [CmdletBinding()]
    param()

    try {
        if (-not (Get-Command Get-Queue -ErrorAction SilentlyContinue)) {
            Write-Log "Get-Queue cmdlet not found. Are you running this from an Exchange server?" "WARN"
            return $null
        }

        $queues = Get-Queue
        # Only grab queues that actually have messages stuck in them
        $activeQueues = $queues | Where-Object { $_.MessageCount -gt 0 }

        if ($activeQueues) {
            Write-Log "Found active transport queues with pending messages." "WARN"
            return $activeQueues | Select-Object Identity, Status, MessageCount, NextHopDomain
        } else {
            Write-Log "All transport queues are currently empty (healthy)." "INFO"
        }
    }
    catch {
        Write-Log "Transport queue check failed: $($_.Exception.Message)" "ERROR"
    }
}