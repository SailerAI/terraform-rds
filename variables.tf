variable "region" {
  description = "AWS Region where the resources will be created"
  type        = string
}

variable "ssm_database_subnet_ids" {
  description = "IDs das subredes de banco de dados"
  type        = list(string)
}

variable "ssm_vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "master_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type        = number
  default     = 20
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  type        = bool
  default     = true
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
  default     = "16.3"
}


variable "db_cluster_instance_class" {
  description = "The compute and memory capacity of each DB instance in the cluster"
  type        = string
  default     = "db.t4g.micro"
}

variable "storage_type" {
  description = "Specifies the storage type to be associated with the DB cluster"
  type        = string
  default     = "gp3"
}

variable "engine_mode" {
  description = "The database engine mode"
  type        = string
  default     = "provisioned"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
  type        = bool
  default     = true
}
variable "publicly_accessible" {
  type    = bool
  default = true
}

variable "performance_insights_enabled" {
  type    = bool
  default = true
}

variable "preferred_backup_window" {
  type    = string
  default = "07:00-09:00"
}

variable "backup_retention_period" {
  type    = number
  default = 5

}