variable "subnet_id" {

}

variable "security_group_public" {
  type    = list(string)
  default = []
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "volume_type" {
  type = string
}

variable "volume_size" {
  type = string
}

variable "delete_on_termination" {
  type = bool
}

variable "encrypted" {
  type = bool
}

variable "map_public_ip_on_launch" {
  type = bool
}

variable "key_aws_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/aws-class-1.pem"
}

variable "destination_amazon_path" {
  type    = string
  default = "/home/ec2-user/"
}

variable "destination_ubuntu_path" {
  type    = string
  default = "/home/ubuntu/"
}

variable "source_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/docker/"
}

variable "user_amazon" {
  type    = string
  default = "ec2-user"
}

variable "ssh" {
  type    = string
  default = "ssh"
}

variable "user_ubuntu" {
  type = string
  default = "ubuntu"
}



variable "instance" {
 type = string
 default = "ubuntu"
}



variable "command_amazon" {
  default = "ansible-playbook -i /home/terraform/Desktop/stack/ansible/aws_ec2.yaml /home/terraform/Desktop/stack/ansible/install_docker_redhat.yaml -u ec2-user --key-file /home/terraform/Desktop/stack/aws-class-1.pem"
}

variable "command_ubuntu" {
  default = "ansible-playbook -i /home/terraform/Desktop/stack/ansible/aws_ec2.yaml /home/terraform/Desktop/stack/ansible/install_docker_ubuntu.yaml -u ubuntu --key-file /home/terraform/Desktop/stack/aws-class-1.pem"
}