### SSM
resource "aws_ssm_parameter" "rds_endpoint" {
  name  = format("/%s/%s/rds/endpoint", var.project_name, var.environment)
  type  = "String"
  value = aws_db_instance.postgresql.endpoint
}

#resource "aws_ssm_parameter" "rds_secret_arn" {
#  name  = format("/%s/%s/rds/secret-arn", var.project_name, var.environment)
#  type  = "String"
#  value = aws_secretsmanager_secret.db_credentials.arn
#}