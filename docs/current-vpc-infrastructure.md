# Current AWS Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition
    VPC[VPC<br/>10.0.0.0/16<br/>DNS Enabled] 
    
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

    %% Route Tables
    DataRT[Data Route Table<br/>${environment}-data-rt]
    PrivateRT[Private Route Table<br/>${environment}-private-rt]

    %% VPC to Subnets Connections
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
    
    class VPC vpc
    class DS1,DS2,DS3,PS1,PS2,PS3 subnet
    class DataRT,PrivateRT routeTable

```

## Infrastructure Details

### VPC Configuration
- **VPC Settings**
  - CIDR Block: 10.0.0.0/16
  - DNS Hostnames: Enabled
  - DNS Support: Enabled
  - Name Tag: ${environment}-vpc

### Subnet Layout

#### Data Subnets
1. **Data Subnet 1**
   - CIDR: 10.0.5.0/24
   - AZ: us-east-1a
   - Name: ${environment}-data-subnet-1

2. **Data Subnet 2**
   - CIDR: 10.0.6.0/24
   - AZ: us-east-1b
   - Name: ${environment}-data-subnet-2

3. **Data Subnet 3**
   - CIDR: 10.0.7.0/24
   - AZ: us-east-1c
   - Name: ${environment}-data-subnet-3

#### Private Subnets
1. **Private Subnet 1**
   - CIDR: 10.0.8.0/24
   - AZ: us-east-1a
   - Name: ${environment}-private-subnet-1

2. **Private Subnet 2**
   - CIDR: 10.0.9.0/24
   - AZ: us-east-1b
   - Name: ${environment}-private-subnet-2

3. **Private Subnet 3**
   - CIDR: 10.0.10.0/24
   - AZ: us-east-1c
   - Name: ${environment}-private-subnet-3

### Network Routing
1. **Data Route Table**
   - Name: ${environment}-data-rt
   - Associates with all data subnets

2. **Private Route Table**
   - Name: ${environment}-private-rt
   - Associates with all private subnets

### Resource Tagging
All resources include the following tags:
- Name: Resource-specific naming (e.g., ${environment}-vpc)
- Environment: ${var.environment}
- Additional custom tags from var.tags
