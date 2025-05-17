resource "aws_db_instance" "tutoring_db" {
  identifier          = var.db_identifier
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  instance_class      = var.instance_class
  db_name             = var.db_name          # Correct property name here
  username            = var.username
  password            = var.password
  skip_final_snapshot = true
  publicly_accessible = true

  tags = {
    Name = var.db_identifier
  }
}


