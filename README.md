# AWS IAM Terraform module - v6 migration

This is a one time snapshot of the `terraform-aws-iam/modules/iam-role-for-service-accounts` module to help users migrate from `v5.60` to `v6.0`. It offers a path for users to upgrade safely without the need of manual intervention (i.e. - local Terraform CLI commands), allowing users to upgrade through their normal Terraform CI/CD process.

This module will not receive updates in the future, it is only intended to help users migrate by managing the changeover from individual policies to a single policy. This module contains all of the changes made in [`v6.0`](https://github.com/terraform-aws-modules/terraform-aws-iam/pull/2858), except with the addition of individual sub-modules that are specific to the individual roles/policies to avoid the `Each resource can have moved from only one source resource.` caused by multiple Terraform moved blocks pointing to the same destination. To perform the upgrade:

1. Ensure your current module definition is on `v5.60`
2. Change the source of your module to point to this module. Here we are using a git hash since this module will not have any releases nor be published on the Terraform registry:

    ```diff
    module "<UPDATE-TO-YOUR-NAME>" {
    -  source  = "terraform-aws-modules/iam/aws"
    -  version = "~> 5.60"
    +  source  = "git@github.com:clowdhaus/terraform-aws-iam-migrate-v5-v6.git//<SUB-MODULE-DIR>>?ref=d09c66945d0e585332a4c0f886baf0454a898876"

    ...
    }
    ```

3. Review the upgrade guide for `v6.0` and make any necessary changes to your module definition
4. Re-init (`terraform init -upgrade`) and apply the changes using this module. This will migrate the individually named role resource to a generic role resource and avoid re-creating the role when upgrding to `v6.x`
5. Once the changes have been applied, change the source of your module back to the `terraform-aws-iam` module using the appropriate version (i.e. - `v6.1` or later). Here we are using the latest version of the module, but you can pin to a specific version if you prefer.

    ```diff
    module "iam" {
    -  source  = "git@github.com:clowdhaus/terraform-aws-iam-migrate-v5-v6.git//<SUB-MODULE-DIR>>?ref=d09c66945d0e585332a4c0f886baf0454a898876"
    +  source  = "terraform-aws-modules/iam/aws"
    +  version = "~> 6.1"

    ...
    }
    ```

6. Re-init (`terraform init -upgrade`) and apply the changes - you can now continue using the `terraform-aws-iam` module as you were before, but on `v6.x` :tada:!

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-migrate-v5-v6/blob/main/LICENSE).
