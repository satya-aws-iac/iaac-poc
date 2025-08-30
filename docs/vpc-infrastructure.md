# Current AWS Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition
    VPC[VPC<br/>10.0.0.0/16] --> IGW[Internet Gateway]
    
    %% Data Subnets
    subgraph "Data Subnets"
        direction TB
        DS1[Data Subnet 1<br/>10.0.5.0/24<br/>us-east-1a]
        DS2[Data Subnet 2<br/>10.0.6.0/24<br/>us-east-1b]
        DS3[Data Subnet 3<br/>10.0.7.0/24<br/>us-east-1c]
    end

    %% Private Subnets
    subgraph "Private Subnets"
        direction TB
        PS1[Private Subnet 1<br/>10.0.8.0/24<br/>us-east-1a]
        PS2[Private Subnet 2<br/>10.0.9.0/24<br/>us-east-1b]
        PS3[Private Subnet 3<br/>10.0.10.0/24<br/>us-east-1c]
    end

    %% Route Tables and Associations
    IGW --> DataRT[Data Route Table]
    DataRT --> DS1
    DataRT --> DS2
    DataRT --> DS3

    PrivateRT[Private Route Table]
    PrivateRT --> PS1
    PrivateRT --> PS2
    PrivateRT --> PS3

    %% VPC to Subnets
    VPC --> DS1
    VPC --> DS2
    VPC --> DS3
    VPC --> PS1
    VPC --> PS2
    VPC --> PS3

    %% Styling
    classDef vpc fill:#f9f,stroke:#333,stroke-width:2px
    classDef subnet fill:#bbf,stroke:#333,stroke-width:1px
    classDef gateway fill:#ff9,stroke:#333,stroke-width:1px
    classDef routeTable fill:#dfd,stroke:#333,stroke-width:1px
    
    class VPC vpc
    class DS1,DS2,DS3,PS1,PS2,PS3 subnet
    class IGW gateway
    class DataRT,PrivateRT routeTable

```

## Infrastructure Details

### VPC Configuration
- VPC CIDR: 10.0.0.0/16
- Region: us-east-1
- Environment: ${var.environment}

### Data Subnets (with Internet Access)
1. Data Subnet 1
   - CIDR: 10.0.5.0/24
   - AZ: us-east-1a
   - Name: ${environment}-data-subnet-1

2. Data Subnet 2
   - CIDR: 10.0.6.0/24
   - AZ: us-east-1b
   - Name: ${environment}-data-subnet-2

3. Data Subnet 3
   - CIDR: 10.0.7.0/24
   - AZ: us-east-1c
   - Name: ${environment}-data-subnet-3

### Private Subnets
1. Private Subnet 1
   - CIDR: 10.0.8.0/24
   - AZ: us-east-1a
   - Name: ${environment}-private-subnet-1

2. Private Subnet 2
   - CIDR: 10.0.9.0/24
   - AZ: us-east-1b
   - Name: ${environment}-private-subnet-2

3. Private Subnet 3
   - CIDR: 10.0.10.0/24
   - AZ: us-east-1c
   - Name: ${environment}-private-subnet-3

### Network Components
1. **Internet Gateway**
   - Attached to VPC
   - Provides internet access for data subnets

2. **Route Tables**
   - Data Route Table
     - Routes traffic through Internet Gateway
     - Associated with all data subnets
   - Private Route Table
     - Internal routing only
     - Associated with all private subnets

### Resource Tags
All resources are tagged with:
- Name: Resource-specific naming
- Environment: ${var.environment}
- Terraform: "true"
- Additional tags from var.global_tags
