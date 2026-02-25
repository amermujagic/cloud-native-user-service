🚀 Cloud-Native User Service

A production-ready cloud-native microservice built with Node.js, Docker, Kubernetes, Helm, and CI/CD.

This project demonstrates modern DevOps practices including:

• Containerization
• Multi-architecture Docker builds
• Kubernetes deployment
• Autoscaling (HPA)
• Helm packaging
• CI pipeline with Docker Hub publishing

🧱 Architecture Overview
Developer Push
      ↓
GitHub Actions (CI)
      ↓
Docker Build (multi-arch: amd64 + arm64)
      ↓
Docker Hub
      ↓
Helm Deployment
      ↓
Kubernetes Cluster (Minikube)
      ↓
Ingress → Service → Pods

🛠 Tech Stack

• Node.js (Express)
• Docker (multi-stage, multi-arch)
• Kubernetes (Minikube)
• Helm
• Horizontal Pod Autoscaler (HPA)
• ConfigMap & Secret
• GitHub Actions
• Docker Hub

📦 Project Structure
cloud-native-user-service/
│
├── app/                     # Node.js application
├── user-service-chart/      # Helm chart (deployment source of truth)
├── legacy/                  # Raw Kubernetes manifests (pre-Helm)
├── .github/workflows/       # CI pipeline
└── README.md

🐳 Docker

• Multi-stage Docker build
• Multi-architecture support (linux/amd64, linux/arm64)
• Automatic image push to Docker Hub
• Image tagging strategy:
    • latest
    • short commit SHA

Docker Hub repository:
mujagicamer/cloud-native-user-service

☸ Kubernetes Features

• Deployment with rolling updates
• Service (ClusterIP)
• Ingress (host-based routing)
• Liveness & Readiness probes
• Resource requests & limits
• Horizontal Pod Autoscaler (CPU-based)
• ConfigMap (non-sensitive config)
• Secret (sensitive config)

📦 Helm Deployment

All Kubernetes resources are managed via Helm.

Install
helm install user-service ./user-service-chart
Upgrade
helm upgrade user-service ./user-service-chart
Rollback
helm rollback user-service <revision>
View Release History
helm history user-service

🔁 CI Pipeline

On every push:
1. Checkout repository
2. Build Docker image
3. Tag with:
    • latest
    • short commit SHA
4. Push to Docker Hub

Multi-architecture builds ensure compatibility with:
• AMD64 (GitHub runner)
• ARM64 (Apple Silicon / Minikube)

🌐 Local Access

After deployment:
http://user.test/
http://user.test/users

Ingress uses host-based routing.

📈 Autoscaling

HPA automatically scales pods based on CPU utilization.

Check status:
kubectl get hpa

🔐 Configuration Management

Environment configuration is managed via:
• ConfigMap → APP_ENV, PORT
• Secret → DB_PASSWORD

Follows 12-factor app principles.

🧪 Local Development

Run locally:

cd app
npm install
npm start

Build Docker image:

docker build -t user-service:local .

🗺 Project Evolution

Initial deployment used raw Kubernetes manifests.

Deployment is now fully managed via Helm.

Legacy manifests are preserved in the legacy/ folder.

🚀 Upcoming Improvements

• Helm versioning strategy
• Dev/Prod values separation
• Terraform (Infrastructure as Code)
• GitOps (ArgoCD)
• Security scanning (Trivy)
• Advanced CI/CD enhancements

🎯 Purpose

This project demonstrates:
• Cloud-native architecture
• Kubernetes operations
• CI/CD automation
• Helm-based release management
• Multi-architecture container builds
• Production deployment patterns