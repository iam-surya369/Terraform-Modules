provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "surya-terraform-bucket"
    key    = "dev.tfstate"
    region = "us-east-1"
  }
}