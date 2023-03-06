# Terraform demo
A brief demo for introducing some concepts in [terraform](https://developer.hashicorp.com/terraform/intro).
The concepts that are introduced are:
- Providers
- Resources
- Variables
- Outputs
- Modules
- States
- Basic commands

See [`demo.md`](demo.md).

## Requirements
This demo will use the Google provider, and hence requires:
- [`tfenv`](https://github.com/tfutils/tfenv): To manage different versions of terraform. (see [`.terraform-version`](.terraform-version))
- Fill in the approprate variable values in the respective `vars.auto.tfvars` files
- Have [`gcloud` CLI](https://cloud.google.com/sdk/gcloud) installed, and be authenticated with the project you're interacting with
- You will need the following permissions in the GCP project that you're interacting with:
    - `roles/iam.serviceAccountAdmin`
    - `roles/run.admin`
    - `roles/iam.serviceAccountUser`
- The following Google APIs need to be enabled for your project:
    - `iamcredentials.googleapis.com`
    - `run.googleapis.com`
