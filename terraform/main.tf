provider "aws" {
    region = var.region
}

resource "aws_instance" "web" {
  ami           = "ami-013efd7d9f40467af" 
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }

  key_name = "key" 
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}


