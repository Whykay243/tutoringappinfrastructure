aws_region          = "us-east-1"

# Use the proper AMI ID for Ubuntu 24.04 or whichever you prefer in production
ec2_ami_id          = "ami-0abcdef1234567890"

ec2_instance_type   = "t3.xlarge"

# Your actual production SSH key pair name registered in AWS
ec2_key_name        = "your-prod-keypair"

# The subnet ID where you want to launch the EC2 instance
ec2_subnet_id       = "subnet-0123456789abcdef0"

# List your production security group IDs here
ec2_security_groups = ["sg-0123456789abcdef0"]

# RDS database master user and password (choose secure password)
rds_username        = "prod_master_user"
rds_password        = "your-prod-db-password"

# DockerHub username to pull your production Docker image
dockerhub_username  = "yajibola0011"
