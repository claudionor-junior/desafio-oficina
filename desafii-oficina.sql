CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE VEICULO (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE SERVICO (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE ORDEM_SERVICO (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_servico INT NOT NULL,
    data DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES VEICULO(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES SERVICO(id_servico)
);

INSERT INTO CLIENTE (nome, telefone, email) VALUES
('João Silva', '11999998888', 'joao@gmail.com'),
('Maria Oliveira', '11988887777', 'maria@gmail.com');

INSERT INTO VEICULO (id_cliente, placa, modelo, ano) VALUES
(1, 'ABC1234', 'Fiat Uno', 2010),
(2, 'XYZ5678', 'Honda Civic', 2018);

INSERT INTO FUNCIONARIO (nome, especialidade) VALUES
('Carlos Souza', 'Mecânico Geral'),
('Ana Pereira', 'Eletricista');

INSERT INTO SERVICO (descricao, preco) VALUES
('Troca de óleo', 150.00),
('Alinhamento', 120.00),
('Revisão completa', 400.00);

INSERT INTO ORDEM_SERVICO (id_veiculo, id_funcionario, id_servico, data, status, valor_total) VALUES
(1, 1, 1, '2025-07-10', 'Finalizado', 150.00),
(2, 2, 3, '2025-07-12', 'Em andamento', 400.00),
(1, 1, 2, '2025-07-15', 'Agendado', 120.00);

-- Queries de exemplo
-- 1. Recuperação simples
SELECT * FROM CLIENTE;

-- 2. Filtro com WHERE
SELECT * FROM ORDEM_SERVICO WHERE status = 'Finalizado';

-- 3. Atributo derivado: idade do veículo
SELECT c.nome, v.modelo, YEAR(CURDATE()) - v.ano AS idade_veiculo
FROM CLIENTE c
JOIN VEICULO v ON c.id_cliente = v.id_cliente;

-- 4. Ordenação com ORDER BY
SELECT * FROM SERVICO ORDER BY preco DESC;

-- 5. Condição com HAVING
SELECT f.nome, COUNT(o.id_os) AS total_os
FROM FUNCIONARIO f
JOIN ORDEM_SERVICO o ON f.id_funcionario = o.id_funcionario
GROUP BY f.id_funcionario
HAVING COUNT(o.id_os) > 1;

-- 6. Junção entre tabelas
SELECT o.id_os, c.nome AS cliente, v.placa, v.modelo, s.descricao AS servico, f.nome AS funcionario, o.data, o.status, o.valor_total
FROM ORDEM_SERVICO o
JOIN VEICULO v ON o.id_veiculo = v.id_veiculo
JOIN CLIENTE c ON v.id_cliente = c.id_cliente
JOIN SERVICO s ON o.id_servico = s.id_servico
JOIN FUNCIONARIO f ON o.id_funcionario = f.id_funcionario
ORDER BY o.data DESC;
