variable "db_identifier" {
  type        = string
  description = "The DB instance identifier"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of allocated storage in GB"
}

variable "engine" {
  type        = string
  description = "Database engine (e.g., mysql, postgres)"
}

variable "instance_class" {
  type        = string
  description = "Instance class (e.g., db.t3.micro)"
}

variable "db_name" {
  type        = string
  description = "Name of the initial database to create"
}

variable "username" {
  type        = string
  description = "Master DB username"
}

variable "password" {
  type        = string
  sensitive   = true
  description = "Master DB password"
}
