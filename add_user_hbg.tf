resource "null_resource" "db_setup" {
  depends_on = [ aws_db_instance.postgresql ]
  triggers = {
    db_instance = aws_db_instance.postgresql.id

  }

  provisioner "local-exec" {
    command = <<EOT
psql --host=${aws_db_instance.postgresql.address} \
     --port=5432 \
     --username=${var.master_username} \
     --dbname=${var.database_name} \
     --command="CREATE USER sailer WITH PASSWORD '${random_password.master_password.result}'; GRANT CONNECT ON DATABASE ${var.database_name} TO sailer;"
EOT
    environment = {
      PGPASSWORD = random_password.master_password.result
    }
  }
}

