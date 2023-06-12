## Infraestrutura com Terraform, Docker & Ansible.
-----------------
Automação para nuvem utilizando Terraform, Docker e Ansible.

## Arquitetura
------------------
Existem dois módulos: um para a rede e outro para as instâncias. O módulo de rede está configurado com três sub-redes localizadas na região US-EAST-1 da AWS, incluindo todos os recursos desde a VPC, Internet Gateway, Route Table etc.

Para as instâncias, utilizamos a máquina gratuita da AWS, T2.Micro, juntamente com todos os recursos disponíveis na camada gratuita.
Versões das ferramentas utilizadas

## Versão das aplicações usadas
-----------------
* Terraform 1.2.1
* Docker (versão mais recente)
* Ansible (versão mais recente)

