# outputs the public ip
output "public_ip" {
  value = aws_instance.my_terraserver.public_ip
}
