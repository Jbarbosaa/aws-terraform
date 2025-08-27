# Input variables

#AWS region

variable "aws_region" {
    description =  "Region in which AWS Resources to be created"
    type = string
    default = "us-east-1"
  
}

# AWS EC2 Instance Type

variable "instance_type" {
    description = "EC2 Instance type"
    type = string
    default = "t3.micro"
    sensitive = true
}

#AWS EC2 Instance Key Pair

variable "instance_keypair" {
    description = "AWS EC2 Key Pair that need to be associated with ec2 instance"
    type = string
    default = "terraform-aws"
}
