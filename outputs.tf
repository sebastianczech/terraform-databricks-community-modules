output "notebook_url" {
  description = "The URL of the notebook."
  value       = databricks_notebook.this.url
}

output "cluster_id" {
  description = "The ID of the cluster."
  value       = local.cluster_id
}

output "library_id" {
  description = "The ID of the library."
  value       = { for k, v in databricks_library.this : k => v.id }
}
