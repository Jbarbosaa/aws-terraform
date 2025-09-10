# Get latest AMI ID for amazon Linux2 OS

data "aws_ami" "amzlinux2" {
    # executable_users = ["self"]
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["al2023-ami-*-x86_64"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]  
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}