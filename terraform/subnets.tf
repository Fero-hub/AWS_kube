provider "aws" {
  region = "eu-central-1"
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.0.0/24"

  tags = {
    Name = "pub_subnet"
  }
}
