module "databricks_community_edition" {
  source = "../../"

  databricks_username   = var.databricks_username
  cluster_name          = var.cluster_name
  notebook_subdirectory = var.notebook_subdirectory
  notebook_filename     = var.notebook_filename
  library_pypi_packages = var.library_pypi_packages
}
