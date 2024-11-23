Terraform - Azure Resource Creation
This project uses Terraform to implement Infrastructure as Code (IaC) in Microsoft Azure. We create a resource group and a storage account using a configuration file (main.tf).

Prerequisites
Azure Account: You need an active Azure account to create the resources.
Terraform Installed: Ensure Terraform is installed on your machine. If not, follow this guide.
Azure CLI: The Azure CLI is required to authenticate your Azure account. Install it from here.
Instructions
1. Authenticate with Azure
Run the following command to log in:

az login
This command will open a browser window to log in with your Azure account. If you have multiple subscriptions, select the correct one:

az account set --subscription "<Your-Subscription-ID>"
2. Initialize Terraform
Ensure the main.tf file is in your working directory. Then, initialize Terraform to download the required providers:

terraform init
3. Review the Execution Plan
Check what Terraform plans to do:

terraform plan
This will generate a plan showing the resources to be created.

4. Apply the Changes
Run the following command to deploy the resources to Azure:

terraform apply
Type yes when prompted to confirm.

5. Verify Resources in Azure
Log in to the Azure Portal to verify that the following resources have been created:

Resource Group named terraform-resources.
Storage Account with the unique name you defined.
Project Structure
plaintext
Copiar código
.
├── main.tf           # Main Terraform configuration file
├── README.md         # Project documentation
Contents of main.tf
hcl
Copiar código
provider "azurerm" {
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "terraform" {
  name     = "terraform-resources"
  location = "East US"
}

# Create a storage account
resource "azurerm_storage_account" "terraform" {
  name                     = "terraformdanna129"   # Change to a unique name
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = azurerm_resource_group.terraform.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
Troubleshooting
Error: Storage account name is already in use
Ensure the name value in azurerm_storage_account is unique. Follow Azure naming rules:

3-24 characters.
Only lowercase letters and numbers.
Must be globally unique.
Error: Invalid region
Ensure you use a valid Azure region like "eastus", "westus", "westeurope", etc. You can find valid regions in the Azure documentation.

Error: Provider not initialized
Make sure to run terraform init before running terraform plan or terraform apply.

Resources Created
Resource Group (azurerm_resource_group):

Name: terraform-resources.
Location: East US.
Storage Account (azurerm_storage_account):

Name: myuniquestorage123.
Type: Standard with LRS replication.
Location: East US.
Terraform Basic Commands
Command	Description
terraform init	Initializes the Terraform environment.
terraform plan	Generates an execution plan without applying changes.
terraform apply	Applies changes and creates the resources.
terraform destroy	Deletes the created resources.
