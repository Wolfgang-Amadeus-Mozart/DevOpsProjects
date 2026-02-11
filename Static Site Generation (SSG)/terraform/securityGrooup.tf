resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allows ssh on port 22"


  #defining ingress and egress rules for the security group  
  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

#defining another security group to allow HTTP TRAFFIC ON PORT 80
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allows http on port 80"

  #defining ingress and egress rules for the security group
  #ingress rule to allow http access from within the VPC    
  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_eggress" {
  name        = "allow_eggress"
  description = "Allows all outbound traffic"


  #egress rule to allow all outbound traffic    
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_eggress"
  }
}