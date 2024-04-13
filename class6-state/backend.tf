terraform {
  backend "s3" {
    bucket = "kaizen-nuriza"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  }
}


