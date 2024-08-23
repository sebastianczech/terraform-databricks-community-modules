# Basic example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.50 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_databricks_community_edition"></a> [databricks\_community\_edition](#module\_databricks\_community\_edition) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | A name for the cluster. | `string` | n/a | yes |
| <a name="input_databricks_host"></a> [databricks\_host](#input\_databricks\_host) | The hostname for Databricks. | `string` | `"https://community.cloud.databricks.com"` | no |
| <a name="input_databricks_password"></a> [databricks\_password](#input\_databricks\_password) | The password for Databricks. | `string` | n/a | yes |
| <a name="input_databricks_username"></a> [databricks\_username](#input\_databricks\_username) | The username for Databricks. | `string` | n/a | yes |
| <a name="input_library_pypi_packages"></a> [library\_pypi\_packages](#input\_library\_pypi\_packages) | A list of PyPI libraries to install. | `list(string)` | n/a | yes |
| <a name="input_notebook_filename"></a> [notebook\_filename](#input\_notebook\_filename) | The notebook's filename. | `string` | n/a | yes |
| <a name="input_notebook_subdirectory"></a> [notebook\_subdirectory](#input\_notebook\_subdirectory) | A name for the subdirectory to store the notebook. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_databricks_community_edition"></a> [databricks\_community\_edition](#output\_databricks\_community\_edition) | The Databricks Community Edition deployment outputs. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
