function New-OnPremMailbox {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [string]$Alias,

        [Parameter(Mandatory)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory)]
        [string]$OU
    )

    if ($PSCmdlet.ShouldProcess($Name, "Create On-Prem Mailbox")) {
        try {
            $rawPass = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 12 | ForEach-Object {[char]$_})
            $secPass = ConvertTo-SecureString $rawPass -AsPlainText -Force

            $mailboxParams = @{
                Name               = $Name
                Alias              = $Alias
                UserPrincipalName  = $UserPrincipalName
                OrganizationalUnit = $OU
                Password           = $secPass
            }

            New-Mailbox @mailboxParams
            Write-Log "On-prem mailbox created for $UserPrincipalName. Temp password: $rawPass" "INFO"
        }
        catch {
            Write-Log "On-prem mailbox creation failed: $($_.Exception.Message)" "ERROR"
        }
    }
}