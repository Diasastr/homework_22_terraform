resource "aws_instance" "monitoring_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = element(var.private_subnet_ids, 0)
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  tags = {
    Name        = "${var.environment}-monitoring-server"
    Environment = var.environment
    Role        = "monitoring"
  }
}

resource "aws_security_group" "monitoring_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    security_groups = [var.jenkins_security_group_id, var.app_server_security_group_id]
    description = "Allow Prometheus traffic from Jenkins and App Server"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-monitoring-sg"
    Environment = var.environment
  }
}
