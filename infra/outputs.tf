output "ec2_public_ip" {
  value = module.ec2.public_ip
  description = "Public IP of the EC2 instance"
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
  description = "Endpoint of the RDS database"
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
  description = "Name of the S3 bucket"
}
