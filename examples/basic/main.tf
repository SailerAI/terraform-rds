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