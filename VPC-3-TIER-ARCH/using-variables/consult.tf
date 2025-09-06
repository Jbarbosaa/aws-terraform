module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

    name = "my-vpc"
    cidr = "10.0.0.0/16"

    azs =                       ["us-east-1a", "us-east-1b", "us-east-1c"]
    private_subnets =           ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets =            ["10.0.101.0/24", "10.0.102.0/24"]

    create_database_subnet_group = true
    create_database_subnet_route_table = true
    database_subnets =          ["10.0.151.0/24", "10.0.152.0/24"] 
    create_database_nat_gateway_route = false
    create_database_internet_gateway_route = false

    # NAT Gateways - Outbound Communication for Private Subnets
    enable_nat_gateway = true
    single_nat_gateway = true # one NAT Gateway for the entire VPC, not one per AZ (saves money)

    #VPC DNS Support
    enable_dns_hostnames = true
    enable_dns_support = true

    public_subnet_tags = {
        name = "my-subnet-public"
        Terraform   = "true"
        Environment = "dev"
        Type        = "public"
    }
    
    private_subnet_tags = {
        name = "my-subnet-private"
        Terraform   = "true"
        Environment = "dev"
        Type        = "private"
    }

    database_subnet_tags = {
        name = "my-subnet-database"
        Terraform   = "true"
        Environment = "dev"
        Type        = "database"
    }

    tags = {
        Terraform   = "true"
        Environment = "dev"
        Project     = "MY-VPC-3 TIER ARCHITECTURE"
    }
}