resource "aws_secretsmanager_secret" "db_password" {
  name = "DATABASE__PASSWORD"
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string =  aws_db_instance.postgresql.username
}


resource "aws_secretsmanager_secret" "db_user" {
  name = "DATABASE__USER"
}

resource "aws_secretsmanager_secret_version" "db_user" {
  secret_id = aws_secretsmanager_secret.db_user.id
  secret_string =  aws_db_instance.postgresql.password
}

resource "aws_secretsmanager_secret" "db_host" {
  name = "DATABASE__HOST"
}

resource "aws_secretsmanager_secret_version" "db_host" {
  secret_id = aws_secretsmanager_secret.db_host.id
  secret_string =  aws_db_instance.postgresql.endpoint
}



resource "aws_secretsmanager_secret" "db_port" {
  name = "DATABASE__PORT"
}

resource "aws_secretsmanager_secret_version" "db_port" {
  secret_id = aws_secretsmanager_secret.db_port.id
  secret_string =  aws_db_instance.postgresql.port
}


resource "aws_secretsmanager_secret" "db_name" {
  name = "DATABASE__NAME"
}

resource "aws_secretsmanager_secret_version" "db_name" {
  secret_id = aws_secretsmanager_secret.db_name.id
  secret_string =  aws_db_instance.postgresql.db_name
}

