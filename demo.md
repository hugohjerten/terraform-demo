# terraform demo

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
Obviously, normally you do not want to store the state on your local machine, but rather in a Bucket in the cloud that is accessible by your CD.

If you try running the plan command again, you will see that there are no changes to be applied.

### Destroy
```sh
terraform destroy
```
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
```sh
terraform destroy
```
Have a look in your GCP project, as well as in the `terraform.tfstate` file.

## part 3
We introduce the concept of modules.
We have added the director `part_3/cloud_run` which contains code for creating a service account and cloud run instance.

In this part we are using the concept of `default` values extensively.
Generally, this is bad practice; explicit is better than implicit.

### Init, create and destroy
Same as in part_2, but for part_3!

## part 4
In this part the we have introduced the concept of milieus (environments), as well as remote state storage.
There is a common `main.tf` file in the root of the `milieus` folder, but the variable values might have different values for the different milieus.

Instead of storing the state on your local machine, the state is stored in a cloud bucket.
(Make sure to update `config.gcs.tfbackend` with your bucket name that will store the state.)

### Init
To start off with we need to initialize terraform, i.e. install the providers.
```sh
cd part_4/milieus

# Initialize providers
terraform init -backend-config=dev/config.gcs.tfbackend
```

### Create
Now we create the terraform plan, and apply it.
```sh
# Create plan
terraform plan -var-file=dev/vars.auto.tfvars -out=plan.tfplan

# Apply plan
terraform apply plan.tfplan
```
You can find the state in your bucket now.
When done, don't forget to cleanup (destroy).
```sh
terraform destroy -var-file=dev/vars.auto.tfvars
```