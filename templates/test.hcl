# Module aufrufen statt alles selbst zu definieren
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "10.0.0.0/16"
  environment = "production"
}
module "webserver" {
  source         = "./modules/webserver"
  vpc_id         = module.vpc.vpc_id
  instance_count = 3
}




# Terraform Backend-Konfiguration
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}


// Terratest Beispiel (Go)
func TestVPCCreation(t * testing.T) {
  terraformOptions : = & terraform.Options {
    TerraformDir : "../",
  }
  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)
  vpcID : = terraform.Output(t, terraformOptions, "vpc_id")
  assert.NotEmpty(t, vpcID)
}

# Secrets aus AWS Secrets Manager lesen
data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "prod/db/password"
}
resource "aws_db_instance" "main" {
  password = data.aws_secretsmanager_secret_version.db_password.secret_string
}


