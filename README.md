## Infraestrutura com Terraform, Docker & Ansible.
-----------------
Automação de infraestrutura com Terraform, Docker e Ansible em nuvem AWS

## Arquitetura
------------------
Este projeto utiliza Terraform, Docker e Ansible para automatizar a implantação de infraestrutura em nuvem AWS. A arquitetura é composta por dois módulos, um para a rede e outro para as instâncias. O módulo de rede é configurado com três sub-redes localizadas na região US-EAST-1 da AWS, incluindo todos os recursos desde a VPC, Internet Gateway, Route Table, etc.

Para as instâncias, é utilizado a máquina gratuita T2.Micro da AWS, juntamente com todos os recursos disponíveis na camada gratuita. 

Foi disponibilizado um arquivo data-source com duas imagens Linux, uma para o Amazon Linux 2 (baseado em RedHat/CentOS) e outra para o Ubuntu (baseado em Debian). Basta substituir o código, pelo outro código comentado. 


## As versões das ferramentas utilizadas neste projeto são:
-----------------
* Terraform 1.2.1
* Docker (versão mais recente)
* Ansible (versão mais recente)
