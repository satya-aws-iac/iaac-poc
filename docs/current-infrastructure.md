# AWS Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition
    VPC[VPC<br/>10.0.0.0/16] --> IGW[Internet Gateway]
    
    %% Data Subnets
    subgraph "Data Subnets"
        DS1[Data Subnet 1<br/>10.0.6.0/24<br/>us-east-1a]
        DS2[Data Subnet 2<br/>10.0.7.0/24<br/>us-east-1b]
    end

    %% Private Subnets
    subgraph "Private Subnets"
        PS1[Private Subnet 1<br/>10.0.8.0/24<br/>us-east-1a]
        PS2[Private Subnet 2<br/>10.0.9.0/24<br/>us-east-1b]
        PS3[Private Subnet 3<br/>10.0.10.0/24<br/>us-east-1c]
    end

    %% Route Tables
    IGW --> DataRT[Data Route Table]
    DataRT --> DS1
    DataRT --> DS2

    PrivateRT[Private Route Table]
    PrivateRT --> PS1
    PrivateRT --> PS2
    PrivateRT --> PS3

    %% VPC to Subnets
    VPC --> DS1
    VPC --> DS2
    VPC --> PS1
    VPC --> PS2
    VPC --> PS3

    %% Styling
    classDef vpc fill:#f9f,stroke:#333,stroke-width:2px
    classDef subnet fill:#bbf,stroke:#333,stroke-width:1px
    classDef gateway fill:#ff9,stroke:#333,stroke-width:1px
    classDef routeTable fill:#dfd,stroke:#333,stroke-width:1px
    
    class VPC vpc
    class DS1,DS2,PS1,PS2,PS3 subnet
    class IGW gateway
    class DataRT,PrivateRT routeTable

```

## Infrastructure Components

### VPC Configuration
- VPC CIDR: 10.0.0.0/16
- Region: us-east-1
- Environment: dev

### Data Subnets
- Data Subnet 1: 10.0.6.0/24 (us-east-1a)
- Data Subnet 2: 10.0.7.0/24 (us-east-1b)
Features:
  - Internet access through IGW
  - Custom naming: ${environment}-data-subnet-1,2

### Private Subnets
- Private Subnet 1: 10.0.8.0/24 (us-east-1a)
- Private Subnet 2: 10.0.9.0/24 (us-east-1b)
- Private Subnet 3: 10.0.10.0/24 (us-east-1c)
Features:
  - No direct internet access
  - Custom naming: ${environment}-private-subnet-1,2,3

### Networking Components
1. **Internet Gateway**
   - Attached to VPC
   - Provides internet access for data subnets

2. **Route Tables**
   - Data Route Table: Routes traffic through Internet Gateway
   - Private Route Table: Internal routing only

### Resource Tags
All resources are tagged with:
- Environment: ${environment}
- Name: Resource-specific naming
- Terraform: "true"
- Additional custom tags from var.global_tags
