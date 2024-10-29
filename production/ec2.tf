module "prod_ec2" {
  source = "../modules/compute"
  region = var.region
  ami = {
    us-east-1 = "ami-0866a3c8686eaeeba"
    us-east-2 = "ami-0ea3c35c5c3284d82"
  }
  instance_type     = "t2.micro"
  key_pair          = "ansible-key"
  vpc_name          = module.prod_vpc.vpc_name
  public_subnets    = module.prod_vpc.public_subnets
  private_subnets   = module.prod_vpc.private_subnets
  sg_id             = module.prod_sg.sg_id
  public_ip_address = true
  environment       = module.prod_vpc.environment
}

output "prod_ec2_public_ips" {
  value = module.prod_ec2.public_instance_ips
}

output "prod_ec2_public_dns" {
  value = module.prod_ec2.public_instance_dns
}