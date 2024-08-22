# https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/current_user
data "databricks_current_user" "this" {}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/notebook
resource "databricks_notebook" "this" {
  path     = "${data.databricks_current_user.this.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
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
  cluster_name            = var.cluster_name
  node_type_id            = data.databricks_node_type.this.id
  spark_version           = data.databricks_spark_version.this.id
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
}