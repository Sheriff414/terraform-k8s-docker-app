# Terraform K8s Docker Web App

This project demonstrates how to containerize a Python web application using Docker and provision the necessary infrastructure using Terraform.

## Project Structure
```text
TERRAFORM-K8S-DOCKER-TO...
├── app/
│   ├── templates/
│   │   └── index.html
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   └── variables.tf
└── README.md
```

## Prerequisites
Before running this project, ensure you have the following installed:
* [Docker](https://docker.com)
* [Terraform](https://terraform.io)
* [Python 3.x](https://python.org)

## Getting Started

### 1. Run the App Locally
Navigate to the app directory and install dependencies:
```bash
cd app
pip install -r requirements.txt
python app.py
```

### 2. Build the Docker Image
```bash
docker build -t your-docker-username/my-app:latest .
```

### 3. Deploy Infrastructure with Terraform
Navigate to the terraform directory and initialize the provider:
```bash
cd ../terraform
terraform init
terraform plan
terraform apply
```
