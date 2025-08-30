# AWS VPC Infrastructure Diagram

```mermaid
graph TB
    %% VPC Definition
    subgraph VPC[VPC: 10.0.0.0/16]
        direction TB
        
        subgraph AZ1[Availability Zone: us-east-1a]
            direction TB
            DS1[Data Subnet 1<br>10.0.5.0/24]
            PS1[Private Subnet 1<br>10.0.8.0/24]
        end

        subgraph AZ2[Availability Zone: us-east-1b]
            direction TB
            DS2[Data Subnet 2<br>10.0.6.0/24]
            PS2[Private Subnet 2<br>10.0.9.0/24]
        end

        subgraph AZ3[Availability Zone: us-east-1c]
            direction TB
            DS3[Data Subnet 3<br>10.0.7.0/24]
            PS3[Private Subnet 3<br>10.0.10.0/24]
        end

        %% Route Tables
        DRT[Data Route Table]
        PRT[Private Route Table]
    end

    %% Route Table Associations
    DRT --> DS1
    DRT --> DS2
    DRT --> DS3

    PRT --> PS1
    PRT --> PS2
    PRT --> PS3

    %% Styling
    classDef vpc fill:#e1f7d5,stroke:#333,stroke-width:2px
    classDef az fill:#f9f9f9,stroke:#666,stroke-width:1px
    classDef subnet fill:#c2e2ff,stroke:#333,stroke-width:1px
    classDef routeTable fill:#ffe6cc,stroke:#333,stroke-width:1px

    class VPC vpc
    class AZ1,AZ2,AZ3 az
    class DS1,DS2,DS3,PS1,PS2,PS3 subnet
    class DRT,PRT routeTable
```

## Infrastructure Details

### 1. VPC Configuration
- **CIDR Block**: 10.0.0.0/16
- **DNS Support**: Enabled
- **DNS Hostnames**: Enabled
- **Region**: us-east-1

### 2. Data Subnets
| Subnet | CIDR Block | Availability Zone |
|--------|------------|------------------|
| Data Subnet 1 | 10.0.5.0/24 | us-east-1a |
| Data Subnet 2 | 10.0.6.0/24 | us-east-1b |
| Data Subnet 3 | 10.0.7.0/24 | us-east-1c |

### 3. Private Subnets
| Subnet | CIDR Block | Availability Zone |
|--------|------------|------------------|
| Private Subnet 1 | 10.0.8.0/24 | us-east-1a |
| Private Subnet 2 | 10.0.9.0/24 | us-east-1b |
| Private Subnet 3 | 10.0.10.0/24 | us-east-1c |

### 4. Routing Configuration
- **Data Route Table**
  - Associated with all data subnets
  - Each data subnet has its own route table association

- **Private Route Table**
  - Associated with all private subnets
  - Each private subnet has its own route table association

### 5. Resource Tags
- **Name**: [resource-name]-dev
- **Environment**: dev
- **Terraform**: true
- **Additional Tags**: Merged from global tags

### 6. High Availability
- Resources spread across three Availability Zones
- Each AZ contains one data subnet and one private subnet
- Ensures redundancy and fault tolerance
