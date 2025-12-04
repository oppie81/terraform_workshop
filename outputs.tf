# Outputs file

# Output the public IP of the new instance
output "web_server_public_ips" {
  value = [for instance in aws_instance.web_server : instance.public_ip]
}


