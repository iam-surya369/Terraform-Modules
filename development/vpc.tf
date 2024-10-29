module "dev_vpc" {
  source                     = "../modules/network"
  vpc_cidr                   = "10.0.0.0/16"
  vpc_name                   = "dev-vpc"
  environment                = "development"
  public_subnet_cidrs        = ["10.0.1.0/24"]
  public_availability_zones  = ["us-east-1a"]
  private_subnet_cidrs       = ["10.0.4.0/24"]
  private_availability_zones = ["us-east-1a"]
}