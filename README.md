## Infraestrutura automatizada com Terraform, Docker e Ansible na nuvem AWS

Este projeto tem como objetivo automatizar a implantação de infraestrutura na nuvem AWS utilizando as ferramentas Terraform, Docker e Ansible. 

## arquitetura

A arquitetura é composta por dois módulos: um para rede e outro para instâncias. O módulo de rede configura três sub-redes na região US-EAST-1 da AWS, incluindo recursos como VPC, Internet Gateway e Route Table. Para as instâncias, é utilizada a máquina T2.Micro gratuita da AWS, juntamente com todos os recursos disponíveis na camada gratuita.

Para permitir o uso de diferentes sistemas operacionais, o data-source contém duas imagens Linux: uma com base no Amazon Linux 2 (RedHat/CentOS) e outra com base no Ubuntu (Debian). É possível substituir o código pelo código comentado para utilizar a imagem desejada.

No Ansible, utilizamos o plugin Amazon AWS disponibilizado no Galaxy Ansible para filtrar a máquina na AWS. Como existem duas imagens de Linux diferentes no data-source, também utilizamos dois playbooks. Basta mudá-los no arquivo main.tf do módulo AWS-Servidor da seguinte forma:

para Amazon Linux 2
* "ansible-playbook -i ${var.ansible_filter_aws_path} ${var.playbook_docker_redhat_path} -u ${var.user_amazon2} --key-file ${var.key_aws_path}" 

para Ubuntu
* "ansible-playbook -i ${var.ansible_filter_aws_path} ${var.playbook_docker_Ubuntu_path} -u ${var.user_ubuntu} --key-file ${var.key_aws_path}"  

## As versões das ferramentas utilizadas neste projeto são:

* Terraform 1.2.1
* Docker (versão mais recente)
* Ansible (versão mais recente)