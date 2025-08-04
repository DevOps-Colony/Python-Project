variable "vpc_id" {}
variable "db_subnet_ids" {
  type = list(string)
}

resource "aws_db_subnet_group" "db_subnets" {
  name       = "flask-db-subnet-group"
  subnet_ids = var.db_subnet_ids
}

resource "aws_db_instance" "mysql" {
  identifier              = "flask-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  name                    = "flaskauth"
  username                = "admin"
  password                = "StrongAdminPass123"
  skip_final_snapshot     = true
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
}

resource "aws_security_group" "db_sg" {
  name   = "rds-db-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "db_instance_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
