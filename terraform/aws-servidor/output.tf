
output "ip-address" {
  value = aws_instance.ec2-publica.public_ip
}

output "ip-dns" {
  value = aws_instance.ec2-publica.public_dns
}

output "keyname" {
  value = aws_instance.ec2-publica.key_name
}