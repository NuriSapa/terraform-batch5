provider aws {
    region = "us-east-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id

  #aim uniq for each region need to pay attention
  instance_type = "t2.micro"

  tags = local.common_tags
  subnet_id = "subnet-08c4c7334b40a7337"
  #availability_zone = "us-east-2a"
  #subnet_id = " "
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  key_name = aws_key_pair.deployer.key_name

  count = 3
  user_data = file("apache.sh")
  user_data_replace_on_change = true
}

output ec2 {
  value = aws_instance.web[*].public_ip
}
# * we using to get the all ip's eather we can put [1 or 2 or 0]
#will provide all information. we can output any information


