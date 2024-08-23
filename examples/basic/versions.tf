terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.50"
    }
  }

  required_version = ">= 1.5.0"
}

provider "databricks" {
  host     = var.databricks_host
  username = var.databricks_username
  password = var.databricks_password
}
