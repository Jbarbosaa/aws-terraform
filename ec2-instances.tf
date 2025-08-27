# Resource block
resource "aws_instance" "myec2vm" {
    ami = data.aws_ami.amzlinux2.id # Amazon Linux 2023 AMI 2023.8.20250818.0 x86_64 HVM kernel-6.1
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_groups_id = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

    tags = {
        "Name" = "EC2 Demo"
    }
}

