variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo", "bliss", "vera"]
}

# variable "module_user_names" {
#   description = "Create IAM users with these names"
#   type        = list(string)
#   default     = ["dozie", "joshua", "john"]
# }

variable "give_neo_cloudwatch_full_access" {
  description = "If true, neo gets full access to CloudWatch"
  type        = bool
}