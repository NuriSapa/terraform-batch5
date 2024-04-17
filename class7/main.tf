
provider aws {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "hello1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "devop" {
  ami           = "ami-0900fe555666598a2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.key_name

    connection {
    type     = "ssh"            
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

#   provisioner "file" {
#     source = "./httpd.sh"           # local machine
#     destination = "./httpd.sh"      # remote machine
#   } 
  provisioner "remote-exec" {
    script = "./httpd.sh"
  }

#   provisioner "remote-exec" {
#     inline = [
#         "chmod +x httpd.sh",
#         "./httpd.sh"
#     ]
#   }
}

# resource "null_resource" "hello" {
#       provisioner "local-exec" {
#     command = "mkdir kaizen && touch hello"
#   }
# }



