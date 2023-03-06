# terraform demo

## Setup
To be able to run this tutorial, you will need to have the following:
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

## part 1
Creating a service account, and deleting it again.
Check out the documentation on the [`google_service_account` terraform resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account).

### Init
To start off with we need to initialize terraform, i.e. install the providers.
```sh
cd part_1

# Initialize providers
terraform init
```

### Create
Now we create the terraform plan, and apply it.
```sh
# Create plan
terraform plan -out=plan.tfplan

# Apply plan
terraform apply plan.tfplan
```
Have a look in your GCP project, to make sure that it has been created.
Also, have a look in the `terraform.tfstate` file.

### Destroy
Now remove the `example_service_account` resource in `part_1/main.tf`, and try running the plan & apply commands again.
Have a look in your GCP project, as well as in the `terraform.tfstate` file.

## part 2
We create a new service account, as well as a basic cloud run.
In addition, we introduce some more files.
- variables are now specified in a separate `variables.tf` file
- output values are specified in `output.tf`

### Init
To start off with we need to initialize terraform, i.e. install the providers.
```sh
cd part_2

# Initialize providers
terraform init
```

### Create
Now we create the terraform plan, and apply it.
```sh
# Create plan
terraform plan -out=plan.tfplan

# Apply plan
terraform apply plan.tfplan
```
Have a look in your GCP project, to make sure that it has been created.
Also, have a look in the `terraform.tfstate` file.

### Access
Access this cloud run instance by running the following command:
```sh
curl -X GET <REPLACE-WITH-OUTPUT-URL> -H "Authorization: Bearer $(gcloud auth print-identity-token)"
```

### Destroy
Now remove the `example_service_account` resource in `part_2/main.tf`, and try running the plan & apply commands again.
Have a look in your GCP project, as well as in the `terraform.tfstate` file.
