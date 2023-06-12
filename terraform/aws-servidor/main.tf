resource "aws_instance" "ec2-publica" {
  ami                    = data.aws_ami.amazon.id #data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_public

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }

  tags = {
    Name = "server"
  }

}

resource "null_resource" "copy_execute" {

  connection {
    type        = var.ssh
    user        = var.user_amazon2
    private_key = file(var.key_aws_path)
    host        = aws_instance.ec2-publica.public_ip

  }

  provisioner "file" {
    source      = var.source_path
    destination = var.destination_path
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${var.ansible_filter_aws_path} ${var.playbook_docker_redhat_path} -u ${var.user_amazon2} --key-file ${var.key_aws_path}"

  }

  depends_on = [aws_instance.ec2-publica]

}











