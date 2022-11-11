# azure-data-factory



## Changing a Data Factory Integration Runtime Registration Key
- From the machine hosting the IR, open the Windows PowerShell ISE as Administrator
- Within the ISE click File, Open, and navigating to: `C:\Program Files\Microsoft Integration Runtime\5.0\PowerShellScript`
- Open the `RegisterIntegrationRuntime.ps1` PowerShell script
- Edit param `$gatewayKey = "IR@newkey..."`
- Edit param `$NodeName = "anyway"`
- Press run, it may take a minute or so, but once successful you'll see the message 'Integration Runtime registration is successful!'
