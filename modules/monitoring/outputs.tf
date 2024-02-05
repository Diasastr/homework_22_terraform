/*
  Визначення вихідних даних для модуля моніторингу.
  Надає інформацію про створені ресурси, включно з ID сервера моніторингу та його публічною IP адресою.
*/

output "monitoring_server_id" {
  description = "ID інстансу сервера моніторингу."
  value       = aws_instance.monitoring_server.id
}

output "monitoring_server_private_ip" {
  description = "Приватна IP адреса інстансу сервера моніторингу."
  value       = aws_instance.monitoring_server.private_ip
}

output "monitoring_security_group_id" {
  description = "ID групи безпеки, призначеної для сервера моніторингу."
  value       = aws_security_group.monitoring_sg.id
}
