# terraform-databricks-community-modules

Terraform modules for Databricks community edition

## Prerequisites

1. Install Terraform:
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
1. Install Databricks CLI
```bash
brew tap databricks/tap
brew install databricks
```

## Usage

Terraform code requires PAT (personal access token), which is NOT available for Databricks community edition.

In order to deploy Terraform code, please follow below steps:

1. Configure authentication to Databricks:
```bash
databricks configure
```
2. Initialize Terraform:
```bash
terraform init
```
3. Plan and apply code:
```bash
terraform apply
```
4. Test code:
```bash
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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
