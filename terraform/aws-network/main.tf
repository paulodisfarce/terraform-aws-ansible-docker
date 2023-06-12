resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  count                   = length(var.public_subnet)
  cidr_block              = element(values(var.public_subnet), count.index)
  availability_zone       = element(keys(var.public_subnet), count.index)
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.cidr_world
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "public" {
  name        = var.name_sec
  description = var.description
  vpc_id      = aws_vpc.this.id

  dynamic "ingress" {
    for_each = var.ports_sec
    iterator = port
    content {
      description = var.description
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol
      cidr_blocks = var.cidr_blocks
    }
  }
  egress {
    from_port   = var.from_port_egress
    to_port     = var.to_port_egress
    protocol    = var.protocol_egress
    cidr_blocks = var.cidr_blocks
  }

}

