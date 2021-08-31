# NewABPSetup Module

## To get started with this module

1. Open PowerShell as an Administrator
2. Inside your PowerShell module directory create a directory called NewABPSetup
3. Inside your NewABPSetup directory create a directory called 1.0.0
4. Copy the contents of the Github downloaded zipfile's directory NewABPSetup/NewABPSetup to the 1.0.0 folder

<b><span style="color:red">NOTE:</b></span> The folder structure should look like below:

* C:\Users\UserName\Documents\WindowsPowerShell\Modules\NewAPBSetup
  *   1.0.0
      *   bin
      *   en
      *   functions
      *   internal
      *   tests
      *   xml
      *   changelog.md
      *   NewABPSetup.psd1
      *   NewABPSetup.psm1
      *   readme.md 

5. Run Import-Module -Name NewABPSetup
6. Run `New-ABPSetup -Name YourValue -CustomAttribute CustomAttribute1 -CustomAttributeValue YourValue`

<b><span style="color:red">NOTE:</b></span> The CustomAttribute parameter is a list that you can select from with the Tab key. This allows for you to match which custom attribute has been stamped on your Exchange objects.

This will do the following based on your customAttributeValue

> 1. Create a Global Address List
> 2. Create an Address List
> 3. Create an Room List
> 4. Create an Offline Address Book
> 5. Create an Address Book Policy (link everything together)
> 6. Get all mailboxes that have been already stamped based on your customAttributeValue and set the Address Book Policy on that mailbox
> 7. Set the Address Book Policy

## Error logging

For more information on the logging subsystem please refer to: 'https://psframework.org/documentation/documents/psframework/logging/loggingto/debuglog.html'

> To get verbose output logging information run: `Get-PSFMessage`

## Saving persistent configuration changes

> For more information please reference: 'https://psframework.org/documentation/commands/PSFramework/Register-PSFConfig.html'

## Support Help

For any module issues that might involve deeper troubleshooting you can create a diagnostic debug package.
> Run `New-PSFSupportPackage`

<b><span style="color:red">NOTE:</b></span> Be aware that this package contains a lot of information including your input history in the console.
<b><i><span style="color:orange">Please make sure NO sensitive data (such as passwords) can be caught this way.</b></i></span>
