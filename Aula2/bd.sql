-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS concessionaria;
USE concessionaria;

-- Tabela: Fabricante
CREATE TABLE IF NOT EXISTS Fabricante (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Logo VARCHAR(50),
    Email VARCHAR(320),
    Telefone VARCHAR(11)
);

-- Tabela: Modelo
CREATE TABLE IF NOT EXISTS Modelo (
    idmodelo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Data_de_Lancamento DATE,
    Fabricante INT,
    qtdportas INT DEFAULT 2,
    FOREIGN KEY (Fabricante) REFERENCES Fabricante(Id)
);

-- Tabela: Veículo
CREATE TABLE IF NOT EXISTS Veiculo (
    idveiculo INT AUTO_INCREMENT PRIMARY KEY,
    fkfabricante INT,
    fkmodelo INT,
    Placa VARCHAR(10) UNIQUE,
    Cor VARCHAR(20),
    Data_de_Fabricacao DATE,
    FOREIGN KEY (fkfabricante) REFERENCES Fabricante(Id),
    FOREIGN KEY (fkmodelo) REFERENCES Modelo(idmodelo)
);

-- Comando opcional para verificar se as tabelas foram criadas
SHOW TABLES;

-- # inserts
-- 2 fabricantes
-- 5 modelos
-- 10 carros 2 de cada modelo

INSERT INTO Fabricante (Nome, Logo, Email, Telefone) VALUES
('Toyota', 'toyota_logo.png', 'contato@toyota.com.br', '11987654321'),
('Honda', 'honda_logo.png', 'contato@honda.com.br', '11987654322');

INSERT INTO Modelo (Nome, Data_de_Lancamento, Fabricante, qtdportas) VALUES
('Corolla', '2020-01-01', 1, 4),
('Camry', '2019-01-01', 1, 4),
('Civic', '2021-01-01', 2, 4),
('Accord', '2018-01-01', 2, 4),
('Fit', '2022-01-01', 2, 4);

INSERT INTO Veiculo (fkfabricante, fkmodelo, Placa, Cor, Data_de_Fabricacao) VALUES
(1, 1, 'ABC1234', 'Preto', '2020-02-01'),
(1, 1, 'DEF5678', 'Branco', '2020-03-01'),
(1, 2, 'GHI9012', 'Prata', '2019-02-01'),
(1, 2, 'JKL3456', 'Cinza', '2019-03-01'),
(2, 3, 'MNO7890', 'Vermelho', '2021-02-01'),
(2, 3, 'PQR2345', 'Azul', '2021-03-01'),
(2, 4, 'STU6789', 'Preto', '2018-02-01'),
(2, 4, 'VWX1234', 'Branco', '2018-03-01'),
(2, 5, 'YZA5678', 'Prata', '2022-02-01'),
(2, 5, 'BCD9012', 'Cinza', '2022-03-01');

como consultar os dados inseridos?Para consultar os dados inseridos nas tabelas, você pode usar o comando SELECT. Aqui estão alguns
exemplos de consultas para cada tabela:
-- Consultar todos os fabricantes
SELECT * FROM Fabricante;
-- Consultar todos os modelos
SELECT * FROM Modelo;
-- Consultar todos os veículos
SELECT * FROM Veiculo;
-- Consultar veículos com detalhes do fabricante e modelo
SELECT v.Placa, v.Cor, v.Data_de_Fabricacao, f.Nome AS Fabricante, m.Nome AS Modelo
FROM Veiculo v
JOIN Fabricante f ON v.fkfabricante = f.Id
JOIN Modelo m ON v.fkmodelo = m.idmodelo;
-- Consultar veículos de um modelo específico (por exemplo, Corolla)
SELECT v.Placa, v.Cor, v.Data_de_Fabricacao, f.Nome AS Fabricante
FROM Veiculo v
JOIN Fabricante f ON v.fkfabricante = f.Id
JOIN Modelo m ON v.fkmodelo = m.idmodelo
WHERE m.Nome = 'Corolla';
-- Consultar veículos de um fabricante específico (por exemplo, Honda)
SELECT v.Placa, v.Cor, v.Data_de_Fabricacao, m.Nome AS Modelo
FROM Veiculo v
JOIN Fabricante f ON v.fkfabricante = f.Id
JOIN Modelo m ON v.fkmodelo = m.idmodelo
WHERE f.Nome = 'Honda';