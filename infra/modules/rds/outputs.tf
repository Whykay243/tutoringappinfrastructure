output "db_endpoint" {
  value = aws_db_instance.tutoring_db.endpoint
}

output "db_name" {
  value = aws_db_instance.tutoring_db.db_name
}
