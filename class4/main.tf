provider aws {
    region = var.region

}

resource "aws_instance" "web" {
  ami = var.ami_id

  #ami uniq for each region need to pay attention
  instance_type = var.type

}

variable ami_id  {
  description = "Provide ami id"
  default = "ami-0900fe555666598a2"
  type = string 
}

variable type  {
  description = "Provide instance type"
  default = "t2.micro"
  type = string
}

variable region  {
  description = "Provide region"
  default = "us-east-2"
  type = string
}




#alias td="terraform destroy --auto-approve"
#alias ta="terraform apply --auto-approve"