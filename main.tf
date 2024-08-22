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

  aws_attributes {
    availability           = "ON_DEMAND"
    ebs_volume_count       = 0
    first_on_demand        = 0
    spot_bid_price_percent = 100
    zone_id                = "auto"
  }


  spark_conf = {
    "spark.databricks.rocksDB.fileManager.useCommitService" : false
  }

  spark_env_vars = {
    "PYSPARK_PYTHON" : "/databricks/python3/bin/python3"
  }
}

# https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/cluster
data "databricks_cluster" "this" {
  count        = var.cluster_create ? 0 : 1
  cluster_name = var.cluster_name
}