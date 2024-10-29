output "vpc_id" {
    value = aws_vpc.test-vpc.id
}

output "vpc_name" {
  value = var.vpc_name
}

output "public_subnets" {
  value = aws_subnet.test-public-subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.test-private-subnet.*.id
}

output "environment" {
    value = var.environment
}