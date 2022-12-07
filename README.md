# azure-data-factory

## Installation
- Set environment variables, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`
- Modify `organization`, `workspaces` in `terraform/main.tf`
- Create Azure Infrastructure via Terraform
- Approve `pending connections` from azure data factory managed virtual network
- Approve `pending connections` in Private link service

## Demonstrate
- [Copy data from onpremise to Azure SQL database and Azure Storage via DataFactory](./copydata_from_onpremise/README.md)

## Changing a Data Factory Integration Runtime Registration Key
- From the machine hosting the IR, open the Windows PowerShell ISE as Administrator
- Within the ISE click File, Open, and navigating to: `C:\Program Files\Microsoft Integration Runtime\5.0\PowerShellScript`
- Open the `RegisterIntegrationRuntime.ps1` PowerShell script
- Edit param `$gatewayKey = "IR@newkey..."`
- Edit param `$NodeName = "anyway"`
- Press run, it may take a minute or so, but once successful you'll see the message 'Integration Runtime registration is successful!'
