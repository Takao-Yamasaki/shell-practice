# セキュリティグループの作成
resource "aws_security_group" "shell_practice_sg" {
  name   = "shell_practice"
  vpc_id = aws_vpc.shell_practice_vpc.id
}

resource "aws_security_group_rule" "shell_practice_ingress" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.shell_practice_sg.id
}

resource "aws_security_group_rule" "shell_practice_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.shell_practice_sg.id
}
