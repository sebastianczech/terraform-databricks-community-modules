# https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/notebook
resource "databricks_notebook" "this" {
  path     = "/Users/${var.databricks_username}/${var.notebook_subdirectory}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/node_type
data "databricks_node_type" "this" {
  local_disk = true
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/spark_version
data "databricks_spark_version" "this" {
  long_term_support = true
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/cluster
resource "databricks_cluster" "this" {
  count = var.cluster_create ? 1 : 0

  cluster_name            = var.cluster_name
  node_type_id            = data.databricks_node_type.this.id
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
  spark_version           = data.databricks_spark_version.this.id
  runtime_engine          = var.cluster_runtime_engine
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/cluster
data "databricks_cluster" "this" {
  count        = var.cluster_create ? 0 : 1
  cluster_name = var.cluster_name
}

locals {
  cluster_id = var.cluster_create ? databricks_cluster.this[0].id : data.databricks_cluster.this[0].id
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/library
resource "databricks_library" "this" {
  for_each   = { for package in var.library_pypi_packages : package => package }
  cluster_id = local.cluster_id
  pypi {
    package = each.value
  }
}
