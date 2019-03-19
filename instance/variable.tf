variable "access_key" { }
variable "secret_key" { }
variable "region" {
  default = "us-east-1"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}
