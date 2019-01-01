provider "aws" {
  version = "~> 1.2"
  region  = "ap-southeast-2"
}

terraform {
  required_version = "0.11.8"
}

module "vpc" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.0.6"
  vpc_name = "Sample-VPC"
}


module "internal_zone" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone?ref=v0.0.2"
  # source = "git@github.com:rrakhmanto/aws-terraform-route53_internal_zone"
  target_vpc_id = "${module.vpc.vpc_id}"
  zone_name     = "testing.local"

  environment = "Sample"
}
