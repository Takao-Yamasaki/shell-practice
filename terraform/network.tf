# VPCの作成
resource "aws_vpc" shell_practice_vpc {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true # DNSホスト名を有効化
  tags = {
    Name = "shell_practice"
  }
}

# パブリックサブネットの作成
resource "aws_subnet" "shell_practice_public_subnet_1a" {
  vpc_id            = aws_vpc.shell_practice_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone =  "ap-northeast-1a"

  tags = {
    Name = "shell_practice"
  }
}

# Internet Gatewayの作成
resource "aws_internet_gateway" "shell_practice_igw" {
  vpc_id = aws_vpc.shell_practice_vpc.id
  tags = {
    Name = "shell_practice"
  }
}

# ルートテーブルの作成
resource "aws_route_table" "shell_practice_rt" {
  vpc_id = aws_vpc.shell_practice_vpc.id

  tags = {
    Name = "shell_practice"
  }
}

resource "aws_route" "shell_practice_rt_public" {
  route_table_id         = aws_route_table.shell_practice_rt.id
  gateway_id             = aws_internet_gateway.shell_practice_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# サブネットとルートテーブルの関連付け
resource "aws_route_table_association" "shell_practice_rt_associate" {
  subnet_id      = aws_subnet.shell_practice_public_subnet_1a.id
  route_table_id = aws_route_table.shell_practice_rt.id
}
