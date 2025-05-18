resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name   # This should be "physistutors"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups

  user_data              = var.user_data

  tags = {
    Name = var.instance_name
  }
}
