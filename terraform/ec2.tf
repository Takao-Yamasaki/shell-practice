# EC2の作成
resource "aws_instance" "shell_practice" {
	ami = data.aws_ami.amzlinux2.id
	instance_type = "t3.micro"
  availability_zone = "ap-northeast-1a"
  vpc_security_group_ids      = [aws_security_group.shell_practice_sg.id]
  subnet_id                   = aws_subnet.shell_practice_public_subnet_1a.id
  associate_public_ip_address = "true"
  key_name                    = "shell-keypair"
	
	# 最新のAMIが変更になっても、再作成を回避
	lifecycle {
    ignore_changes = [
      ami,
    ]
  }
	
	tags = {
		Name = "shell_practice"
	}
}

# 最新のAMIを取得
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# 秘密鍵のアルゴリズム設定
resource "tls_private_key" "shell_practice_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# 上記で作成した公開鍵をAWSのKey pairにインポート
resource "aws_key_pair" "shell_practice_keypair" {
  key_name   = "shell-keypair"
  public_key = tls_private_key.shell_practice_private_key.public_key_openssh
}

resource "aws_secretsmanager_secret" "shell_practice_secret" {
  name = "shell-keypair"
}

resource "aws_secretsmanager_secret_version" "shell_practice_secret" {
  secret_id     = aws_secretsmanager_secret.shell_practice_secret.id
  secret_string = tls_private_key.shell_practice_private_key.private_key_pem
}

# 作成したEC2のパブリックIPアドレスを出力
output "ec2_global_ips" {
  value = aws_instance.shell_practice.*.public_ip
}
