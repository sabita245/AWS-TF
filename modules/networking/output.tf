output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet[*].id
}
output "sg" {
  value = aws_security_group.sg.id
}
