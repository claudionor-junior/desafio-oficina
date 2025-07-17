# Sistema de Banco de Dados para Oficina Mecânica

## Descrição do Projeto

Este projeto consiste na modelagem e implementação de um banco de dados para uma oficina mecânica, contemplando o gerenciamento de clientes, veículos, funcionários, serviços e ordens de serviço.  

O sistema permite armazenar informações essenciais para a operação da oficina, possibilitando o cadastro de clientes e seus veículos, a gestão dos funcionários e serviços oferecidos, além do registro detalhado das ordens de serviço realizadas.

---

## Modelo Lógico

O banco de dados possui as seguintes tabelas principais:

- **CLIENTE**: Cadastro de clientes, contendo nome, telefone e e-mail.
- **VEICULO**: Registro dos veículos vinculados aos clientes, com informações de placa, modelo e ano.
- **FUNCIONARIO**: Funcionários da oficina com suas especialidades.
- **SERVICO**: Serviços oferecidos pela oficina, com descrição e preço.
- **ORDEM_SERVICO**: Ordens de serviço realizadas, associando veículo, serviço, funcionário, data, status e valor total.

---

## Tecnologias Utilizadas

- Banco de dados MySQL (ou MariaDB)
- SQL para criação de esquema, inserção de dados e consultas

---

