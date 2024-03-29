provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
 identifier_prefix =  "terraform-up-and-running"
 engine = "mysql"
 allocated_storage = 10
 instance_class = "db.t2.micro"
 skip_final_snapshot = true
 db_name = "example_database"
 
 # How should we set the username and password?
 username = var.DB_USERNAME
 password = var.DB_PASSWORD
}

terraform {
 backend "s3" {
  bucket = "terraform-up-and-running-state-benchanjamin-123"
  key = "stage/data-stores/mysql/terraform.tfstate"
  region = "us-east-2"
  
  dynamodb_table = "terraform-up-and-running-locks"
  encrypt = true
 }
}
