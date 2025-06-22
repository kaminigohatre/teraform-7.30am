#create vpc
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "test_server"
    }
  
}
#create subnets
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1b"
    tags = {
    Name = "public_subnet"
    }
  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
    Name = "private_subnet"
    }
  
}

#create IG and attach to vpc
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
  
}

#create nat gateway

#create route table and edit 
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.dev.id
}
  
}

#subnet association to route
resource "aws_route_table_association" "dev" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.dev.id
  
}
# subnet association for nat gateway

#create sg group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }

