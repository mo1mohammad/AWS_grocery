# Provider - sagt Terraform dass wir AWS benutzen
provider "aws" {
  region = "eu-central-1"
}

# Security Group - unsere Firewall
resource "aws_security_group" "grocery_sg" {
  name        = "grocery-security-group"
  description = "Security Group fuer die Grocery App"

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

# EC2 Instanz - unser Server
resource "aws_instance" "grocery_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.grocery_sg.id]

  tags = {
    Name = "grocery-server"
  }
}

# RDS Datenbank
resource "aws_db_instance" "grocery_db" {
  engine         = "mysql"
  instance_class = "db.t3.micro"
  username       = "admin"
  password       = "password123"
  allocated_storage = 20

  tags = {
    Name = "grocery-database"
  }
}


# S3 Bucket für die Grocery App
resource "aws_s3_bucket" "grocery_bucket" {
  bucket = "aws-grocery-infrastructure-mo1mohammad"

  tags = {
    Name = "grocery-s3-bucket"
  }
}
