provider aws {
    region = var.region 
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cider
}



resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cider[0].cider


  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"

    tags = {
    Name = var.subnet_cider[0].subnet_name
  }
}


resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cider[1].cider


  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"

    tags = {
    Name = var.subnet_cider[1].subnet_name
  }
}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cider[2].cider
   map_public_ip_on_launch = true
  availability_zone = "${var.region}c"
  tags = {
    Name = var.subnet_cider[2].subnet_name
  }
}
