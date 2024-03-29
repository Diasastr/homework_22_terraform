/* Jenkins Controller */
// Ресурс EC2 інстансу для Jenkins контролера. Використовує останній AMI Amazon Linux та задані параметри безпеки.
resource "aws_instance" "jenkins_controller" {
  ami                    = data.aws_ami.latest_amazon_linux.id // ID останнього AMI Amazon Linux.
  instance_type          = var.instance_type // Тип інстансу, визначений у змінній.
  subnet_id              = element(var.public_subnet_ids, 0) // Підмережа для розміщення інстансу.
  key_name               = var.key_name // Назва ключа EC2 для доступу.
  vpc_security_group_ids = [var.jenkins_security_group_id] // ID групи безпеки Jenkins.

  tags = {
    Name        = "${var.environment}-jenkins-controller"
    Environment = var.environment
    Role        = "jenkins"
  }
}

/* Application Server */
// Ресурс EC2 інстансу для сервера додатків. Використовує останній AMI Amazon Linux та задані параметри безпеки.
resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id // ID останнього AMI Amazon Linux.
  instance_type          = var.instance_type // Тип інстансу, визначений у змінній.
  subnet_id              = element(var.public_subnet_ids, 0) // Підмережа для розміщення інстансу.
  key_name               = var.key_name // Назва ключа EC2 для доступу.
  vpc_security_group_ids = [var.app_server_security_group_id] // ID групи безпеки сервера додатків.

  tags = {
    Name        = "${var.environment}-app-server"
    Environment = var.environment
    Role        = "application"
  }
}
