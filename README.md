# 🚀 AWS EKS CI/CD Pipeline with Terraform, ECR, Docker, and GitHub Actions

This repository provisions an AWS EKS cluster, creates an ECR repository, builds and deploys a Dockerized Node.js app to EKS using a full CI/CD pipeline powered by GitHub Actions.

---

## 📦 Project Structure

├── terraform/
│ ├── backend/ # Manages S3 bucket & DynamoDB for state locking
│ └── infra/ # Manages EKS, ECR, VPC, subnets, etc
├── k8s/ # Kubernetes deployment & service manifests
├── app/ # Dockerized Node.js app
└── .github/workflows/ # CI/CD pipeline workflows


---

## ⚙️ Prerequisites

- AWS account with programmatic access
- EKS service roles, ECR, VPC permissions
- GitHub repository
- GitHub Secrets configured:

| Secret Name             | Description                            |
|:-----------------------|:----------------------------------------|
| `AWS_ACCESS_KEY_ID`      | AWS Access Key                          |
| `AWS_SECRET_ACCESS_KEY`  | AWS Secret Key                          |
| `AWS_REGION`             | AWS Region (e.g., `ap-south-1`)         |

---

## 📌 How It Works

### 📦 Infrastructure as Code

- `terraform/backend/`: Creates an S3 bucket and DynamoDB table for Terraform remote state and locking.
- `terraform/infra/`: Provisions an EKS cluster, public subnets, ECR repository, node groups, etc.

---

### 🐳 Docker CI/CD Pipeline

1. **Build and Push Docker Image**
   - On push to `/app` directory or manual dispatch
   - Builds Docker image and pushes to AWS ECR

2. **Deploy to EKS**
   - Deploys latest image to EKS via Kubernetes manifests (`k8s/deployment.yaml` and `service.yaml`)

---

### ☁️ GitHub Actions Workflows

| Workflow              | Description                        |
|:---------------------|:------------------------------------|
| `apply-infra.yml`      | Applies Terraform infrastructure    |
| `destroy-infra.yml`    | Destroys EKS, ECR, subnets (but keeps S3 & DynamoDB backend) |
| `build-push-ecr.yml`   | Builds and pushes Docker image to ECR |
| `deploy-to-eks.yml`    | Deploys app to EKS cluster           |

---

## 🚀 Usage

### 1️⃣ Initialize Terraform Backend

```bash
cd terraform/backend
terraform init
terraform apply -var-file=backend.tfvars -auto-approve


2️⃣ Provision Infrastructure
Trigger Apply Infra workflow from GitHub Actions tab or via CLI:

cd terraform/infra
terraform init
terraform apply -var-file=terraform.tfvars -auto-approve


3️⃣ Build and Push Docker Image
Trigger Build and Push Docker Image workflow on pushing to /app or via Actions tab

4️⃣ Deploy to EKS
Trigger Deploy to EKS workflow manually from GitHub Actions

5️⃣ Destroy Infrastructure (Safe)
Run Destroy Infra workflow from GitHub Actions tab
This will destroy EKS cluster, ECR repo, and related infra but keep backend resources

📦 Technologies
AWS EKS

Terraform

AWS ECR

Docker

Kubernetes

GitHub Actions

📸 Diagram

[ GitHub Actions ] --> [ Terraform --> AWS EKS + ECR ]
        |
        +--> [ Docker Build & Push to ECR ]
        |
        +--> [ Deploy to EKS ]


✅ To Do
Add Slack/Discord notifications (optional)

Add Helm support (optional)

Support multiple environments (dev/staging/prod)



📜 License
MIT


---

## ✅ Done.  


