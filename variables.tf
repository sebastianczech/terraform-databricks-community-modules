variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
  default     = "notebook.py"
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
  default     = "PYTHON"
}

variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
  default     = "demo-cluster"
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
