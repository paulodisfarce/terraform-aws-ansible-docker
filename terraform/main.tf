module "vpc" {
  source     = "./aws-network"
  name       = "vpc-estudo"
  cidr_block = "198.168.0.0/16"
  cidr_world = "0.0.0.0/0"


  public_subnet = {
    us-east-1a = "198.168.1.0/24"
    us-east-1b = "198.168.2.0/24"
    us-east-1c = "198.168.3.0/24"
  }

  #############SSH HTTP DOC  HTTPS MYSQL PROM################
  ports_sec = [22, 80, 443, 3306, 8080, 8181]

  name_sec    = "SecGroupWebApp"
  description = "sec for web application"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  from_port_egress = 0
  to_port_egress   = 0
  protocol_egress  = -1
}

module "aws-servidor" {
  source = "./aws-servidor"

  instance_type = "t2.micro"
  key_name      = "aws-class-1"
  volume_type   = "gp2"
  volume_size   = 20

  delete_on_termination   = true
  encrypted               = true
  map_public_ip_on_launch = true


  subnet_id             = module.vpc.subnet_id
  security_group_public = [module.vpc.security_group_public]
}

