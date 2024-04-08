resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                            = "private-ap-south-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/dev_test"      = "owned"
  }
}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                            = "private-ap-south-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/dev_test"      = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.32.0/20"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-south-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/dev_test" = "owned"
  }
}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/20"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-south-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/dev_test" = "owned"
  }
}