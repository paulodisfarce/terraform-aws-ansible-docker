output "subnet_id" {
  value = aws_subnet.public[1].id
}

output "security_group_public" {
  value = aws_security_group.public.id
}
