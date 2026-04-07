# DevOps Machine Test — Azure Microservices Deployment

## Objective

Design and implement a production-ready deployment pipeline on Microsoft Azure for a simple microservices-based application with full observability, security, and failure handling.

---

## Scenario

Your team owns a small internal application that must run on Azure Kubernetes Service (AKS). The application consists of three parts:

- **Frontend** — React or static web app
- **Backend API** — Node.js or Python
- **MySQL Database**

You are expected to provision infrastructure, containerize services, deploy them to AKS, configure CI/CD, and demonstrate observability and security practices.

**Timebox: 8–12 hours**

---

## ⚠️ Important — Debugging Requirement

After scaling the backend to **5 or more pods**, the application becomes **unstable**.

You must:
1. Reproduce the issue
2. Identify the root cause
3. Fix the issue
4. Clearly explain the debugging process, findings, and resolution in the README

---

## What is Already Provided

- `frontend/` — Basic static frontend app (Dockerfile partially complete)
- `backend/` — Node.js Express API with MySQL connection (intentional bug present)
- `k8s/` — Partial Kubernetes manifests (probes, limits, secrets wiring incomplete)
- `terraform/` — Partial Terraform (Resource Group + VNet done; AKS, ACR, MySQL, Key Vault are TODOs)
- `azure-pipelines.yml` — Pipeline scaffold (stages present, steps incomplete)

---

## Requirements

### 1. Infrastructure (Terraform)

Provision the following using Terraform:

- Resource Group
- Virtual Network (VNet)
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure Database for MySQL
- Azure Key Vault (preferred) or equivalent secure secret mechanism

### 2. Containers (Docker)

- Dockerize frontend and backend services
- Push images to ACR
- Use production-ready, multi-stage Dockerfiles
- Use non-root containers where possible
- Keep images reasonably optimized

### 3. Kubernetes

Deploy the application to AKS with:

- Separate frontend and backend Deployments
- Ingress configuration (expose frontend and backend)
- Readiness and liveness probes
- Resource requests and limits
- Horizontal Pod Autoscaler (HPA)
- Proper service-to-service connectivity
- Secure DB configuration (no hardcoded credentials)

### 4. CI/CD (Azure DevOps Pipelines)

Set up Azure DevOps Pipelines to:

- Run validation/build/test steps
- Build Docker images
- Push images to ACR
- Deploy to AKS
- Verify rollout success and perform health checks after deployment
- Fail safely and support rollback or recovery handling

### 5. Security

- Do **not** hardcode secrets in source code, Terraform, or Kubernetes manifests
- Use Key Vault / Managed Identity / secure secret integration where appropriate
- Store DB credentials securely

### 6. Monitoring & Alerts

Configure:

- Azure Monitor integration
- Basic logs and metrics visibility
- Alerts for unhealthy or failing workloads

---

## Suggested Repository Structure

```
devops-machine-test/
├── frontend/
│   ├── Dockerfile
│   └── src/
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   └── src/
├── k8s/
│   ├── frontend-deployment.yaml
│   ├── backend-deployment.yaml
│   ├── ingress.yaml
│   ├── hpa.yaml
│   ├── mysql-secret-placeholder.yaml
│   └── namespace.yaml
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
├── azure-pipelines.yml
└── README.md
 

## Deliverables

Submit a GitHub repository containing:

- Application source code (frontend + backend)
- Dockerfiles
- Kubernetes manifests or Helm chart
- Terraform code
- Azure DevOps pipeline YAML
- Updated README with:
  - Setup steps
  - Architecture overview
  - Deployment steps
  - Debugging explanation (scaling instability)
  - Assumptions and trade-offs

---

## Submission

Fork this repository, complete the task on your own branch, and share the repository or branch URL along with a **short explanation of your approach**.

 
