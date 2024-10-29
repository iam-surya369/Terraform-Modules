module "prod_vpc" {
  source      = "../modules/network"
  vpc_cidr    = "192.168.0.0/16"
  vpc_name    = "prod-vpc"
  environment = "production"
  # public_subnet_cidrs        = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  # public_availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  # private_subnet_cidrs       = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
  # private_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs        = ["192.168.1.0/24"]
  public_availability_zones  = ["us-east-1a"]
  private_subnet_cidrs       = ["192.168.4.0/24"]
  private_availability_zones = ["us-east-1a"]
}