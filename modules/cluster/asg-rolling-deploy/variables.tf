variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-0892d3c7ee96c0bf7"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string

  validation {
    condition = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only free tier is allowed: t2.micro | t3.micro."
  }
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  validation {
    condition     = var.min_size > 0 && var.min_size <= 10
    error_message = "ASGs must be of size 1-10 (inclusive)."
  }
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  validation {
    condition     = var.max_size > 0 && var.max_size <= 10
    error_message = "ASGs must be of size 1-10 (inclusive)."
  }
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The User Data script to run in each Instance at boot"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type        = list(string)
}

variable "target_group_arns" {
  description = "The ARNs of ELB target groups in which to register Instances"
  type        = list(string)
  default     = []
}

variable "health_check_type" {
  description = "The type of health check to perform. Must be one of: EC2, ELB."
  type        = string
  default     = "EC2"

  validation {
    condition     = contains(["EC2", "ELB"], var.health_check_type)
    error_message = "The health_check_type must be one of: EC2 | ELB."
  }
}

variable "server_port" {
  type        = number
  default     = 8080
  description = "Application server port"
}
