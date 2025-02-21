output "master_password" {
  value     = random_password.master_password.result
  sensitive = true
}
