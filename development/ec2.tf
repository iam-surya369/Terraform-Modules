module "dev_ec2" {
  source = "../modules/compute"
  region = var.region
  ami = {
    us-east-1 = "ami-0866a3c8686eaeeba"
    us-east-2 = "ami-0ea3c35c5c3284d82"
  }
  instance_type     = "t2.micro"
  key_pair          = "ansible-key"
  vpc_name          = module.dev_vpc.vpc_name
  public_subnets    = module.dev_vpc.public_subnets
  private_subnets   = module.dev_vpc.private_subnets
  sg_id             = module.dev_sg.sg_id
  public_ip_address = true
  environment       = module.dev_vpc.environment
}