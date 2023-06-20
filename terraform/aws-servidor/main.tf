resource "aws_instance" "ec2-publica" {
  ami                    = var.instance == "amazon" ? data.aws_ami.ubuntu.id : data.aws_ami.amazon.id
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
    user        = var.instance == "amazon" ? "${var.user_ubuntu}" : "${var.user_amazon}"
    private_key = file(var.key_aws_path)
    host        = aws_instance.ec2-publica.public_ip

  }

  provisioner "file" {
    source      = var.source_path
    destination = var.instance == "amazon" ? "${var.destination_ubuntu_path}" : "${var.destination_amazon_path}"
  }

  provisioner "local-exec" {
   command = var.instance == "amazon" ? var.command_ubuntu : var.command_amazon
 }

  depends_on = [aws_instance.ec2-publica]

}












