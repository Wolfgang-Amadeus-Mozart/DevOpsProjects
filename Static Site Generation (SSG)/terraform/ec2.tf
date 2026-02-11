resource "aws_instance" "my_ec2_instance" {
  count         = 1
  ami           = "ami-0ad50334604831820"
  instance_type = "t3.micro"
  key_name      = "TerraformKeyPair"
  user_data     = file("user_data.sh")

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_http.id,
    aws_security_group.allow_eggress.id
  ]

  tags = {
    Name = "MySecondTerraform_EC2_Instance-${count.index + 1}"
  }
}