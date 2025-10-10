terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.1.0.0/16"
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