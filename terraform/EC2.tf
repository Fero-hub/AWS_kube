data "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
}

resource "aws_instance" "web_server" {     #3.77.192.54
  ami           = "ami-0d97a9277bcfb233f"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.ec2_key.key_name
  subnet_id     = aws_subnet.pub_subnet.id
  associate_public_ip_address = true


  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  iam_instance_profile = aws_iam_instance_profile.test_profile.name

  tags = {
    Name = "web_server"
  }
}

output "instance_ip" {
  value = aws_instance.web_server.public_ip
}

resource "aws_iam_role" "role" {
  name = "test_role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_policy" "s3_rw" {
  name = "s3_rw_for_app"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ]
      Resource = [
        "arn:aws:s3:::interna-appka",
        "arn:aws:s3:::interna-appka/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "s3_rw_attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.s3_rw.arn
}


