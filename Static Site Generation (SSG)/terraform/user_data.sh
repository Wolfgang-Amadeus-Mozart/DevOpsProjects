#!/bin/bash

# 1. Atualiza e instala o Apache (httpd)
dnf update -y
dnf install httpd -y

# 2. Inicia o serviço e garante que ele volte se o servidor reiniciar
systemctl start httpd
systemctl enable httpd

# 3. Libera o Firewall (Se for RHEL/CentOS)
# Se der erro pq não tem firewalld, o script continua (|| true)
firewall-cmd --permanent --add-service=http || true
firewall-cmd --reload || true

# 4. O PULO DO GATO (Permissões de Deploy) 🐱
# Mudamos o dono da pasta html para o usuário padrão (ec2-user)
# Assim, você consegue copiar arquivos pra lá sem usar sudo!
chown -R ec2-user:ec2-user /var/www/html
chmod -R 755 /var/www/html

# 5. Cria uma página de "Aguardando Deploy"
echo "<html><body><h1>Servidor Pronto! Aguardando a primeira noticia...</h1></body></html>" > /var/www/html/index.html