terraform {
  backend "s3" {
    bucket = "kaizen-nuriza"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"

    #terraform init -migrate-state - after adding dynamic db 
  }
}


