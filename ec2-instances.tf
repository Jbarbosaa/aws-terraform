# Resource block
resource "aws_instance" "ec2demo" {
    ami = "ami-00ca32bbc84273381" # Amazon Linux 2023 AMI 2023.8.20250818.0 x86_64 HVM kernel-6.1
    instance_type = "t3.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
        "Name" = "EC2 Demo"
    }
}

