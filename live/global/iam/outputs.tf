## count 
# output "first_arn" {
#   value       = aws_iam_user.example[0].arn
#   description = "The ARN for the first user"
# }

# output "all_arns" {
#   value       = aws_iam_user.example[*].arn
#   description = "The ARNs for all users"
# }

# output "user_arns" {
#   value       = module.users[*].user_arn
#   description = "The ARNs of the created IAM users"
# }

## for_each 
# output "all_users" {
#   value       = aws_iam_user.example
#   description = "The names of all users created with the for_each loop"
# }

# output "all_arn" {
#   value       = values(aws_iam_user.example)[*].arn
#   description = "The names of all users created with the for_each loop"
# }

# output "user_arns" {
#   value       = values(module.users)[*].user_arn
#   description = "The ARNs of the created IAM users"
# }

## count-if/else-conditional
# output "neo_cloudwatch_policy_arn" {
#   value = (
#     var.give_neo_cloudwatch_full_access
#     ? aws_iam_user_policy_attachment.neo_cloudwatch_full_access[0].policy_arn
#     : aws_iam_user_policy_attachment.neo_cloudwatch_read_only[0].policy_arn
#   )
# }

output "neo_cloudwatch_policy_arn" {
  value = one(concat(
    aws_iam_user_policy_attachment.neo_cloudwatch_full_access[*].policy_arn,
    aws_iam_user_policy_attachment.neo_cloudwatch_read_only[*].policy_arn
  ))
}