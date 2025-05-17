variable "ami_id" {
  type        = string
  description = "AMI ID to launch EC2 instance (e.g., Ubuntu 24.04)"
}

variable "instance_type" {
  type        = string
  default     = "t3.xlarge"
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name for access"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
}

variable "security_groups" {
  type        = list(string)
  description = "List of Security Group IDs for EC2"
}

variable "instance_name" {
  type        = string
  description = "Tag for the EC2 instance"
}

variable "user_data" {
  type        = string
  description = "User data script to run on instance startup"
  default     = ""
}
