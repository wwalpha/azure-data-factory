# azure-data-factory

## Installation
- Set environment variables: `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`
- Modify `organization`, `workspaces` in `terraform/main.tf`
- Create `secrets.auto.tfvars` file in terraform folder and add values
```
mssql_admin_password     = "P@ssw0rdExample"
azurevm_admin_password   = "P@ssw0rdExample"
sqlserver_admin_password = "P@ssw0rdExample"
my_client_ip             = "10.10.10.10"
is_create_vpn_gateway    = true
```
- Create Azure Infrastructure via Terraform
- Approve `pending connections` from azure data factory managed virtual network in `Private Link Center` of Azure Portal
- Approve `pending connections` in `Private link service` of Azure Portal
- Login to AzureVM and active Self Host Integration Runtime with token from terraform outputs
- Modify `secrets.auto.tfvars` file and add new line `is_self_hosted_ir_setup_finished = true`
- Rerun `terraform apply`

## Demonstrate
- [Copy data from onpremise to Azure SQL database and Azure Storage via DataFactory](./copydata_from_onpremise/README.md)

## Changing a Data Factory Integration Runtime Registration Key
- From the machine hosting the IR, open the Windows PowerShell ISE as Administrator
- Within the ISE click File, Open, and navigating to: `C:\Program Files\Microsoft Integration Runtime\5.0\PowerShellScript`
- Open the `RegisterIntegrationRuntime.ps1` PowerShell script
- Edit param `$gatewayKey = "IR@newkey..."`
- Edit param `$NodeName = "anyway"`
- Press run, it may take a minute or so, but once successful you'll see the message 'Integration Runtime registration is successful!'
