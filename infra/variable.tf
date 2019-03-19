# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = "10.1.0.0/24"
}
variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  default = "10.2.0.0/24"
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
variable "public_key_path" {
  description = "Terraform AWS public key path"
  default = "./../../ssh-keys/terraform_aws_public_key_id_rsa.pub"
}
