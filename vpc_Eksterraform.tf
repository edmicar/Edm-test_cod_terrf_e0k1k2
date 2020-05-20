#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = map(
    "Name", "terraform-eks-custom-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_subnet" "custom" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.custom.id
  map_public_ip_on_launch = "true"

  tags = map(
    "Name", "terraform-eks-test2-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_internet_gateway" "custom" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "terraform-eks-test2"
  }
}

resource "aws_route_table" "custom" {
  vpc_id = aws_vpc.custom.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom.id
  }
}

resource "aws_route_table_association" "custom" {
  count = 2

  subnet_id      = aws_subnet.custom.*.id[count.index]
  route_table_id = aws_route_table.custom.id
}
