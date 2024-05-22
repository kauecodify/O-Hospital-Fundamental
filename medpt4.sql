CREATE DATABASE IF NOT EXISTS Hospital;
USE Hospital;

-- Tabela de Especialidades
CREATE TABLE Especialidade (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255)
);

-- Inserir especialidades
INSERT INTO Especialidade (Nome) VALUES
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Ortopedia'),
('Cardiologia'),
('Neurologia');

-- Tabela de Médicos
CREATE TABLE Medicos (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  CPF BIGINT,
  Endereco VARCHAR(255),
  EspecialidadeID INT,
  Em_atividade VARCHAR(10),
  FOREIGN KEY (EspecialidadeID) REFERENCES Especialidade(ID)
);

-- Inserir médicos
INSERT INTO Medicos (Nome, CPF, Endereco, EspecialidadeID, Em_atividade) VALUES
('Dr. João', 12345678900, 'Rua A, 123', 1, 'ativo'),
('Dr. Maria', 23456789012, 'Rua B, 456', 2, 'ativo'),
('Dr. José', 34567890123, 'Rua C, 789', 3, 'ativo'),
--('Dr. Ana', 45678901234, 'Rua D, 1011', 4, 'inativo'),
--('Dr. Carlos', 56789012345, 'Rua E, 1213', 5, 'inativo'),
('Dr. Laura', 67890123456, 'Rua F, 1415', 6, 'ativo'),
('Dr. Pedro', 78901234567, 'Rua G, 1617', 7, 'ativo'),
('Dr. Sofia', 89012345678, 'Rua H, 1819', 1, 'ativo'),
('Dr. Luiz', 90123456789, 'Rua I, 2021', 2, 'ativo'),
('Dr. Fernanda', 12345098765, 'Rua J, 2223', 3, 'ativo');

-- Tabela de Pacientes
CREATE TABLE Pacientes (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  Telefone BIGINT,
  Endereco VARCHAR(255),
  Email VARCHAR(255),
  DataCadastro DATETIME
);

-- Inserir pacientes
INSERT INTO Pacientes (Nome, Telefone, Endereco, Email, DataCadastro) VALUES
('Maria Silva', 1122334455, 'Av. X, 100', 'maria@email.com', '2020-01-15 10:00:00'),
('José Santos', 2233445566, 'Av. Y, 200', 'jose@email.com', '2020-02-20 11:00:00'),
('Ana Oliveira', 3344556677, 'Av. Z, 300', 'ana@email.com', '2020-03-25 12:00:00'),
('Carlos Souza', 4455667788, 'Av. W, 400', 'carlos@email.com', '2020-04-30 13:00:00'),
('Laura Pereira', 5566778899, 'Av. V, 500', 'laura@email.com', '2020-05-05 14:00:00'),
('Pedro Costa', 6677889900, 'Av. U, 600', 'pedro@email.com', '2020-06-10 15:00:00'),
('Sofia Lima', 7788990011, 'Av. T, 700', 'sofia@email.com', '2020-07-20 16:00:00'),
('Luiz Vieira', 8899001122, 'Av. S, 800', 'luiz@email.com', '2020-08-25 17:00:00'),
('Fernanda Mendes', 9900112233, 'Av. R, 900', 'fernanda@email.com', '2020-09-30 18:00:00'),
('Roberto Almeida', 3344556677, 'Av. Q, 1000', 'roberto@email.com', '2020-10-10 19:00:00');

-- Tabela de Convênios
CREATE TABLE Convenios (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  Telefone BIGINT,
  ID_Carteirinha VARCHAR(255),
  EmailCadastrado VARCHAR(255)
);

-- Inserir convênios
INSERT INTO Convenios (Nome, Telefone, ID_Carteirinha, EmailCadastrado) VALUES
('Convênio A', 1122334455, 'A12345', 'convenioa@email.com'),
('Convênio B', 2233445566, 'B23456', 'conveniob@email.com'),
('Convênio C', 3344556677, 'C34567', 'convenioc@email.com'),
('Convênio D', 4455667788, 'D45678', 'conveniod@email.com');

-- Tabela de Consultas
CREATE TABLE Consultas (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  PacienteID INT,
  MedicoID INT,
  DataConsulta DATETIME,
  Receituario TEXT,
  FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID),
  FOREIGN KEY (MedicoID) REFERENCES Medicos(ID)
);

-- Inserir consultas
INSERT INTO Consultas (PacienteID, MedicoID, DataConsulta, Receituario) VALUES
(1, 1, '2021-01-01 10:00:00', 'Paracetamol, Amoxicilina'),
(2, 2, '2021-01-02 11:00:00', 'Ibuprofeno, Dipirona'),
(3, 3, '2021-01-03 12:00:00', 'Omeprazol'),
(4, 4, '2021-01-04 13:00:00', 'Dexametasona, Loratadina'),
(5, 5, '2021-01-05 14:00:00', 'Azitromicina, Prednisona'),
(6, 6, '2021-01-06 15:00:00', 'Insulina'),
(7, 7, '2021-01-07 16:00:00', 'Losartan, Atenolol'),
(8, 8, '2021-01-08 17:00:00', 'Paracetamol'),
(9, 9, '2021-01-09 18:00:00', 'Dipirona'),
(10, 10, '2021-01-10 19:00:00', 'Amoxicilina, Omeprazol'),
(1, 1, '2021-01-11 10:00:00', 'Paracetamol, Amoxicilina'),
(2, 2, '2021-01-12 11:00:00', 'Ibuprofeno, Dipirona'),
(3, 3, '2021-01-13 12:00:00', 'Omeprazol'),
(4, 4, '2021-01-14 13:00:00', 'Dexametasona, Loratadina'),
(5, 5, '2021-01-15 14:00:00', 'Azitromicina, Prednisona'),
(6, 6, '2021-01-16 15:00:00', 'Insulina'),
(7, 7, '2021-01-17 16:00:00', 'Losartan, Atenolol'),
(8, 8, '2021-01-18 17:00:00', 'Paracetamol'),
(9, 9, '2021-01-19 18:00:00', 'Dipirona'),
(10, 10, '2021-01-20 19:00:00', 'Amoxicilina, Omeprazol');

-- Tabela de Tipo de Quarto
CREATE TABLE TipoQuarto (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Tipo VARCHAR(100),
  PriceDay INT
);

-- Inserir tipos de quarto
INSERT INTO TipoQuarto (Tipo, PriceDay) VALUES
('Apartamento', 200),
('Quarto Duplo', 150),
('Enfermaria', 100);

-- Tabela de Internações
CREATE TABLE Internacoes (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  PacienteID INT,
  TipoQuartoID INT,
  DataEntrada DATETIME,
  DataSaida DATETIME,
  FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID),
  FOREIGN KEY (TipoQuartoID) REFERENCES TipoQuarto(ID)
);

-- Inserir internações
INSERT INTO Internacoes (PacienteID, TipoQuartoID, DataEntrada, DataSaida) VALUES
(1, 1, '2021-01-01 10:00:00', '2021-01-05 12:00:00'),
(2, 2, '2021-01-02 11:00:00', '2021-01-06 13:00:00'),
(3, 3, '2021-01-03 12:00:00', '2021-01-07 14:00:00'),
(4, 1, '2021-01-04 13:00:00', '2021-01-08 16:00:00'),
(5, 2, '2021-01-05 14:00:00', '2021-01-09 18:00:00'),
(6, 3, '2021-01-06 15:00:00', '2021-01-10 20:00:00'),
(7, 1, '2021-01-07 16:00:00', '2021-01-11 12:00:00');

-- Tabela de Profissionais de Enfermagem
CREATE TABLE Enfermeiros (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255),
  CPF BIGINT
);

-- Inserir profissionais de enfermagem
INSERT INTO Enfermeiros (Nome, CPF) VALUES
('Enfermeira Ana', 12345678900),
('Enfermeira Carlos', 23456789012),
('Enfermeira Julia', 34567890123),
('Enfermeira Pedro', 45678901234),
('Enfermeira Luiza', 56789012345),
('Enfermeiro Marcos', 67890123456),
('Enfermeira Sofia', 78901234567),
('Enfermeiro Laura', 89012345678),
('Enfermeira Gabriel', 90123456789),
('Enfermeira Camila', 9012374144),
('Enfermeira Rafaela', 98765432109);

-- Tabela de Relacionamento entre Internações e Enfermeiros
CREATE TABLE InternacoesEnfermeiros (
  InternacaoID INT,
  EnfermeiroID INT,
  PRIMARY KEY (InternacaoID, EnfermeiroID)
);

INSERT INTO InternacoesEnfermeiros (InternacaoID, EnfermeiroID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(7, 11);
	
