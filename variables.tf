/******************************************
  TFE
 *****************************************/

// Mandatory
variable "tfe_workspace_name" {
  type        = string
  description = "Name of the workspace to create"
}

// Mandatory
variable "tfe_organization" {
  type        = string
  description = "The Terraform Cloud organisation name"
}

// Mandatory
variable "tfe_working_directory" {
  type        = string
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
}

// Mandatory
variable "tfe_project_id" {
  type        = string
  description = "The Terraform Cloud Project ID to use as parent"
}

variable "tfe_execution_mode" {
  type        = string
  description = "Which execution mode to use. Using HCP Terraform, valid values are remote, local or agent"
  default     = "remote"
}

variable "tfe_tags" {
  type        = list(string)
  description = "Tags to apply to the Terraform Cloud project"
  default     = []
}

variable "tfe_remote_state_consumer_ids" {
  type        = list(string)
  description = "List of Terraform Cloud Workspaces to share states or outputs with"
  default     = []
}

variable "terraform_version" {
  type        = string
  description = "Terraform version to be used by Terraform Cloud"
  default     = "~> 1.9.0"
}

/******************************************
  GCP
 *****************************************/

// Mandatory
variable "gcp_project_id" {
  type        = string
  description = "Google Cloud Project ID to use"
}

// Mandatory
variable "gcp_workload_provider_name" {
  type        = string
  description = "Name of the Workload Identity Provider to use for Terraform Cloud"
}

// Mandatory
variable "gcp_workload_identity_pool_name" {
  type        = string
  description = "Name of the Workload Identity Pool to use for Terraform Cloud"
}
