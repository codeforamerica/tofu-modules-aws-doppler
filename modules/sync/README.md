# AWS Doppler Sync Module

This module creates and manages the integration between Doppler and AWS Secrets
Manager to enable syncing of secrets.

## Usage

Add this module to your `main.tf` (or appropriate) file and configure the inputs
to match your desired configuration. For example:

```hcl
module "doppler_sync" {
  source = "github.com/codeforamerica/tofu-modules-aws-doppler?ref=1.0.0"

  project = "my-project"
  environment = "development"
  iam_role_arn = [module.dopler.iam_role_arn]
}
```

Make sure you re-run `tofu init` after adding the module to your configuration.

```bash
tofu init
tofu plan
```

## Inputs

| Name             | Description                                                                                 | Type     | Default         | Required |
|------------------|---------------------------------------------------------------------------------------------|----------|-----------------|----------|
| iam_role_arn     | ARN of the IAM role that Doppler will assume to access AWS Secrets Manager.                 | `string` | n/a             | yes      |
| project          | Project that these resources are supporting.                                                | `string` | n/a             | yes      |
| doppler_project  | Doppler project name. If not provided, will be derived from the project and service.        | `string` | `null`          | no       |
| environment      | Environment for the deployment.                                                             | `string` | `"development"` | no       |
| environment_slug | Doppler environment slug. If not provided, the slug will be derived from the environment.   | `string` | `null`          | no       |
| service          | Optional service that these resources are supporting. Example: `"api"`, `"web"`, `"worker"` | `string` | `null`          | no       |

## Outputs

| Name           | Description                                    | Type     |
|----------------|------------------------------------------------|----------|
| integration_id | ID of the Doppler Secrets Manager integration. | `string` |
| sync_id        | ID of the Doppler sync configuration.          | `string` |


[badge-checks]: https://github.com/codeforamerica/tofu-modules-aws-doppler/actions/workflows/main.yaml/badge.svg
[badge-release]: https://img.shields.io/github/v/release/codeforamerica/tofu-modules-aws-doppler?logo=github&label=Latest%20Release
[code-checks]: https://github.com/codeforamerica/tofu-modules-aws-doppler/actions/workflows/main.yaml
[latest-release]: https://github.com/codeforamerica/tofu-modules-aws-doppler/releases/latest
[tofu-modules]: https://github.com/codeforamerica/tofu-modules
