#valores a serem exibidos após a execução do terraform apply

output "ip_publico" {
  value       = aws_instance.my_ec2_instance[*].public_ip 
  description = "O IP Publico da minha instancia"
}