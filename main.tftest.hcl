mock_provider "databricks" {}

variables {
  databricks_username   = "test"
  databricks_password   = "test"
  cluster_name          = "micro-cluster"
  notebook_subdirectory = "terraform"
  notebook_filename     = "notebook.py"
  library_pypi_packages = ["mlflow", "pandas"]
}

run "cluster_name_test" {
  command = apply

  assert {
    condition     = data.databricks_cluster.this[0].cluster_name == var.cluster_name
    error_message = "Cluster name did not match expected name"
  }
}

run "notebook_path_test" {
  command = apply

  assert {
    condition     = databricks_notebook.this.path == "/Users/${var.databricks_username}/${var.notebook_subdirectory}/${var.notebook_filename}"
    error_message = "Notebook path did not match expected path"
  }
}
