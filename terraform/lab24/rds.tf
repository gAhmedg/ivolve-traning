resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = [aws_subnet.private[0].id, aws_subnet.private[1].id]

  tags = {
    Name = "main-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_instance" "db" {
  count                 = length(var.azs)
  identifier            = "main-rds-instance-${var.azs[count.index]}"
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "5.7"  
  instance_class        = "db.t3.micro"  # Change this to a supported instance class
  db_name               = "ivolvedatabase${count.index}"  # Example of generating a unique DB name
  username              = "admin"
  password              = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name  = aws_db_subnet_group.default.name
  skip_final_snapshot   = true
  availability_zone     = var.azs[count.index]

  tags = {
    Name = "main-rds-instance-${var.azs[count.index]}"
  }
}

