# Create security group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
    name = "vpc-ssh"
    description = "Dev VPC SSH"
    ingress {
        description = "Allow port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["187.3.85.72/32"]
    }

    egress {
        description = "Allow my ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "vpc-ssh"
    }
}

# Create security Group - Web Traffic

resource "aws_security_group" "vpc-web" {
    name = "vpc-web"
    description = "Dev VPC WEB"
    ingress {
        description = "Allow port 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["187.3.85.72/32"]
    }

    ingress {
        description = "Allow port 80 (HTTP)"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["187.3.85.72/32"]
    }

    egress {
        description = "Allow my ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "vpc-web"
    }
}