CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_cadastro DATE NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_contratacao DATE NOT NULL
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    cor VARCHAR(20),
    ano_fabricacao INT,
    valor_diaria DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE Aluguel (
    id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_total DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_aluguel INT NOT NULL UNIQUE,
    valor DECIMAL(10,2),
    data_pagamento DATE NOT NULL,
    metodo VARCHAR(20),
    status VARCHAR(20),
    observacao VARCHAR(200),
    FOREIGN KEY (id_aluguel) REFERENCES Aluguel(id_aluguel)
);

CREATE TABLE Manutencao (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    descricao_servico VARCHAR(200),
    custo DECIMAL(10,2),
    data_manutencao DATE NOT NULL,
    responsavel VARCHAR(100),
    status VARCHAR(20),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);


INSERT INTO Cliente (nome, cpf, endereco, telefone, email, data_cadastro) VALUES
('Lucas Silva', '123.456.789-00', 'Rua A, 123', '(11) 91234-5678', 'lucas@email.com', '2025-01-15'),
('Maria Souza', '234.567.890-11', 'Rua B, 456', '(21) 92345-6789', 'maria@email.com', '2025-02-10'),
('João Pereira', '345.678.901-22', 'Rua C, 789', '(31) 93456-7890', 'joao@email.com', '2025-03-05'),
('Ana Lima', '456.789.012-33', 'Rua D, 321', '(41) 94567-8901', 'ana@email.com', '2025-04-01'),
('Pedro Costa', '567.890.123-44', 'Rua E, 654', '(51) 95678-9012', 'pedro@email.com', '2025-05-20'),
('Clara Rocha', '678.901.234-55', 'Rua F, 987', '(61) 96789-0123', 'clara@email.com', '2025-06-15'),
('Rafael Alves', '789.012.345-66', 'Rua G, 135', '(71) 97890-1234', 'rafael@email.com', '2025-07-10'),
('Juliana Martins', '890.123.456-77', 'Rua H, 246', '(81) 98901-2345', 'juliana@email.com', '2025-08-05');

INSERT INTO Funcionario (nome, cpf, cargo, telefone, email, data_contratacao) VALUES
('Carlos Menezes','111.222.333-44','Atendente','(11) 91234-0001','carlos@velozcar.com','2024-01-10'),
('Fernanda Lima','222.333.444-55','Gerente','(21) 92345-0002','fernanda@velozcar.com','2024-02-12'),
('Marcelo Rocha','333.444.555-66','Atendente','(31) 93456-0003','marcelo@velozcar.com','2024-03-15'),
('Patricia Costa','444.555.666-77','Atendente','(41) 94567-0004','patricia@velozcar.com','2024-04-20'),
('Andre Santos','555.666.777-88','Gerente','(51) 95678-0005','andre@velozcar.com','2024-05-25'),
('Sofia Martins','666.777.888-99','Atendente','(61) 96789-0006','sofia@velozcar.com','2024-06-30'),
('Ricardo Almeida','777.888.999-00','Atendente','(71) 97890-0007','ricardo@velozcar.com','2024-07-15'),
('Camila Fernandes','888.999.000-11','Gerente','(81) 98901-0008','camila@velozcar.com','2024-08-05');

INSERT INTO Veiculo (placa, modelo, cor, ano_fabricacao, valor_diaria, status) VALUES
('ABC-1234','Toyota Corolla','Prata',2020,150.00,'disponível'),
('DEF-5678','Honda Civic','Preto',2019,140.00,'disponível'),
('GHI-9012','Ford Ka','Vermelho',2021,100.00,'disponível'),
('JKL-3456','Chevrolet Onix','Branco',2022,120.00,'disponível'),
('MNO-7890','Volkswagen Gol','Azul',2018,110.00,'disponível'),
('PQR-2345','Hyundai HB20','Cinza',2020,130.00,'disponível'),
('STU-6789','Nissan Versa','Prata',2021,125.00,'disponível'),
('VWX-0123','Renault Sandero','Preto',2019,115.00,'disponível');

INSERT INTO Aluguel (id_cliente, id_funcionario, id_veiculo, data_inicio, data_fim, valor_total, status) VALUES
(1,1,1,'2025-09-01','2025-09-05',750.00,'ativo'),
(2,2,2,'2025-09-03','2025-09-07',700.00,'ativo'),
(3,3,3,'2025-09-05','2025-09-08',300.00,'ativo'),
(4,4,4,'2025-09-06','2025-09-10',480.00,'ativo'),
(5,5,5,'2025-09-08','2025-09-12',440.00,'ativo'),
(6,6,6,'2025-09-09','2025-09-11',260.00,'ativo'),
(7,7,7,'2025-09-10','2025-09-15',625.00,'ativo'),
(8,8,8,'2025-09-11','2025-09-14',345.00,'ativo');

INSERT INTO Pagamento (id_aluguel, valor, data_pagamento, metodo, status, observacao) VALUES
(1,750.00,'2025-09-01','Cartão','concluído','Pagamento integral'),
(2,700.00,'2025-09-03','Pix','concluído','Pagamento integral'),
(3,300.00,'2025-09-05','Boleto','pendente','Aguardando pagamento'),
(4,480.00,'2025-09-06','Cartão','concluído','Pagamento integral'),
(5,440.00,'2025-09-08','Pix','concluído','Pagamento integral'),
(6,260.00,'2025-09-09','Boleto','pendente','Aguardando pagamento'),
(7,625.00,'2025-09-10','Cartão','concluído','Pagamento integral'),
(8,345.00,'2025-09-11','Pix','concluído','Pagamento integral');

INSERT INTO Manutencao (id_veiculo, descricao_servico, custo, data_manutencao, responsavel, status) VALUES
(1,'Troca de óleo',200.00,'2025-08-15','Carlos Menezes','realizada'),
(2,'Alinhamento',150.00,'2025-08-20','Fernanda Lima','realizada'),
(3,'Troca de pneus',500.00,'2025-08-22','Marcelo Rocha','realizada'),
(4,'Revisão geral',300.00,'2025-08-25','Patricia Costa','realizada'),
(5,'Troca de bateria',250.00,'2025-08-28','Andre Santos','realizada'),
(6,'Troca de pastilhas de freio',180.00,'2025-08-30','Sofia Martins','realizada'),
(7,'Lavagem completa',50.00,'2025-09-01','Ricardo Almeida','realizada'),
(8,'Troca de filtro de ar',70.00,'2025-09-02','Camila Fernandes','realizada');


UPDATE Veiculo SET status='alugado' WHERE id_veiculo=1;
UPDATE Pagamento SET status='concluído', data_pagamento='2025-09-06' WHERE id_pagamento=3;



SELECT COUNT(*) AS total_clientes FROM Cliente;
SELECT status, COUNT(*) AS total_veiculos FROM Veiculo GROUP BY status;
SELECT status, COUNT(*) AS total_alugueis FROM Aluguel GROUP BY status;
SELECT metodo, SUM(valor) AS total_pago FROM Pagamento GROUP BY metodo;
SELECT id_veiculo, AVG(custo) AS media_custo FROM Manutencao GROUP BY id_veiculo;
