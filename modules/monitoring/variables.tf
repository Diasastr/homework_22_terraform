/*
  Визначення вхідних змінних для модуля моніторингу.
  Дозволяє налаштувати конфігурацію сервера моніторингу, зокрема тип інстансу, підмережу та групи безпеки.
*/

variable "vpc_id" {
  description = "ID VPC для розгортання сервера моніторингу."
  type        = string
}

variable "private_subnet_ids" {
  description = "Список ID приватних підмереж для розміщення сервера моніторингу."
  type        = list(string)
}

variable "key_name" {
  description = "Назва SSH ключа для доступу до сервера моніторингу."
  type        = string
}

variable "jenkins_security_group_id" {
  description = "ID групи безпеки Jenkins контролера."
  type        = string
}

variable "app_server_security_group_id" {
  description = "ID групи безпеки сервера додатків."
  type        = string
}

variable "environment" {
  description = "Назва середовища, використовувана для тегування ресурсів сервера моніторингу."
  type        = string
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"] # Amazon Linux 2 AMI owner
}
