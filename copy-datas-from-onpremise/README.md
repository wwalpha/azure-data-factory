# Copy data from onpremise to Azure SQL database and Azure Storage via DataFactory

## Prerequisite
- Azure Image include SQLServer2012, Self-Hosted Integration Runtime, AdventureWorks sample data
- Terraform workspace
- Azure VPN enterprise application pre-configure with Azure Active Directory(AAD)

## Architecture
![img](../docs/copydata_from_onpremise.png)

## Steps
1. Set Terraform variable `is_self_hosted_ir_setup_finished = false`
2. Create Resources (Terraform Apply)
3. Login to Azure Portal and download VPN configuration via [Virtual network gateways] service
4. Login Azure VPN with AAD account and login to Azure VM
5. Using primary key to configure self-hosted integration runtime
6. Set Terraform variable `is_self_hosted_ir_setup_finished = true`
7. Create Resources (Terraform Apply)
8. Execute copy script in Azure Data Factory
9. Confirm results from storage account and SQL database

## AdventureWorks sample databases
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

