output "public_instance_ip" {
  description = "Public IP of the Public EC2 Instance"
  value       = aws_instance.web[0].public_ip
}

output "private_instance_ip" {
  description = "Private IP of the Private EC2 Instance"
  value       = aws_instance.web[1].private_ip
}
