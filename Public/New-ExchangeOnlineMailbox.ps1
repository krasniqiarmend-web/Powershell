function New-ExchangeOnlineMailbox {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string]$DisplayName,

        [Parameter(Mandatory)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory)]
        [string]$Alias
    )

    if ($PSCmdlet.ShouldProcess($UserPrincipalName, "Create Exchange Online Mailbox")) {
        try {
            # Generate a 12-character random secure password
            $rawPass = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 12 | ForEach-Object {[char]$_})
            $secPass = ConvertTo-SecureString $rawPass -AsPlainText -Force

            $mailboxParams = @{
                Name                      = $DisplayName
                UserPrincipalName         = $UserPrincipalName
                Alias                     = $Alias
                MicrosoftOnlineServicesID = $UserPrincipalName
                Password                  = $secPass
            }

            New-Mailbox @mailboxParams
            
            Write-Log "Mailbox created for $UserPrincipalName. Temp Password: $rawPass" "INFO"
        }
        catch {
            Write-Log "Failed to create Exchange Online mailbox: $($_.Exception.Message)" "ERROR"
        }
    }
}