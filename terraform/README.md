# terraform - Infrastructure as Code

I wanted to test an open source, cloud-agnostic orchestration tool that supported immutable infrastructure, a declarative language, and a client-only architecture.

* Summary

While Chef and Ansible encourage a procedural style where you write code that specifies, step-by-step, how to to achieve some desired end state. Terraform encourage a more declarative style where you write code that specifies your desired end state, and the IAC tool itself is responsible for figuring out how to achieve that state.

With the kind of declarative approach used in Terraform, the code always represents the latest state of your infrastructure. At a glance, you can tell what’s currently deployed and how it’s configured, without having to worry about history or timing. This also makes it easy to create reusable code, as you don’t have to manually account for the current state of the world. Instead, you just focus on describing your desired state, and Terraform figures out how to get from one state to the other automatically. As a result, Terraform codebases tend to stay small and easy to understand.



### What is this repository for? ###

This repository is used to write, plan, and create 3 tier Infrastructure on Cloud providers, such as AWS integrated with ansible in order to provision basic setup.

### How do I get set up? ###


* First Steps

Edit the following files and set your credentials:
 - terraform-aws-main.tf (main aws settings)
 - terraform/files (put your local ssh keys here)
 - terraform/roles/templates/ (add your ssh public key and whitelist your local ip )

* Deployment instructions

Execute bootstrap.sh and pass as an argument a value to tag your enviorment.

* Documentation

You can learn more about terraform on hashicorp terraform project web site:
https://terraform.io
