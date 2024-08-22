terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {
  host     = var.databricks_host
  username = var.databricks_username
  password = var.databricks_password
}
