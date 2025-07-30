terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }

    backend "azurerm" {

      resource_group_name  = "rg-ershad"
      storage_account_name = "pipestorage123"
      container_name       = "pipecontainer"
      key                  = "pipe.terraform.tfstate"
    }
  }


provider "azurerm" {
  features {}
  subscription_id = "5c83ee41-460c-400b-8120-13a218b61103"
}

resource "azurerm_resource_group" "tondu" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


# resource "azurerm_storage_account" "tondu" {
#   name                     = "tonduaccount"
#   resource_group_name      = azurerm_resource_group.tondu.name
#   location                 = azurerm_resource_group.tondu.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "Production"
#   } 
# }

# resource "azurerm_resource_group" "ershad" {
#     count = 6
#   name     = "rg-ershad-${count.index}"
#   location = "West Europe"


# resource "azurerm_resource_group" "biwi_ke_gahane" {
#   count = length(var.biwi_ke_gahane)
#   name     = var.biwi_ke_gahane[count.index]
#   location = var.resource_group_location
#  }

# resource "azurerm_resource_group" "biwi_ke_gahane" {
#   count = 6
#   name     = var.biwi_ke_gahane[count.index]                #COUNT= 6 (0,1,2,3,4,5)
#   location = var.resource_group_location                           #count.index = 0,1,2,3,4,5
#  }


# resource "azurerm_resource_group" "raj" {
#   count    = 6
# # name     = count.index
#   name     = "rg-raj-${count.index}" # This will create resource groups named rg-raj-0, rg-raj-1, etc.
#   location = "West Europe"
# }

#FOR_EACH + SET
# for_each ke sath resource group ka naam variable se lena(iske liye variable.tf aur terraform.tfvars file mein changes karne honge)
# resource "azurerm_resource_group" "biwi_ke_gahane" {
#   for_each = toset(var.biwi_ke_gahane)           # biwi_ke_gahane = [ "rg-ershad-1", "rg-ershad-2", "rg-ershad-3", "rg-ershad-4", "rg-ershad-5", "rg-ershad-6" ]
#   name     = each.key or each.value  # each.key ya each.value ka use karna hai, kyunki for_each ke sath set ya map use hota hai
#   location = "west europe"
# }

# resource "azurerm_resource_group" "rg" {
#   for_each = toset (["raju-rg", "raju-rg-1", "raju-rg-2", "raju-rg-3", "raju-rg-4", "raju-rg-5"])
#   name     = each.key          #we used toset to convert the list to a set, so that we can use for_each
#   location = "West Europe"
# }                              # multiple resource group ko multiple location me for_each+list se nhi bana sakte, kyunki for_each ke sath set ya map use hota hai

# #FOR_EACH + MAP
# variable "rg_names" {}
# resource "azurerm_resource_group" "rg" {   # terraform.tfvars
#   for_each = var.rg_names                  #rg_names = {
#   name     = each.key                      # "rg-raj-0" = "West Europe"
#   location = each.value                    #       key  = value
# }


