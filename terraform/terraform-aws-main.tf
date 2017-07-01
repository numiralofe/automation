# AWS account details

variable "aws_namespace" {
	default = "TAG"
}

# VPC
resource "aws_vpc" "epg-TAG" {
	cidr_block = "10.10.0.0/16"
	enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}

provider "aws" {
	access_key  = "PUT_AWS_KEYS_HERE"
	secret_key  = "PUT_AWS_KEYS_HERE"
	region      = "eu-central-1"
}

variable "aws_domain" {
	default = "epgpay.com"
}

variable "aws_domain_id" {
	default = "PUT_AWS_DOMAIN_HERE"
}

variable "aws_ubuntu_ami" {
	default = "ami-3f1bd150"
}

variable "aws_keypair" {
	default = "PUT_AWS_USERNAME_HERE"
}

variable "aws_default_region" {
	default = "eu-central-1b"
}

variable "aws_default_instance" {
	default = "t2.small"
}

variable "aws_default_outbound_ip" {
	default = "DEFINE_STATIC_OUTBOUND_IP_ID"
}
