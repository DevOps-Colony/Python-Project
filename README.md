# Python DevOps Project - Flask Authentication App

This is a **production-grade Flask Authentication Application** integrated with a complete **real-time DevOps pipeline** built using **Terraform**, **EKS**, **Helm**, **GitHub Actions**, and **AWS** infrastructure.

---

## 🏗 Project Architecture

Frontend (HTML) → Flask Backend (API) → EKS Cluster
↘ RDS PostgreSQL
↘ ALB Ingress (Public URL)

yaml
Copy
Edit

---

## 🚀 Features

- ✅ Flask app with login, registration, dashboard
- ✅ PostgreSQL via AWS RDS (encrypted, private subnet)
- ✅ Dockerized Flask App with secure `.env`
- ✅ Helm-based Kubernetes deployment
- ✅ EKS Cluster with Node Group, IAM, Security Groups
- ✅ Modular Terraform infra (VPC, EKS, ALB, RDS, IAM)
- ✅ GitHub Actions: CI/CD pipeline with:
  - ✅ Trivy Docker scan
  - ✅ SonarCloud analysis
  - ✅ DockerHub image push
  - ✅ Terraform infra apply/destroy
- ✅ Environments: `dev`, `qa`, `staging`

---

## 🧱 Folder Structure

Python-Project/
├── backend/ # Flask App
├── frontend/ # HTML Files
├── tests/ # Unit Tests
├── terraform/
│ ├── modules/ # Reusable Modules
│ ├── dev/ # Dev Environment
│ ├── qa/ # QA Environment
│ └── staging/ # Staging Env
├── helm/python-app/ # Helm Chart
├── .github/workflows/ # GitHub CI/CD
├── Dockerfile
├── sonar-project.properties
└── README.md

yaml
Copy
Edit

---

## 🔐 Secrets Required

Set the following secrets in **GitHub > Settings > Secrets**:

| Secret Name                | Description                         |
|----------------------------|-------------------------------------|
| `AWS_ACCESS_KEY_ID`        | AWS user access key                 |
| `AWS_SECRET_ACCESS_KEY`    | AWS user secret key                 |
| `DOCKERHUB_USERNAME`       | DockerHub username                  |
| `DOCKERHUB_TOKEN`          | DockerHub PAT/token                 |
| `SONAR_TOKEN`              | SonarCloud project token            |
| `SONAR_PROJECT_KEY`        | Your SonarCloud project key         |
| `SONAR_ORGANIZATION`       | Your SonarCloud organization        |

---

## 🛠 Usage

### ✅ Deploy Infrastructure

```bash
cd terraform/dev    # or qa, staging
terraform init
terraform apply
✅ Build & Push Docker Image (auto from CI)
bash
Copy
Edit
docker build -t flask-auth-app .
docker tag flask-auth-app docker.io/<username>/flask-auth-app:latest
docker push docker.io/<username>/flask-auth-app:latest
🌐 Access
After deployment, access your app via the ALB DNS name output from Terraform.

🧹 Destroy Infrastructure
bash
Copy
Edit
terraform destroy
Or use:

bash
Copy
Edit
./destroy.sh
🧪 Testing
bash
Copy
Edit
pytest tests/test_app.py
📊 Code Quality
SonarCloud: Static analysis for Python code

Trivy: Docker image vulnerability scanning

📌 Authors & Credits
Built by: Prashant T.

Powered by: GitHub Actions + AWS + Terraform + Helm + Docker

diff
Copy
Edit

Let me know if you want:
- Monitoring + Grafana/Prometheus
- TLS/SSL with ACM and HTTPS ALB
- Route 53 domain mapping

Shall I send the full destroy script now?