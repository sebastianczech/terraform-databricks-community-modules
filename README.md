# Terraform modules for deploying notebook in Databricks community edition

## Prerequisites

1. Install Terraform:
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
2. Install Databricks CLI
```bash
brew tap databricks/tap
brew install databricks
```
3. [Sign up for Databricks Community edition](https://docs.databricks.com/en/getting-started/community-edition.html)

## Usage

Terraform can authenticate using multiple methods, but most of them are not available in Databricks community edition e.g. PAT (personal access token). That's why in below example username and password was used. In order to deploy Terraform code, please follow below steps:

1. Go to example directory and create `terraform.auto.tfvars`
```bash
cd examples/basic
vi terraform.auto.tfvars
```
with content:
```hcl
databricks_username = "***"
databricks_password = "***
```
2. Initialize Terraform:
```bash
terraform init
```
3. Create cluster via UI with below options (as it's not possible via CLI or Terraform for community edition):
```bash
databricks clusters create --json '{
  "autotermination_minutes": 60,
  "cluster_name": "micro-cluster",
  "node_type_id": "dev-tier-node",
  "num_workers": 1,
  "runtime_engine": "STANDARD",
  "spark_version": "15.4.x-scala2.12"
}'
```
4. Plan and apply code:
```bash
terraform apply -var-file example.tfvars
```
5. Check deployment:
```
databricks clusters list
databricks clusters get <CLUSTER-ID>
databricks libraries cluster-status <CLUSTER-ID>

databricks workspace list "/Users"
databricks workspace list "/Users/<USERNAME>"
databricks workspace list "/Users/<USERNAME>/Terraform"
```
6. Test code (in module directory, not example):
```bash
cd ../../
terraform test
```

## Links

* Platform:
  * [Databricks Community Edition](https://community.cloud.databricks.com/)
  * [Try Databricks free](https://www.databricks.com/try-databricks)
* Documentation:
  * [Documentation for Databricks Terraform provider](https://docs.databricks.com/en/dev-tools/terraform/index.html)
  * [Databricks authentication types](https://docs.databricks.com/en/dev-tools/auth/index.html#databricks-client-unified-authentication)
  * [What is the Databricks CLI?](https://docs.databricks.com/en/dev-tools/cli/index.html)
  * [Databricks Utilities (dbutils)](https://docs.databricks.com/en/dev-tools/databricks-utils.html)
  * [What are Databricks Asset Bundles?](https://docs.databricks.com/en/dev-tools/bundles/index.html)
  * [What is CI/CD on Databricks?](https://docs.databricks.com/en/dev-tools/ci-cd.html)
* Code:
  * [Databricks Terraform provider](https://registry.terraform.io/providers/databricks/databricks/latest/docs)
  * [Example Repo Used in Get Started with Data Engineering on Databricks](https://github.com/databricks-academy/get-started-with-data-engineering-on-databricks-repo-example)
* Notebooks:
  * [Quickstart Python](https://docs.databricks.com/en/mlflow/quick-start-python.html#)
  * [MLflow example (Python)](https://docs.databricks.com/en/_extras/notebooks/source/mlflow/mlflow-quick-start-python.html)
* Tools:
  * [Databricks CLI](https://docs.databricks.com/en/dev-tools/cli/install.html)
* Trainings:
  * [Get Started with Databricks for Data Engineering](https://customer-academy.databricks.com/learn/course/2469/get-started-with-databricks-for-data-engineering)
  * [Generative AI Fundamentals](https://www.databricks.com/learn/training/generative-ai-fundamentals-accreditation)
  * [Lakehouse Fundamentals](https://www.databricks.com/learn/training/lakehouse-fundamentals-accreditation)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~> 1.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_cluster.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/cluster) | resource |
| [databricks_directory.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/directory) | resource |
| [databricks_library.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/library) | resource |
| [databricks_notebook.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/notebook) | resource |
| [databricks_cluster.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/cluster) | data source |
| [databricks_node_type.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/node_type) | data source |
| [databricks_spark_version.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/spark_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_autotermination_minutes"></a> [cluster\_autotermination\_minutes](#input\_cluster\_autotermination\_minutes) | How many minutes before automatically terminating due to inactivity. | `number` | `60` | no |
| <a name="input_cluster_create"></a> [cluster\_create](#input\_cluster\_create) | Whether to create the cluster. | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | A name for the cluster. | `string` | `null` | no |
| <a name="input_cluster_num_workers"></a> [cluster\_num\_workers](#input\_cluster\_num\_workers) | The number of workers. | `number` | `1` | no |
| <a name="input_cluster_runtime_engine"></a> [cluster\_runtime\_engine](#input\_cluster\_runtime\_engine) | The runtime engine for the cluster. | `string` | `"STANDARD"` | no |
| <a name="input_databricks_host"></a> [databricks\_host](#input\_databricks\_host) | The hostname for Databricks. | `string` | `"https://community.cloud.databricks.com"` | no |
| <a name="input_databricks_password"></a> [databricks\_password](#input\_databricks\_password) | The password for Databricks. | `string` | `null` | no |
| <a name="input_databricks_username"></a> [databricks\_username](#input\_databricks\_username) | The username for Databricks. | `string` | `null` | no |
| <a name="input_library_pypi_packages"></a> [library\_pypi\_packages](#input\_library\_pypi\_packages) | A list of PyPI libraries to install. | `list(string)` | `[]` | no |
| <a name="input_notebook_filename"></a> [notebook\_filename](#input\_notebook\_filename) | The notebook's filename. | `string` | `null` | no |
| <a name="input_notebook_language"></a> [notebook\_language](#input\_notebook\_language) | The language of the notebook. | `string` | `"PYTHON"` | no |
| <a name="input_notebook_subdirectory"></a> [notebook\_subdirectory](#input\_notebook\_subdirectory) | A name for the subdirectory to store the notebook. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the cluster. |
| <a name="output_library_id"></a> [library\_id](#output\_library\_id) | The ID of the library. |
| <a name="output_notebook_url"></a> [notebook\_url](#output\_notebook\_url) | The URL of the notebook. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
