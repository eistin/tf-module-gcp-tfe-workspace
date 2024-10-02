output "tfe_workspace_id" {
  value       = tfe_workspace.workspace.id
  description = "Get Terraform Cloud workspace ID"
}

output "tfe_workspace_name" {
  value       = tfe_workspace.workspace.name
  description = "Get Terraform Cloud workspace name"
}
