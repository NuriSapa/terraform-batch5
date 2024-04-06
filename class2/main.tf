provider "aws" {
    region = "us-east-1"
  
}


# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

#creating keypair without running the command in terminal

# resource "aws_s3_bucket" "example" {
#   bucket_prefix = "hello-"
#   force_destroy = true
# }

#destroy to not empty bucket

# #resource "aws_s3_object" "object" {
#   depends_on = [aws_s3_bucket.example]
#   bucket = "kaizen-nuriza"
#   key = "main.tf"
#   source = "main.tf"

# }
#copy the file from the source to bucket



