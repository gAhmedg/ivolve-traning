provider "aws" {
  region = "us-west-2" # Specify your desired AWS region
}

resource "aws_db_instance" "example" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = "5.7"  
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  tags = {
    Name = "MyRDSInstance"
    Environment = "dev"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow access to RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS security group"
  }
}
