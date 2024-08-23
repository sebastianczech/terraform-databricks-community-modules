variable "databricks_host" {
  description = "The hostname for Databricks."
  type        = string
  default     = "https://community.cloud.databricks.com"
}

variable "databricks_username" {
  description = "The username for Databricks."
  type        = string
}

variable "databricks_password" {
  description = "The password for Databricks."
  type        = string
}

variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
}

variable "library_pypi_packages" {
  description = "A list of PyPI libraries to install."
  type        = list(string)
}
