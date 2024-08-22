output "notebook_url" {
  description = "The URL of the notebook."
  value       = databricks_notebook.this.url
}

output "cluster_id" {
  description = "The ID of the cluster."
  value       = var.cluster_create ? databricks_cluster.this[0].id : data.databricks_cluster.this[0].id
}
