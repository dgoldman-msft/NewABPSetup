---
external help file: NewABPSetup-help.xml
Module Name: NewABPSetup
online version:
schema: 2.0.0
---

# New-ABPSetup

## SYNOPSIS
Create a full Address Book Policy

## SYNTAX

```
New-ABPSetup [-Name] <String> [-CustomAttribute] <String> [-CustomAttributeValue] <String>
 [-EnableTransportConfig] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This will create a Address Book Policy, Global Address List, Address List, Room List and link them together as well as stamp all of the mailboxes required

## EXAMPLES

### EXAMPLE 1
```
New-ABPSetup -Name YourValue -CustomAttribute CustomAttribute1 -CustomAttributeValue YourValue
```

This will create a new Address Book, Address List, Book, Room and Policy

## PARAMETERS

### -Name
Name of the Global Address List, Address List, Address List Policy and Room

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomAttribute
A set of custom attributes to pick from which are the custom ones on an Exchange mailbox

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomAttributeValue
Custom attribute value specified in one of the custom attributes on the Exchage mailbox

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableTransportConfig
Switch to indicated that EnableTransportConfig needs to be set

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
For this to work your users must have already have a custom attribute set.
This is the custom attribte
In Exchange Online, this cmdlet is available only in the Address Lists role, and by default, the role isn't assigned to any role groups.
To use this cmdlet, you need to add the Address Lists role to a role group (for example, to the Organization Management role group).
For more information, see "https://docs.microsoft.com/en-us/Exchange/permissions/role-groups#add-a-role-to-a-role-group".

## RELATED LINKS
