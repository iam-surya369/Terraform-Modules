module "prod_sg" {
  source         = "../modules/sg"
  vpc_id         = module.prod_vpc.vpc_id
  vpc_name       = module.prod_vpc.vpc_name
  sg_description = "Allow traffic based on dynamic ingress and egress rules"
  environment    = module.prod_vpc.environment
  ingress_values = [
    {
      description = "Allow SSH Access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP Traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS Traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_values = [
    {
      description = "Allow outbound traffic to any IP"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}