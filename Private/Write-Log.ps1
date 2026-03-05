function Write-Log {
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [ValidateSet("INFO","WARN","ERROR")]
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logLine = "[$timestamp] [$Level] $Message"

    $color = switch($Level) {
        "ERROR" { "Red" }
        "WARN"  { "Yellow" }
        default { "White" }
    }

    Write-Host $logLine -ForegroundColor $color
}