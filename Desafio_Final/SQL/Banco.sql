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
