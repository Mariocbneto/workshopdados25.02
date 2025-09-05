CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

INSERT INTO Clientes (id_cliente, nome, email, cidade) VALUES
(1, 'Ana Souza', 'ana.souza@email.com', 'São Paulo'),
(2, 'Carlos Silva', 'carlos.silva@email.com', 'Rio de Janeiro'),
(3, 'Mariana Lima', 'mariana.lima@email.com', 'Belo Horizonte'),
(4, 'João Pedro', 'joao.pedro@email.com', 'Curitiba'),
(5, 'Fernanda Costa', 'fernanda.costa@email.com', 'Porto Alegre'),
(6, 'Lucas Almeida', 'lucas.almeida@email.com', 'Salvador'),
(7, 'Juliana Rocha', 'juliana.rocha@email.com', 'Recife'),
(8, 'Gabriel Martins', 'gabriel.martins@email.com', 'Manaus'),
(9, 'Paula Fernandes', 'paula.fernandes@email.com', 'Fortaleza'),
(10, 'Ricardo Oliveira', 'ricardo.oliveira@email.com', 'Brasília');


CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(101, 1, '2025-09-01', 150.75),
(102, 2, '2025-09-02', 89.90),
(103, 3, '2025-09-02', 230.50),
(104, 4, '2025-09-03', 45.00),
(105, 5, '2025-09-03', 310.20),
(106, 6, '2025-09-04', 125.00),
(107, 7, '2025-09-04', 98.40),
(108, 8, '2025-09-05', 210.10),
(109, 9, '2025-09-05', 72.90),
(110, 10, '2025-09-05', 199.99);
-------------------------------------------------------------------
UPDATE Clientes
SET email = 'ana.souza2025@email.com'
WHERE id_cliente = 1;
-------------------------------------------------------------------
SELECT * FROM Clientes;
-------------------------------------------------------------------

SELECT 
    SUM(valor_total) AS soma_pedidos,
    AVG(valor_total) AS media_pedidos,
    MAX(valor_total) AS maior_pedido
FROM Pedidos;

-------------------------------------------------------------------

SELECT id_cliente, COUNT(*) AS total_pedidos
FROM Pedidos
GROUP BY id_cliente;


SELECT c.cidade, SUM(p.valor_total) AS total_cidade
FROM Pedidos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
GROUP BY c.cidade;

-------------------------------------------------------------------
SELECT c.nome, c.cidade, p.id_pedido, p.valor_total
FROM Clientes c
INNER JOIN Pedidos p ON c.id_cliente = p.id_cliente;
