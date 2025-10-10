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

resource "random_id" "suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-${random_id.suffix.hex}"
}