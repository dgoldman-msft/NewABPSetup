function Remove-ABP {
    <#
        .SYNOPSIS
            Remove an Address Book Policy

        .DESCRIPTION
            This will remove a full Address Book Policy, Global Address List, Address List, Room List

        .PARAMETER Name
            Name of the Global Address List, Address List, Address List Policy and Room

        .EXAMPLE
            PS C:\> Remove-ABP -Name YourValue

            This will remove the Address Lists, Books, Room, and Policy 

        .NOTES
            You must manually remove the Custom Attribute from your Exchaneg objects if needed.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.String])]
    param (

        [parameter(Mandatory = $true, Position = 0)]
        [string]
        $Name
    )

    begin {
        Write-Output "Starting"
    }

    process {
        try {
            if ($pscmdlet.ShouldProcess("Removing Address Book Policy")) {
                Remove-AddressBookPolicy -Identity $("$Name Address Book Policy") -ErrorAction Stop
                Write-Output "Address Book Policy - $("$Name Offline Address Book Policy") removed"
            }

            if ($pscmdlet.ShouldProcess("Removing Global Address List")) {
                Remove-GlobalAddressList -Identity $("$Name Global Address List") -ErrorAction Stop
                Write-Output "Global Address List - $("$Name Global Address List") removed"
            }

            if ($pscmdlet.ShouldProcess("Removing Offline Address Book")) {
                Remove-OfflineAddressBook -Identity $("$Name Offline Address Book") -ErrorAction Stop
                Write-Output "Offline Address Book - $("$Name Offline Address Book") removed"
            }

            if ($pscmdlet.ShouldProcess("Removing Address List")) {
                Remove-AddressList -Identity $("$Name Address List") -ErrorAction Stop
                Write-Output "Address List - $("$Name Address List") removed"
            }

            if ($pscmdlet.ShouldProcess("Removing Room Address List")) {
                Remove-AddressList -Identity $("$Name Room") -ErrorAction Stop
                Write-Output "Address List - $("$Name Address List Room") removed"
            }
            
        }
        catch {
            Write-Output "Error: $_"
        }
    }

    end {
        Write-Output "Finished!"
    }
}