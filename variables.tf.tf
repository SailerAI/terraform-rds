variable "region" {

}

variable "environment" {

}

variable "project_name" {

}

variable "engine" {
  type = string
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "database_name" {

}

variable "master_username" {

}

variable "backup_retention_period" {
  type    = number
  default = 5

}

variable "preferred_backup_window" {
  type    = string
  default = "07:00-09:00"
}

variable "ssm_database_subnet_ids" {
  description = "IDs das subredes de banco de dados"
  type        = list(string)
}

variable "ssm_vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "allocated_storage" {

}

variable "skip_final_snapshot" {

}

variable "engine_version" {

}

variable "db_cluster_instance_class" {

}

variable "storage_type" {

}
#variable "iops" {
#  
#}

variable "engine_mode" {

}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "performance_insights_enabled" {
  type    = bool
  default = true
}

variable "torage_encrypted" {
  type = bool
}