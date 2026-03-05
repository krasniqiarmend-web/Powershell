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

            New-Mailbox `
                -Name $Name `
                -Alias $Alias `
                -UserPrincipalName $UserPrincipalName `
                -OrganizationalUnit $OU `
                -Password (ConvertTo-SecureString "TempPassword123!" -AsPlainText -Force)

            Write-Log "On-prem mailbox created for $UserPrincipalName"

        }

        catch {

            Write-Log "Mailbox creation failed: $_" "ERROR"
            throw

        }

    }

}