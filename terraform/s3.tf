resource "aws_s3_bucket" "interna_appka" {
  bucket = "interna-appka" 
  
  tags = {
    Name = "interna-appka"
  }
}

resource "aws_s3_bucket" "tfstate_s3_mojstate" {
  bucket = "tfstate-s3-mojstate" 
  
  tags = {
    Name = "tfstate-s3"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.tfstate_s3_mojstate.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.tfstate_s3_mojstate.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}