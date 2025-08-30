# Current AWS Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition with DNS enabled
    VPC[VPC<br/>10.0.0.0/16<br/>DNS Enabled] 
    
    %% Availability Zones
    subgraph "us-east-1a"
        DS1[Data Subnet 1<br/>10.0.5.0/24]
        PS1[Private Subnet 1<br/>10.0.8.0/24]
    end

    subgraph "us-east-1b"
        DS2[Data Subnet 2<br/>10.0.6.0/24]
        PS2[Private Subnet 2<br/>10.0.9.0/24]
    end

    subgraph "us-east-1c"
        DS3[Data Subnet 3<br/>10.0.7.0/24]
        PS3[Private Subnet 3<br/>10.0.10.0/24]
    end

    %% Route Tables
    DataRT[Data Route Table<br/>${environment}-data-rt]
    PrivateRT[Private Route Table<br/>${environment}-private-rt]

    %% VPC Connections
    VPC --> DS1
    VPC --> DS2
    VPC --> DS3
    VPC --> PS1
    VPC --> PS2
    VPC --> PS3

    %% Route Table Associations
    DataRT --> DS1
    DataRT --> DS2
    DataRT --> DS3
    
    PrivateRT --> PS1
    PrivateRT --> PS2
    PrivateRT --> PS3

    %% Styling
    classDef vpc fill:#f9f,stroke:#333,stroke-width:2px
    classDef subnet fill:#bbf,stroke:#333,stroke-width:1px
    classDef routeTable fill:#dfd,stroke:#333,stroke-width:1px
    classDef az fill:#fff,stroke:#666,stroke-width:2px,stroke-dasharray: 5 5
    
    class VPC vpc
    class DS1,DS2,DS3,PS1,PS2,PS3 subnet
    class DataRT,PrivateRT routeTable
    class "us-east-1a","us-east-1b","us-east-1c" az

```

## Infrastructure Components

### VPC Configuration
- **VPC Details**
  - CIDR Block: 10.0.0.0/16
  - DNS Hostnames: Enabled
  - DNS Support: Enabled
  - Environment Tag: ${var.environment}

### Subnet Layout by Availability Zone

#### us-east-1a
- **Data Subnet 1**
  - CIDR: 10.0.5.0/24
  - Name: ${environment}-data-subnet-1
- **Private Subnet 1**
  - CIDR: 10.0.8.0/24
  - Name: ${environment}-private-subnet-1

#### us-east-1b
- **Data Subnet 2**
  - CIDR: 10.0.6.0/24
  - Name: ${environment}-data-subnet-2
- **Private Subnet 2**
  - CIDR: 10.0.9.0/24
  - Name: ${environment}-private-subnet-2

#### us-east-1c
- **Data Subnet 3**
  - CIDR: 10.0.7.0/24
  - Name: ${environment}-data-subnet-3
- **Private Subnet 3**
  - CIDR: 10.0.10.0/24
  - Name: ${environment}-private-subnet-3

### Network Routing
1. **Data Subnets Route Table**
   - Name: ${environment}-data-rt
   - Associates with all data subnets (10.0.5.0/24, 10.0.6.0/24, 10.0.7.0/24)

2. **Private Subnets Route Table**
   - Name: ${environment}-private-rt
   - Associates with all private subnets (10.0.8.0/24, 10.0.9.0/24, 10.0.10.0/24)

### Resource Tags
All resources are tagged with:
- Name: Resource-specific naming (e.g., ${environment}-vpc)
- Environment: ${var.environment}
- Terraform: "true"
- Additional tags from var.global_tags
