output "notebook_url" {
  description = "The URL of the notebook."
  value       = databricks_notebook.this.url
}

output "cluster_url" {
  description = "The URL of the cluster."
  value       = databricks_cluster.this.url
}
