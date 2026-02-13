#!/bin/bash

# 1. Atualiza e instala o Apache (httpd)
dnf update -y
dnf install httpd -y

# 2. Iniciando o serviço
systemctl start httpd
systemctl enable httpd

# 3. Liberando firewall
firewall-cmd --permanent --add-service=http || true
firewall-cmd --reload || true

# 4. Mudando o dono da pasta para ec2-user
chown -R ec2-user:ec2-user /var/www/html
chmod -R 755 /var/www/html

# 5. Cria uma página de "Aguardando Deploy"
echo "<html><body><h1>Servidor Pronto! Aguardando a primeira noticia...</h1></body></html>" > /var/www/html/index.html