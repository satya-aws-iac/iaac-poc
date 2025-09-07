# Infrastructure as Code (IaC) - AWS VPC Module

This repository contains Terraform configurations for managing AWS infrastructure, with a focus on VPC and networking resources.

## Directory Structure

```
terraform/
├── environments/           # Environment-specific configurations
│   ├── dev/               # Development environment
│   ├── stage/             # Staging environment
│   └── prod/              # Production environment
├── modules/               # Reusable modules
│   ├── vpc/              # VPC module
│   │   ├── main.tf       # Main VPC resources
│   │   ├── variables.tf  # Input variables
│   │   ├── outputs.tf    # Output definitions
│   │   └── examples/     # Example implementations
│   └── iam/              # IAM module
├── backend.tf            # Backend configuration
└── README.md            # Documentation
```

## Usage

1. Select the appropriate environment directory
2. Initialize Terraform:
   ```
   terraform init
   ```
3. Review the plan:
   ```
   terraform plan
   ```
4. Apply the changes:
   ```
   terraform apply
   ```

## Environments

- `dev/`: Development environment with less restrictive settings
- `stage/`: Staging environment that mirrors production
- `prod/`: Production environment with strict security controls

## Modules

### VPC Module

The VPC module creates:
- VPC with custom CIDR
- Public and private subnets
- NAT Gateways
- Route tables
- Internet Gateway
- VPC endpoints (optional)

### IAM Module

Handles IAM roles and policies for the infrastructure.

## Best Practices

1. Use workspaces for environment separation
2. Enable versioning on state files
3. Use state locking
4. Implement proper tagging strategy
5. Follow security best practices
