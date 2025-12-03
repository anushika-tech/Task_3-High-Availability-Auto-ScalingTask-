terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# --- VPC ---
resource "aws_vpc" "Anushika_Pandey_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = { Name = "Anushika_Pandey_VPC" }
}

# --- PUBLIC Subnets ---
resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.Anushika_Pandey_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = { Name = "Anushika_Pandey_Public_1" }
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.Anushika_Pandey_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = { Name = "Anushika_Pandey_Public_2" }
}

# --- PRIVATE Subnets ---
resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.Anushika_Pandey_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  tags = { Name = "Anushika_Pandey_Private_1" }
}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.Anushika_Pandey_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"
  tags = { Name = "Anushika_Pandey_Private_2" }
}

# --- IGW ---
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Anushika_Pandey_vpc.id
  tags = { Name = "Anushika_Pandey_IGW" }
}

# --- NAT Gateway ---
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.igw]
  tags = { Name = "Anushika_Pand_
