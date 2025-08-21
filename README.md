# AWS Doppler Module

[![Main Checks][badge-checks]][code-checks] [![GitHub Release][badge-release]][latest-release]

This module creates and manages the permissions and configuration necessary to
sync secrets between Doppler and [AWS Secrets Manager][secrets-manager].

## Usage

Add this module to your `main.tf` (or appropriate) file and configure the inputs
to match your desired configuration. For example:

```hcl
module "doppler" {
  source = "github.com/codeforamerica/tofu-modules-aws-doppler?ref=1.0.0"

  project = "my-project"
  environment = "development"
  kms_key_arns = [module.secrets.kms_key_arn]
}
```

Make sure you re-run `tofu init` after adding the module to your configuration.

```bash
tofu init
tofu plan
```

## Inputs

| Name                   | Description                                                                                 | Type     | Default          | Required |
|------------------------|---------------------------------------------------------------------------------------------|----------|------------------|----------|
| doppler_workspace_id   | Slug for the Doppler workspace for syncing.                                                 | `string` | n/a              | yes      |
| kms_key_arns           | ARNs of the KMS keys to allow access to.                                                    | `string` | n/a              | yes      |
| project                | Project that these resources are supporting.                                                | `string` | n/a              | yes      |
| create_sync            | Whether to create a sync for the Doppler project.                                           | `bool`   | `true`           | no       |
| doppler_aws_account_id | ID of the Doppler AWS account to authorize.                                                 | `string` | `"299900769157"` | no       |
| environment            | Environment for the deployment.                                                             | `string` | `"development"`  | no       |
| service                | Optional service that these resources are supporting. Example: `"api"`, `"web"`, `"worker"` | `string` | `null`           | no       |
| tags                   | Optional tags to be applied to all resources.                                               | `list`   | `[]`             | no       |

## Outputs

| Name                   | Description                                          | Type     |
|------------------------|------------------------------------------------------|----------|
| doppler_integration_id | ID of the Doppler Secrets Manager integration.       | `string` |
| doppler_sync_id        | ID of the Doppler sync configuration.                | `string` |
| role_arn               | ARN of the IAM role to assume for accessing secrets. | `string` |


[badge-checks]: https://github.com/codeforamerica/tofu-modules-aws-doppler/actions/workflows/main.yaml/badge.svg
[badge-release]: https://img.shields.io/github/v/release/codeforamerica/tofu-modules-aws-doppler?logo=github&label=Latest%20Release
[code-checks]: https://github.com/codeforamerica/tofu-modules-aws-doppler/actions/workflows/main.yaml
[latest-release]: https://github.com/codeforamerica/tofu-modules-aws-doppler/releases/latest
[tofu-modules]: https://github.com/codeforamerica/tofu-modules
