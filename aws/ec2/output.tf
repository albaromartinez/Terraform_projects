output "instance_ip" {
  description = "Ip publica de la ec2 instance"
  value = aws_instance.example.public_ip
}