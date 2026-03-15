# Small AZURE hands-on projects

Collection of small hands-on projects and apps focused on
backend development, Azure cloud infrastructure, and networking concepts.
Most projects are deployed using Azure with a shared container registry / ACR.

## Purpose

This repository serves as a personal learning portfolio for:

- Backend APIs (FCC)
- Cloud deployment (Azure)
- Containerization (ACR / ACA)
- Networking concepts
- Infrastructure as Code
- Real-world troubleshooting

## Projects

_Backend, API_

- Exercise tracker (FCC)
- Level 7 Header parser (FCC)

## Skills

- REST API development
- Docker containerization
- Azure deployment
-

## File structure

/azure-native-prototypes
├── /infra # Shared Platform Resources (Terraform), ACR,
│ ├── main.tf # Log Analytics, Key Vault, etc
│ ├── networks.tf  
│ └── outputs.tf  
├── /prototypes # apps, labs, projects, experiments.
│ ├── /header-parser  
│ ├── /exercise-tracker
│ └── /... more
├── /scripts # Helper Automation
│ └── deploy-all.sh
├── .gitignore
└── README.md

### Shared resources

-
