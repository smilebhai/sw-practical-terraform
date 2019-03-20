![Terraform](terraform-aws.png)

# Terraform / AWS EC2

Utilize Terraform, an “infrastructure as code” tool to create Amazon Web Services (AWS) infrastructure and deploy EC2 instance.

---

## Create an AWS infrastructure

Generate new keypair for AWS if one does not already exist

    $ ssh-keygen -t rsa -C "terraform_aws_public_key_id_rsa" -f ./../ssh-keys/terraform_aws_public_key_id_rsa

Import into AWS using this command or manually import from AWS EC2 console

    $ aws ec2 import-key-pair --key-name "terraform_aws_public_key_id_rsa" --region us-east-1 --public-key-material "$(cat ./../ssh-keys/terraform_aws_public_key_id_rsa.pub)"

`NOTE`: Make sure to change the aws profile as well as `--region` and `--key-name` accordingly.

Initialize a working directory containing Terraform configuration files

    $ terraform init

Create an execution plan

    $ terraform plan -out=terraform_aws_infra_plan -var-file=credentials.tfvars

Apply the changes required to reach the desired state of the configuration

    $ terraform apply "terraform_aws_infra_plan"

Destroy the Terraform-managed infrastructure

    $ terraform destroy

## Create an AWS EC2 Instance

Specify an existing aws-ami in your account under "values" in resources.tf or filter to select ami from Marketplace

Initialize a working directory containing Terraform configuration files

    $ terraform init

Create an execution plan

    $ terraform plan -out=terraform_aws_instance_plan -var-file=credentials.tfvars

Apply the changes required to reach the desired state of the configuration

    $ terraform apply "terraform_aws_instance_plan"

Destroy the Terraform-managed instance

    $ terraform destroy

## Resources

* [Terraform CLI](https://www.terraform.io/docs/commands/destroy.html)
* [AWS Provider](https://www.terraform.io/docs/providers/aws)
