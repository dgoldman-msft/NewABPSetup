# NewABPSetup Module

## To get started with this module

1. Open PowerShell as an Administrator
2. Set-ExecutionPolicy -ExecutionPolicy Bypass
3. Install-Module PSFramework
4. Open Windows Explorer and navigate to C:\Users\<username>\Documents\WindowsPowerShell
5. If no modules directoy exists create a new directory called 'Modules'
6. Inside the module directory create a directory called NewABPSetup
7. Inside the NewABPSetup directory create a directory called 1.0.0
8. Copy the contents of the Github downloaded zipfile's directory NewABPSetup/NewABPSetup to the 1.0.0 folder

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

7. Run Import-Module -Name NewABPSetup
8. Run `New-ABPSetup -Name YourValue -CustomAttribute CustomAttribute1 -CustomAttributeValue YourValue`

NOTE: If you do not want to set this up as a module you can copy the raw contents of the New-ABPSetup function and paste it directly in to your current PowerShell session.

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
