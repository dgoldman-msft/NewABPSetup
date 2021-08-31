function New-ABPSetup {
    <#
        .SYNOPSIS
            Create a full Address Book Policy

        .DESCRIPTION
            This will create a Address Book Policy, Global Address List, Address List, Room List and link them together as well as stamp all of the mailboxes required

        .PARAMETER Name
            Name of the Global Address List, Address List, Address List Policy and Room

        .PARAMETER CustomAttribute
            A set of custom attributes to pick from which are the custom ones on an Exchange mailbox

        .PARAMETER CustomAttributeValue
            Custom attribute value specified in one of the custom attributes on the Exchage mailbox

        .PARAMETER RecipientFilter
            Recipient filter for the Global Address List

        .PARAMETER EnableTransportConfig
            Switch to indicated that EnableTransportConfig needs to be set

        .EXAMPLE
            PS C:\> New-ABPSetup -Name YourValue -CustomAttribute CustomAttribute1 -CustomAttributeValue YourValue

            This will create a new Address Book, Address List, Book, Room and Policy

        .NOTES
            For this to work your users must have already have a custom attribute set. This is the custom attribte
            In Exchange Online, this cmdlet is available only in the Address Lists role, and by default, the role isn't assigned to any role groups. To use this cmdlet, you need to add the Address Lists role to a role group (for example, to the Organization Management role group). For more information, see "https://docs.microsoft.com/en-us/Exchange/permissions/role-groups#add-a-role-to-a-role-group".
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.String])]
    param (

        [parameter(Mandatory = $true, Position = 0)]
        [string]
        $Name,

        [parameter(Mandatory = $true, Position = 1)]
        [ValidateSet('CustomAttribute1', 'CustomAttribute2', 'CustomAttribute3', 'CustomAttribute4', 'CustomAttribute5', 'CustomAttribute5', 'CustomAttribute6', 'CustomAttribute7', 'CustomAttribute8', 'CustomAttribute9', 'CustomAttribute10', 'CustomAttribute11', 'CustomAttribute12', 'CustomAttribute13', 'CustomAttribute14', 'CustomAttribute15', 'ExtensionCustomAttribute1', 'ExtensionCustomAttribute2', 'ExtensionCustomAttribute3', 'ExtensionCustomAttribute4', 'ExtensionCustomAttribute5')]
        [string]
        $CustomAttribute,

        [parameter(Mandatory = $true, Position = 2)]
        [string]
        $CustomAttributeValue,

        [bool]
        $EnableTransportConfig = $true
    )

    begin {
        Write-Output "Starting"
    }

    process {
        if ($EnableTransportConfig) {
            $config = Get-TransportConfig | Select-Object -Property AddressBookPolicyRoutingEnabled

            if (-NOT ($config.AddressBookPolicyRoutingEnabled)) {
                Set-TransportConfig -AddressBookPolicyRoutingEnabled $true
                Write-Output "Enabling Transport Config: AddressBookPolicyRoutingEnabled = True!"
            }
            else {
                Write-Output "AddressBookPolicyRoutingEnabled not changed. Value is already true"
            }
        }
        else {
            Write-Output "AddressBookPolicyRoutingEnabled not set via user default."
        }

        try {
            if ($pscmdlet.ShouldProcess("Creating Global Address List")) {
                $null = New-GlobalAddressList -Name $("$Name Global Address List") -RecipientFilter "($CustomAttribute -eq '$CustomAttributeValue') -and (Alias -ne `$null)}"  -ErrorAction Stop
                Write-Output "Global Address List - $("$Name Global Address List") created"
            }

            if ($pscmdlet.ShouldProcess("Creating Address List")) {
                $null = New-AddressList -Name $("$Name Address List") -RecipientFilter "($CustomAttribute -eq '$CustomAttributeValue') -and (Alias -ne `$null)}" -ErrorAction Stop
                Write-Output "Address List - $("$Name Address List") created"
            }

            if ($pscmdlet.ShouldProcess("Creating Room")) {
                $null = New-AddressList -Name $("$Name Rooms") -RecipientFilter "{(Alias -ne `$null) -and ($CustomAttribute -eq '$CustomAttributeValue') -and (RecipientDisplayType -eq 'ConferenceRoomMailbox') -or (RecipientDisplayType -eq 'SyncedConferenceRoomMailbox')}" -ErrorAction Stop
                Write-Output "Room List - $("$Name Rooms") created"
            }

            if ($pscmdlet.ShouldProcess("Creating Offline Address Book")) {
                $null = New-OfflineAddressBook -Name $("$Name Offline Address Book") -AddressLists ("\" + "$Name Global Address List") -ErrorAction Stop
                Write-Output "Offline Address Book - $("$Name Offline Address Book") created"
            }

            if ($pscmdlet.ShouldProcess("Creating Address Book Policy")) {
                $null = New-AddressBookPolicy -Name $("$Name Address Book Policy") -GlobalAddressList ("\" + "$Name Global Address List") -OfflineAddressBook ("\" + "$Name Offline Address Book") -AddressLists ("\" + "$Name Address List") -RoomList ("\" + "$Name Rooms") -ErrorAction Stop
                Write-Output "Address Book Policy - $("$Name Offline Address Book Policy") created"
            }

            Write-Output "Applying custom attributes on mailboxe(s)"
            if ($pscmdlet.ShouldProcess("Applying custom attributes on mailboxe(s)")) {
                $counter = 0
                Get-Mailbox -ResultSize Unlimited | Where-Object $CustomAttribute -eq $CustomAttributeValue | ForEach-Object {
                    Set-Mailbox -Identity $_.Name -AddressBookPolicy $("$Name Address Book Policy")
                    $counter ++
                }
                Write-Output "Stamped $counter mailboxe(s)"
            }

            if ($pscmdlet.ShouldProcess("Setting Global Address List")) {
                Write-Output "Setting Address Book Policy"
                Set-AddressBookPolicy -Identity $("$Name Address Book Policy") -OfflineAddressBook "\$("$Name Offline Address Book")" -GlobalAddressList "\$("$Name Global Address List")" -AddressLists "\$("$Name Address List")" -RoomList ("\" + "$Name Rooms") -ErrorAction Stop
            }

            $addressbookPolicy = Get-AddressBookPolicy -Identity $("$Name Address Book Policy") -ErrorAction Stop
            if ($addressbookPolicy) { 
                Write-Output $("$Name Address Book Policy found!")
                $addressbookPolicy 
            }
        }
        catch [System.Management.Automation.RuntimeException] { Write-Output "$Name Address Book Policy does not exist!" }
        catch { Write-Output "Error: $_" } 
    }

    end {
        Write-Output "Finished!"
    }
}
