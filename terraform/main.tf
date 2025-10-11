terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.1.0.0/16"
  
  tags = {
    Name = "main_vpc"
  }
}

resource "random_id" "suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-${random_id.suffix.hex}"
}