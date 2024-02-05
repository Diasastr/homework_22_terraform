/*
  Визначення вихідних даних для модуля серверів.
  Надає доступ до важливої інформації про створені EC2 інстанси.
*/

// ID Jenkins контролера
output "jenkins_controller_id" {
  description = "ID інстансу Jenkins контролера."
  value       = aws_instance.jenkins_controller.id
}

// Публічна IP адреса Jenkins контролера
output "jenkins_controller_public_ip" {
  description = "Публічна IP адреса інстансу Jenkins контролера."
  value       = aws_instance.jenkins_controller.public_ip
}

// ID сервера додатків
output "app_server_id" {
  description = "ID інстансу сервера додатків."
  value       = aws_instance.app_server.id
}

// Публічна IP адреса сервера додатків
output "app_server_public_ip" {
  description = "Публічна IP адреса інстансу сервера додатків."
  value       = aws_instance.app_server.public_ip
}
