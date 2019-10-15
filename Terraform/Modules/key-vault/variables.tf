variable "prefix" {
    type        = string
    description = "The prefix for all your resources. Ex.: <prefix>-rg"
}

variable "tags" {
    type        = map(string)
    description = "A key value pair tags for your resources."
 }

variable "location" {
    type        = string
    description = "The Azure region where your resources will be created."
}

variable "kv_name" {
    type        = string
    description = "Overwrites the auto generated name. Autogenerated name ex.: <prefix>-<unique_string>-kv"
    default = ""
}

variable "kv_sku" {
  type = "string"
  description = "The name of the SKU used for this Key Vault. Possible values are standard and premium."
  default = "standard"
}

variable "kv_enabled_for_disk_encryption" {
    type        = bool
    description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to true."
    default     = true
}

variable "kv_enabled_for_deployment" {
    type        = bool
    description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
    default     = false
}

variable "kv_enabled_for_template_deployment" {
    type        = bool
    description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
    default     = false
}

# Network ACLS Variables
variable "acls_bypass" {
    type    = string
    description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None. Defaults to AzureServices"
    default = "AzureServices"
}

variable "acls_default_action" {
    type    = string
    description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny. Defaults to Allow"
    default = "Allow"
}

variable "acls_ip_rules" {
    type    = list(string)
    description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault"
    default = []
}

variable "acls_virtual_network_subnet_ids" {
    type    = list(string)
    description = "One or more Subnet ID's which should be able to access this Key Vault."
    default = []
}

# Access Policies Variables
variable "ap_object_ids" {
    type = list(string)
    description = "The list object IDs of users, service principals or security groups in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
    default     = []
}

variable "ap_object_ids_application_ids_map" {
    type = map(string)
    description = "The list object IDs of users, service principals or security groups in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
    default     = {}
}

variable "ap_certificate_permissions" {
    type = list(string)
    description = "List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update."
    default = [
      "create",
      "delete",
      "deleteissuers",
      "get",
      "getissuers",
      "import",
      "list",
      "listissuers",
      "managecontacts",
      "manageissuers",
      "setissuers",
      "update",
    ]
}

variable "ap_key_permissions" {
    type = list(string)
    description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
    default = [
      "backup",
      "create",
      "decrypt",
      "delete",
      "encrypt",
      "get",
      "import",
      "list",
      "purge",
      "recover",
      "restore",
      "sign",
      "unwrapKey",
      "update",
      "verify",
      "wrapKey",
    ]
}

variable "ap_secret_permissions" {
    type = list(string)
    description = "List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set."
    default = [
      "backup",
      "delete",
      "get",
      "list",
      "purge",
      "recover",
      "restore",
      "set",
    ]
}

variable "ap_storage_permissions" {
    type = list(string)
    description = " List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
    default = [
      "backup",
      "delete",
      "deletesas",
      "get",
      "getsas",
      "list",
      "listsas",
      "purge",
      "recover",
      "regeneratekey",
      "restore",
      "set",
      "setsas",
      "update",
    ]
}