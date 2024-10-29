module "dev_sg" {
  source         = "../modules/sg"
  vpc_id         = module.dev_vpc.vpc_id
  vpc_name       = module.dev_vpc.vpc_name
  sg_description = "Allow traffic based on dynamic ingress and egress rules"
  environment    = module.dev_vpc.environment
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
    },
    {
      description = "Allow Jenkins Access"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24"]
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