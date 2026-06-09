# AWS Grocery App

## Projektbeschreibung
Eine Grocery App die auf AWS gehostet wird.

## AWS Infrastruktur
- **EC2** – docker-server (t2.micro) – App Server
- **RDS** – grocery-db (PostgreSQL) – Datenbank
- **S3** – aws-grocery-infrastructure-mo1mohammad – Dateispeicher
- **VPC** – Netzwerk
- **Security Group** – Firewall
- **IAM** – Berechtigungen

## Infrastructure as Code
Die gesamte Infrastruktur ist mit Terraform definiert.
Code liegt im `infrastructure` Ordner.

## Architektur Diagramm
![AWS Architektur](infrastructure/aws-architecture-diagram.png)
