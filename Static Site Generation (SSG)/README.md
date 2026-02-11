# 📰 News Ops - Automated Static Site Deployment

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

> **Language / Idioma**: [🇺🇸 English](#-project-overview) | [🇧🇷 Português](#-visão-geral-do-projeto)

---

## 🇺🇸 Project Overview

This project is a **Platform Engineering** and **CI/CD** Proof of Concept (PoC). 
It consists of a fully automated pipeline that fetches data from an external API, generates a static website, and deploys it to AWS infrastructure provisioned via Infrastructure as Code (IaC).

### 🏗️ Architecture & Workflow

1.  **Infrastructure (IaC):** Terraform provisions a VPC, Public Subnets, Internet Gateway, and an EC2 instance (t3.micro) with Apache (httpd) pre-configured via `user_data`.
2.  **Application:** A Python script, containerized with Docker, consumes the **NewsAPI.org** to fetch the top technology headline of the day.
3.  **Build:** GitHub Actions spins up a runner, executes the Python script, and generates the static `index.html` artifact.
4.  **Deploy:** The pipeline automatically pushes the artifact to the AWS server using SCP (Secure Copy Protocol).
5.  **Automation:** The site is rebuilt and updated automatically every day at 08:00 AM UTC via Cron Job.

### 🛠️ Tech Stack

* **Cloud Provider:** AWS (EC2, VPC, Security Groups, IAM)
* **Infrastructure as Code:** Terraform
* **Containerization:** Docker (Python Slim Image)
* **CI/CD:** GitHub Actions
* **Scripting:** Python (App logic) & Bash (Server provisioning)
* **Web Server:** Apache (httpd) on Amazon Linux 2023

### 🚀 How to Run Locally

1.  Clone the repository.
2.  Create a `.env` file in the `/app` directory with your API Key: `NEWSAPIKEY=your_key_here`.
3.  Run via Docker:
    ```bash
    docker build -t news-gen ./app
    docker run --rm -v $(pwd)/app:/app --env-file ./app/.env news-gen
    ```

---

## 🇧🇷 Visão Geral do Projeto

Este projeto é uma prova de conceito de **Engenharia de Plataforma** e **DevOps**.
Ele demonstra um pipeline automatizado que consulta uma API externa, gera um site estático e realiza o deploy em infraestrutura AWS provisionada via código.

### 🏗️ Arquitetura e Fluxo

1.  **Infraestrutura (IaC):** O Terraform provisiona a VPC, Subnets Públicas, Internet Gateway e uma instância EC2 (t3.micro) com Apache (httpd) configurado automaticamente via `user_data`.
2.  **Aplicação:** Um script Python rodando em Docker consome a **NewsAPI.org** para buscar a manchete de tecnologia do dia.
3.  **Build:** O GitHub Actions inicia um runner, executa o script e gera o artefato estático (`index.html`).
4.  **Deploy:** O pipeline envia o arquivo HTML automaticamente para o servidor na AWS usando SCP.
5.  **Automação:** O site é reconstruído e atualizado automaticamente todos os dias às 08:00 AM UTC (Cron Job).

### 🛠️ Tecnologias Utilizadas

* **Cloud:** AWS (EC2, VPC, Security Groups, IAM)
* **IaC:** Terraform
* **Container:** Docker
* **CI/CD:** GitHub Actions
* **Linguagens:** Python & Bash
* **Servidor Web:** Apache (httpd) no Amazon Linux 2023

### 🚀 Como Rodar Localmente

1.  Clone este repositório.
2.  Crie um arquivo `.env` na pasta `/app` com sua chave: `NEWSAPIKEY=sua_chave_aqui`.
3.  Execute via Docker:
    ```bash
    docker build -t news-gen ./app
    docker run --rm -v $(pwd)/app:/app --env-file ./app/.env news-gen
    ```

---

<div align="center">
  <sub>Developed by Filipe Queiroz as part of a DevOps Portfolio.</sub>
</div>