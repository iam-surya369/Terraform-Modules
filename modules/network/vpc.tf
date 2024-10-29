resource "aws_vpc" "test-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
    Env  = var.environment
  }
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
  depends_on = [aws_vpc.test-vpc]
}