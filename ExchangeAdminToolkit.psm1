$publicPath = Join-Path $PSScriptRoot "Public"

if (Test-Path $publicPath) {
    $files = Get-ChildItem -Path $publicPath -Filter *.ps1
    foreach ($file in $files) {
        try {
            . $file.FullName
        }
        catch {
            Write-Warning "Failed to load function from $($file.Name)"
        }
    }
} else {
    Write-Error "Public folder not found in $PSScriptRoot. Please ensure script files are in the Public directory."
}