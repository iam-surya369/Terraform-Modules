resource "aws_instance" "public_ec2_instance" {
  count                       = length(var.public_subnets)
  ami                         = lookup(var.ami, var.region)
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  subnet_id                   = var.public_subnets[count.index]
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = var.public_ip_address
  tags = {
    Name        = "${var.environment}-server-${count.index + 1}"
    Environment = var.environment
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install nginx -y
    echo "<h1>${var.environment}-server</h1>" | sudo tee /var/www/html/index.html
    sudo systemctl start nginx
    sudo systemctl enable nginx
    EOF
}