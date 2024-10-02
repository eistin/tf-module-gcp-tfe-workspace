/******************************************
  TFE WORKSPACE
 *****************************************/

resource "tfe_workspace" "workspace" {
  name         = var.tfe_workspace_name
  organization = var.tfe_organization
  project_id   = var.tfe_project_id
  tag_names    = var.tfe_tags
  description  = "Managed by Terraform"

  terraform_version = var.terraform_version

  working_directory = var.tfe_working_directory

  remote_state_consumer_ids = var.tfe_remote_state_consumer_ids
}

resource "tfe_workspace_settings" "workspace_settings" {
  workspace_id   = tfe_workspace.workspace.id
  execution_mode = var.tfe_execution_mode
}

/******************************************
  TFE VARIABLES
 *****************************************/

resource "tfe_variable" "gcp_provider_auth" {
  key          = "TFC_GCP_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "gcp_sa_email" {
  key          = "TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL"
  value        = google_service_account.tfe_service_account.email
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "gcp_provider_name" {
  key          = "TFC_GCP_WORKLOAD_PROVIDER_NAME"
  value        = var.gcp_workload_provider_name
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "gcp_project_id" {
  key          = "project_id"
  value        = var.gcp_project_id
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

/******************************************
  SERVICE ACCOUNT / IAM
 *****************************************/

data "google_project" "target" {
  project_id = var.gcp_project_id
}

# SERVICE ACCOUNT
resource "google_service_account" "tfe_service_account" {
  project      = var.gcp_project_id
  account_id   = "terraform-cloud-admin"
  display_name = "Terraform Cloud Admin"
  description  = "Service Account used by Terraform Cloud - Managed by Terraform"
}

# GIVE OWNER RIGHTS (TO IMPROVE)
resource "google_project_iam_member" "tfe_iam_owner" {
  project = var.gcp_project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.tfe_service_account.email}"
}

# IAM POLICY FOR CLOUD IDENTITY
data "google_iam_policy" "tfe_workload_identity" {
  binding {
    role = "roles/iam.workloadIdentityUser"

    members = [
      "principalSet://iam.googleapis.com/${var.gcp_workload_identity_pool_name}/attribute.workspace_id/${tfe_workspace.workspace.id}",
    ]
  }
}

# BIND IAM POLICY TO SA
resource "google_service_account_iam_policy" "terraform_cloud_workload_identity" {

  service_account_id = google_service_account.tfe_service_account.name
  policy_data        = data.google_iam_policy.tfe_workload_identity.policy_data
}
