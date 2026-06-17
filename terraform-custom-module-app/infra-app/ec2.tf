
resource "aws_key_pair" "key_pair_for_infra" {
  key_name   = "${var.env}-app-key"
  public_key = file("${path.module}/terraform-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "security_group_for_infra" {
  name        = "${var.env}-infra-app-sg"
  description = "Security group for EC2 instance in ${var.env} environment"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }


  tags = {
    Name        = "${var.env}-infra-app-sg"
    Environment = var.env
  }
}

resource "aws_instance" "ec2_instance_for_infra" {
  count                  = var.instance_count
  key_name               = aws_key_pair.key_pair_for_infra.key_name
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami_id
  vpc_security_group_ids = [aws_security_group.security_group_for_infra.id]

  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.env}-infra-app-instance-${count.index + 1}"
    Environment = var.env
  }
}
