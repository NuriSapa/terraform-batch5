provider aws {
    region = "us-east-2"

   
}

resource "aws_instance" "web" {
  ami           = "ami-0900fe555666598a2"
  instance_type = var.kaizen
}

#i can creat a file with access key and secret key or run below command
#export export AWS_SECRET_ACCESS_KEY=""
#export AWS_ACCESS_KEY_ID=""


variable kaizen {}

#3rd version to to run bellow command in terminal 
#export TF_VAR_kaizen="t3.micro"

