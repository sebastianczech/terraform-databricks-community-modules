mock_provider "databricks" {}

run "cluster_name_test" {
  command = apply

  assert {
    condition     = databricks_cluster.this.cluster_name == var.cluster_name
    error_message = "Cluster name did not match expected name"
  }
}

run "notebook_path_test" {
  command = apply

  assert {
    condition     = databricks_notebook.this.path == "${data.databricks_current_user.this.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
    error_message = "Notebook path did not match expected path"
  }
}