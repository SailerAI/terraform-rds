# terrafom-rds
RDs terraform Module Cluster 

<!-- BEGIN_TF_DOCS -->


## Example

```hcl
module "backend_secrets" {
  source       = "github.com/SailerAI/terraform-aws-secrets-manager"
  project_name = "sailer"
  environment  = "dev"
  region       = "us-east-1"


  ### RDS Cluster
  #azs                     = ["us-east-1a" ] #[ "us-east-1b", "us-east-1c"]
  master_username = "postgres"
  database_name   = "sailer_dev_example"

  ### SSM VPC Parameters created by networkin module
  ssm_vpc_id              = "/sailer/dev/vpc/id"
  ssm_database_subnet_ids = ["/sailer/dev/database-subnet-1a", "/sailer/dev/database-subnet-1b", "/sailer/dev/database-subnet-1c"]

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gibibytes | `number` | `20` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | n/a | `number` | `5` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database to create | `string` | n/a | yes |
| <a name="input_db_cluster_instance_class"></a> [db\_cluster\_instance\_class](#input\_db\_cluster\_instance\_class) | The compute and memory capacity of each DB instance in the cluster | `string` | `"db.t4g.micro"` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | `"postgres"` | no |
| <a name="input_engine_mode"></a> [engine\_mode](#input\_engine\_mode) | The database engine mode | `string` | `"provisioned"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The database engine version | `string` | `"16.3"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, staging, prod) | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username for the master DB user | `string` | n/a | yes |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | n/a | `string` | `"07:00-09:00"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | n/a | yes |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | n/a | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region where the resources will be created | `string` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted | `bool` | `true` | no |
| <a name="input_ssm_database_subnet_ids"></a> [ssm\_database\_subnet\_ids](#input\_ssm\_database\_subnet\_ids) | IDs das subredes de banco de dados | `list(string)` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | ID do VPC | `string` | n/a | yes |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Specifies the storage type to be associated with the DB cluster | `string` | `"gp3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_password"></a> [master\_password](#output\_master\_password) | n/a |  
<!-- END_TF_DOCS -->