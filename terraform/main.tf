terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Príklad: S3 bucket
resource "aws_s3_bucket" "example_bucket_mozemjebis" {
  bucket = example_bucket_mozemjebis
  acl    = "private"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}