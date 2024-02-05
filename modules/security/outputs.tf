/*
  Визначення вихідних змінних для модуля безпеки.
  Надає доступ до ключової інформації про створені групи безпеки та пару ключів.
*/

output "default_security_group_id" {
  description = "ID групи безпеки за замовчуванням."
  value       = aws_security_group.default.id
}

output "jenkins_security_group_id" {
  description = "ID групи безпеки для Jenkins."
  value       = aws_security_group.jenkins_sg.id
}

output "app_server_security_group_id" {
  description = "ID групи безпеки для серверів додатків."
  value       = aws_security_group.app_server_sg.id
}

output "key_name" {
  description = "Назва пари ключів 'deployer'."
  value       = aws_key_pair.deployer.key_name
}
