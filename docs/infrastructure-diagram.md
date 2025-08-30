# AWS VPC Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition
    VPC[VPC<br/>10.0.0.0/16] --> IGW[Internet Gateway]
    
    %% data Subnets
    VPC --> dataSubnet1[data Subnet 1<br/>10.0.1.0/24<br/>us-east-1a]
    VPC --> dataSubnet2[data Subnet 2<br/>10.0.2.0/24<br/>us-east-1b]
    
    %% Private Subnets
    VPC --> PrivateSubnet1[Private Subnet 1<br/>10.0.3.0/24<br/>us-east-1a]
    VPC --> PrivateSubnet2[Private Subnet 2<br/>10.0.4.0/24<br/>us-east-1b]
    
    %% Route Tables and Internet Gateway
    IGW --> dataRT[data Route Table]
    dataRT --> dataSubnet1
    dataRT --> dataSubnet2
    
    %% NAT Gateway and Private Routes
    dataSubnet1 --> NAT[NAT Gateway]
    NAT --> PrivateRT[Private Route Table]
    PrivateRT --> PrivateSubnet1
    PrivateRT --> PrivateSubnet2
    
    %% Styling
    classDef vpc fill:#f9f,stroke:#333,stroke-width:2px
    classDef subnet fill:#bbf,stroke:#333,stroke-width:1px
    classDef gateway fill:#ff9,stroke:#333,stroke-width:1px
    classDef routeTable fill:#dfd,stroke:#333,stroke-width:1px
    
    class VPC vpc
    class dataSubnet1,dataSubnet2,PrivateSubnet1,PrivateSubnet2 subnet
    class IGW,NAT gateway
    class dataRT,PrivateRT routeTable
```

## Infrastructure Components

### VPC Configuration
- VPC CIDR: 10.0.0.0/16
- Region: us-east-1
- Environment: dev

### Networking Components
1. **data Subnets**
   - data Subnet 1: 10.0.1.0/24 (us-east-1a)
   - data Subnet 2: 10.0.2.0/24 (us-east-1b)

2. **Private Subnets**
   - Private Subnet 1: 10.0.3.0/24 (us-east-1a)
   - Private Subnet 2: 10.0.4.0/24 (us-east-1b)

3. **Gateways**
   - Internet Gateway: Attached to VPC
   - NAT Gateway: Located in data Subnet 1

4. **Routing**
   - data Route Table: Routes traffic through Internet Gateway
   - Private Route Table: Routes traffic through NAT Gateway

### Security and Access
- data subnets have direct internet access
- Private subnets access internet via NAT Gateway
- NAT Gateway provides outbound-only internet access for private subnets

### Resource Tags
- Environment: dev
- Project: iaac-poc
- Managed_by: Terraform
- Owner: DevOps
