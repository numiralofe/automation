# AWS account details

variable "aws_namespace" {
	default = "dev"
}

# VPC
resource "aws_vpc" "commitApp-dev" {
	cidr_block = "10.10.0.0/16"
	enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}

provider "aws" {
	access_key  = "ADD_KEY_HERE"
	secret_key  = "ADD_KEY_HERE"
	region      = "eu-central-1"
}

variable "aws_domain" {
	default = "SET_DOMAIN_HERE"
}

variable "aws_domain_id" {
	default = "SET_DOMAIN_HERE"
}

variable "aws_ubuntu_ami" {
	default = "ami-3f1bd150"
}

variable "aws_keypair" {
	default = "ansible"
}

variable "aws_default_region" {
	default = "eu-central-1b"
}

variable "aws_default_instance" {
	default = "t2.small"
}

variable "aws_default_outbound_ip" {
	default = "eipalloc-3b1d4452"
}
