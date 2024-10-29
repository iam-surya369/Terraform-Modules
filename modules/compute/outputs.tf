output "public_instance_ips" {
    value = aws_instance.public_ec2_instance.*.public_ip
}

output "public_instance_dns" {
    value = aws_instance.public_ec2_instance.*.public_dns
}