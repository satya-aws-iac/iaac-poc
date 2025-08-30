resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    {
      Name = "${var.environment}-vpc"
    },
    var.tags
  )
}

# Create public subnet
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = merge(
    {
      Name = "${var.environment}-public-subnet-${count.index + 1}"
    },
    var.tags
  )
}

# Create private subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name = "${var.environment}-private-subnet-${count.index + 1}"
    },
    var.tags
  )
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = "${var.environment}-igw"
    },
    var.tags
  )
}

# Elastic IP for NAT Gateway
# resource "aws_eip" "nat" {
#   count  = length(var.private_subnet_cidrs) > 0 ? 1 : 0
#   domain = "vpc"

#   tags = merge(
#     {
#       Name = "${var.environment}-nat-eip"
#     },
#     var.tags
#   )
#}

# NAT Gateway
# resource "aws_nat_gateway" "main" {
#   count         = length(var.private_subnet_cidrs) > 0 ? 1 : 0
#   allocation_id = aws_eip.nat[0].id
#   subnet_id     = aws_subnet.public[0].id

#   tags = merge(
#     {
#       Name = "${var.environment}-nat-gateway"
#     },
#     var.tags
#   )
# }

# Route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    {
      Name = "${var.environment}-public-rt"
    },
    var.tags
  )
}

# Route table for private subnets
resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.main[0].id
#   }

  tags = merge(
    {
      Name = "${var.environment}-private-rt"
    },
    var.tags
  )
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}