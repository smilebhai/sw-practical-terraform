provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "aws_ami" "ec2-ami" {
  owners = ["self"]
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["CentOS-Base-Jenkins"]
  }

  most_recent = true
}

data "terraform_remote_state" "network" {
  backend = "local"

  config {
    path = "./../infra/terraform.tfstate"
  }
}

module "securityGroupModule" {
    source			= "./modules/securityGroup"
 	access_key		= "${var.access_key}"
	secret_key		= "${var.secret_key}"
	region			= "${var.region}"
	vpc_id			= "${data.terraform_remote_state.network.vpc_id}"
	environment_tag = "${var.environment_tag}"
}

module "instanceModule" {
	source 				= "./modules/instance"
	access_key 			= "${var.access_key}"
 	secret_key 			= "${var.secret_key}"
 	region     			= "${var.region}"
 	instance_ami		= "${data.aws_ami.ec2-ami.id}"
 	vpc_id 				= "${data.terraform_remote_state.network.vpc_id}"
	subnet_public_id	= "${data.terraform_remote_state.network.public_subnets[0]}"
	key_pair_name		= "${data.terraform_remote_state.network.ec2keyName}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}"]
	environment_tag 	= "${var.environment_tag}"
}
