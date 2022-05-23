output "address" {
  value       = module.mysql.address
  description = "Connect to the database at this endpoint"
  sensitive   = true
}

output "port" {
  value       = module.mysql.port
  description = "The port the database is listening on"
  sensitive   = true
}

output "arn" {
  value       = module.mysql.arn
  description = "The ARN of the primary database"
}