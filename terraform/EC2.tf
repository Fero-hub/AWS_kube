data "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0d97a9277bcfb233f"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.ec2_key.key_name
  subnet_id     = aws_subnet.pub_subnet.id


  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
  tags = {
    Name = "web_server"
  }
}

output "instance_ip" {
  value = aws_instance.web_server.public_ip
}