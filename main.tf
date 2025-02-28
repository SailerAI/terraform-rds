resource "aws_db_instance" "postgresql" {
  identifier        = format("%s-%s", var.project_name, var.environment)
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.db_cluster_instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  #iops                   = var.iops
  db_name                 = var.database_name
  username                = var.master_username
  password                = random_password.master_password.result
  backup_retention_period = var.backup_retention_period
  backup_window           = var.preferred_backup_window
  multi_az                = false                   # Define se será Multi-AZ. Altere para `true` se necessário.
  publicly_accessible     = var.publicly_accessible # Altere para `true` caso precise de acesso público.
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.main.id]
  # Configuração de snapshots finais
  skip_final_snapshot          = var.skip_final_snapshot
  final_snapshot_identifier    = var.skip_final_snapshot ? null : format("%s-%s-final-snapshot", var.project_name, var.environment)
  performance_insights_enabled = var.performance_insights_enabled
  storage_encrypted            = var.storage_encrypted
  # Tags opcionais para organização
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}







resource "random_password" "master_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_subnet_group" "main" {
  name       = format("%s-%s", var.project_name, var.environment)
  subnet_ids = data.aws_ssm_parameter.database_subnet_ids[*].value

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_security_group" "main" {
  name = format("%s-%s", var.project_name, var.environment)

  vpc_id = data.aws_ssm_parameter.vpc_id.value

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

