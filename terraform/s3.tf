resource "aws_s3_bucket" "interna_appka" {
  bucket = "interna-appka" 
  
  tags = {
    Name = "interna-appka"
  }
}

resource "aws_s3_bucket" "tfstate-s3" {
  bucket = "tfstate-s3" 
  
  tags = {
    Name = "tfstate-s3"
  }
}




resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.tfstate-s3.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

