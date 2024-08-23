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
  default     = "Terraform"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
  default     = "PYTHON"
}

variable "cluster_create" {
  description = "Whether to create the cluster."
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
}

variable "cluster_autotermination_minutes" {
  description = "How many minutes before automatically terminating due to inactivity."
  type        = number
  default     = 60
}

variable "cluster_num_workers" {
  description = "The number of workers."
  type        = number
  default     = 1
}

variable "cluster_runtime_engine" {
  description = "The runtime engine for the cluster."
  type        = string
  default     = "STANDARD"
}

variable "library_pypi_packages" {
  description = "A list of PyPI libraries to install."
  type        = list(string)
  default     = []
}
