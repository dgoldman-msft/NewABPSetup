---
external help file: NewABPSetup-help.xml
Module Name: NewABPSetup
online version:
schema: 2.0.0
---

# Remove-ABP

## SYNOPSIS
Remove an Address Book Policy

## SYNTAX

```
Remove-ABP [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This will remove a full Address Book Policy, Global Address List, Address List, Room List

## EXAMPLES

### EXAMPLE 1
```
Remove-ABP -Name YourValue
```

This will remove the Address Lists, Books, Room, and Policy

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
You must manually remove the Custom Attribute from your Exchaneg objects if needed.

## RELATED LINKS
