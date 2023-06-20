## Infraestrutura automatizada na nuvem AWS com Terraform, Docker e Ansible

Este projeto tem como objetivo automatizar a implantação de infraestrutura na nuvem da AWS (Amazon Web Services) utilizando as ferramentas Terraform, Docker e Ansible, e tudo isso com um único deploy: terraform apply -auto-approve

## Arquitetura da infraestrutura com Terraform

A arquitetura é composta por dois módulos: um para a rede e outro para as instâncias. O módulo de rede configura três sub-redes na região US-EAST-1 (1a, 1b, 1c) da AWS, incluindo recursos como VPC, Internet Gateway e Route Table. Para as instâncias, é utilizada a máquina T2.Micro gratuita da AWS, juntamente com todos os recursos EBS disponíveis na camada gratuita.

Para permitir o uso de diferentes sistemas operacionais, o data-source contém duas AMI Linux: uma com base na RedHat (Amazon Linux 2) e outra com base no Ubuntu. Utilizamos por padrão um if-else, sendo o Ubuntu o igualitário. Caso queira utilizar o Amazon Linux, basta trocar o nome Ubuntu por "Amazon", preferencialmente, para manter as boas práticas.

## Implementação do Ansible no Ubuntu e no Amazon Linux 2

No Ubuntu, utilizamos um playbook do Ansible disponibilizado no site da DigitalOcean e incrementamos um shell para fazer o deploy do Docker-Compose. No Amazon Linux 2, tivemos uma dificuldade para instalar o docker-compose diretamente pelo pip, então optamos por usar o shell do Ansible para fazer o download do compose.

Foi usado o plugin Amazon AWS, disponibilizado no Galaxy Ansible, para filtrar a máquina na AWS pela sua tag (name). Como existem duas imagens de Linux diferentes no data-source, também utilizamos dois playbooks.

## Utilização do Docker na implantação

Para a implantação utilizando o Docker, utilizamos a stack para um aplicativo web que inclui NGINX, PHP e MYSQL. Neste repositório, foram utilizadas imagens padrões, mas é recomendável utilizar a imagem Alpine, devido ao seu tamanho menor. No entanto, é importante lembrar que essa imagem é um pouco mais complexa em comparação com outras. É possível buildar o Dockerfile, mas o objetivo aqui é garantir que os containers estejam funcionando, por isso utilizamos um Compose simples.

![dockerps](https://github.com/paulodisfarce/terraform-aws-ansible-docker/assets/83657152/a4875f12-f881-4b98-b631-e7d35eebbc0b)


## Versões das ferramentas utilizadas no projeto

As versões das ferramentas utilizadas neste projeto são:

* Terraform 1.2.1
* Docker 20.10.21
* Ansible core 2.15.0
