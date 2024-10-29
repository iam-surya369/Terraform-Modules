resource "aws_subnet" "test-public-subnet" {
  vpc_id                  = aws_vpc.test-vpc.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.public_availability_zones[count.index]
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
    Env  = var.environment
  }
}