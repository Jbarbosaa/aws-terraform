#Disponible AZs
data "aws_availability_zones" "my_azones" {
    state = "available"
    filter {
      name = "opt-in-status"
      values = [ "opt-in-not-required" ]
    }
}

# Resource block
resource "aws_instance" "myec2vm" {
    for_each = toset (keys ({
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: az => details.instance_type if lenght(details.instance_type) !=0 }))

    availability_zone = each.key

    ami = data.aws_ami.amzlinux2.id # Amazon Linux 2023 AMI 2023.8.20250818.0 x86_64 HVM kernel-6.1
    instance_type = var.instance_type
    #instance_type = var.instance_type_list [1] # for list
    #instance_type = var.instance_type_map [qa] # for map
    
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id ]
    
    tags = {
        "Name" = "ec2-${each.key}"
    }
}

