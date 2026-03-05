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

            New-Mailbox `
                -Name $DisplayName `
                -UserPrincipalName $UserPrincipalName `
                -Alias $Alias `
                -MicrosoftOnlineServicesID $UserPrincipalName `
                -Password (ConvertTo-SecureString "TempPassword123!" -AsPlainText -Force)

            Write-Log "Exchange Online mailbox created for $UserPrincipalName"

        }

        catch {

            Write-Log "Exchange Online mailbox creation failed: $_" "ERROR"
            throw

        }

    }

}