<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | Google Cloud Project ID to use | `string` | n/a | yes |
| <a name="input_gcp_workload_identity_pool_name"></a> [gcp\_workload\_identity\_pool\_name](#input\_gcp\_workload\_identity\_pool\_name) | Name of the Workload Identity Pool to use for Terraform Cloud | `string` | n/a | yes |
| <a name="input_gcp_workload_provider_name"></a> [gcp\_workload\_provider\_name](#input\_gcp\_workload\_provider\_name) | Name of the Workload Identity Provider to use for Terraform Cloud | `string` | n/a | yes |
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | The Terraform Cloud organisation name | `string` | n/a | yes |
| <a name="input_tfe_project_id"></a> [tfe\_project\_id](#input\_tfe\_project\_id) | The Terraform Cloud Project ID to use as parent | `string` | n/a | yes |
| <a name="input_tfe_working_directory"></a> [tfe\_working\_directory](#input\_tfe\_working\_directory) | A relative path that Terraform will execute within. Defaults to the root of your repository. | `string` | n/a | yes |
| <a name="input_tfe_workspace_name"></a> [tfe\_workspace\_name](#input\_tfe\_workspace\_name) | Name of the workspace to create | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform version to be used by Terraform Cloud | `string` | `"~> 1.9.0"` | no |
| <a name="input_tfe_execution_mode"></a> [tfe\_execution\_mode](#input\_tfe\_execution\_mode) | Which execution mode to use. Using HCP Terraform, valid values are remote, local or agent | `string` | `"remote"` | no |
| <a name="input_tfe_remote_state_consumer_ids"></a> [tfe\_remote\_state\_consumer\_ids](#input\_tfe\_remote\_state\_consumer\_ids) | List of Terraform Cloud Workspaces to share states or outputs with | `list(string)` | `[]` | no |
| <a name="input_tfe_tags"></a> [tfe\_tags](#input\_tfe\_tags) | Tags to apply to the Terraform Cloud project | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfe_workspace_id"></a> [tfe\_workspace\_id](#output\_tfe\_workspace\_id) | Get Terraform Cloud workspace ID |
| <a name="output_tfe_workspace_name"></a> [tfe\_workspace\_name](#output\_tfe\_workspace\_name) | Get Terraform Cloud workspace name |
<!-- END_TF_DOCS -->