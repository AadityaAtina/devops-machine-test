# DevOps Machine Test — Azure DevOps

## Objective

Build, provision, configure, and deploy a small Node.js API to Azure using:
- Docker
- Kubernetes (AKS)
- Terraform
- Ansible
- Azure DevOps Pipelines

---

## Scenario

Your team has a small internal API that must be deployed to **Azure Kubernetes Service (AKS)**. A Linux bootstrap host is also used for operational setup tasks. You must provision infrastructure with Terraform, configure a host with Ansible, containerize the app with Docker, and deliver it via Azure DevOps CICD.

**Timebox: 4–6 hours**

---

## What is already provided

- A small Node.js Express API (`app/src/server.js`)
- Basic folder structure
- Incomplete Docker, Kubernetes, Terraform, Ansible, and Azure DevOps pipeline scaffold

---

## Your Tasks

1. **Improve the Dockerfile** so the app is production-ready (multi-stage build, non-root user, minimal image size).
2. **Add test/lint step support** in the pipeline.
3. **Complete Terraform** to provision at minimum:
   - Resource Group
   - Azure Container Registry (ACR)
   - Azure Kubernetes Service (AKS)
4. **Complete Kubernetes manifests** to deploy the API with:
   - Readiness and liveness probes
   - Resource requests and limits
   - A Service of type ClusterIP (or LoadBalancer)
5. **Complete Ansible** to configure a Linux bootstrap host with required tooling (kubectl, helm, etc.).
6. **Complete the Azure DevOps pipeline** to:
   - Build and test the app
   - Build and tag the Docker image
   - Push image to ACR
   - Deploy to AKS
   - Verify rollout and health endpoint (`/health`)
   - Support rollback on failure
7. **Document** setup, assumptions, and commands in `README.md`,And create Pdf file having Screenshots of Important steps with short Explanation .

---

## Expected Deliverables

- Updated `Dockerfile`
- Working `k8s/` manifests
- Working `terraform/` code
- Working `ansible/playbook.yaml`
- Working `azure-pipelines.yml`
- Updated `README.md` with setup instructions

## Bonus Points

- Helm chart instead of raw manifests
- Separate dev/prod environment variables
- Rollback support in pipeline
- Smoke test after deployment
- Non-root container user
- Remote Terraform state (Azure Blob)

---

## Red Flags (avoid these)

- Hardcoded secrets in YAML or Terraform
- Kubernetes manifests with no probes or resource limits
- Terraform with no variables or outputs
- Ansible used as plain shell with no idempotence
- Pipeline that builds but has no deployment validation

---

## Submission

Fork this repository, complete your work on a branch, and share the link to your fork/branch along with a short explanation of your approach. Create Pdf file having Screenshots of Important steps with short Explanation .

