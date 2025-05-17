variable "aws_region" {
  default = "us-east-1"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  default = "t3.xlarge"
}

variable "ec2_key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ec2_subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "ec2_security_groups" {
  description = "List of security groups"
  type        = list(string)
}

variable "rds_username" {
  description = "RDS master username"
  type        = string
}

variable "rds_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "dockerhub_username" {
  description = "DockerHub username for pulling Docker images"
  type        = string
}
