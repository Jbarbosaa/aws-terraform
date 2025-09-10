#AWS EC2 Instance Terraform MOdule

#Bastion Host Instance - EC2 Instance that will be created in VPC Public Subnet

module "ec2-instance_private" {

    depends_on = [ module.vpc ] //depends on VPC module to provide internet to the private hosts, when the instance will use amazon repository

    source  = "terraform-aws-modules/ec2-instance/aws"
    version = "6.1.1"

    for_each = toset(module.vpc.private_subnets)

    name                                = "${var.environment}-private-vm"
    ami                                 = data.aws_ami.mzlinux2.id
    instance_type                       = var.ec2_instance_type
    key_name                            = var.ec2_key_name
    subnet_id                           = each.value
    vpc_security_group_ids              = [module.private-security-group.security_group_id]
    associate_public_ip_address         = true
    monitoring                          = false
    disable_api_termination             = false
    user_data = file("${path.module}/apache-install.sh")
    tags = merge(
        local.common_tags,
        {
            Name = "${local.name}-private-vm"
            Project = "MY-VPC-3 TIER ARCHITECTURE"
        }  
    )

}

#Meta-arguments depends on