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

variable "destination_path" {
  type    = string
  default = "/home/ec2-user/"
}

variable "source_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/docker/"
}

variable "ansible_filter_aws_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/ansible/aws_ec2.yaml"
}

variable "playbook_docker_redhat_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/ansible/install_docker_redhat.yaml"
}

variable "playbook_docker_ubuntu_path" {
  type    = string
  default = "/home/terraform/Desktop/stack/ansible/install_docker_ubuntu.yaml"
}

variable "user_amazon2" {
  type    = string
  default = "ec2-user"
}

variable "ssh" {
  type    = string
  default = "ssh"
}