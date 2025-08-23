# Terraform Settings block
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

# provider block
provider "aws" {
    profile = "default" # aws credentials profile configured on your local desktop terminal
    region = "sa-east-1"
}

# Resource block
resource "awi_instance" "ec2demo" {
    ami = "ami-02556f6726aa38019" # Amazon Linux 2023 AMI 2023.8.20250818.0 x86_64 HVM kernel-6.1
    instance_type = "t3.micro"
}