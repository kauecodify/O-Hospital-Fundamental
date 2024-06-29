
SHOW DATABASES

USE clinica_medica

CREATE TABLE pacientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    data_nascimento DATE
);

CREATE TABLE medicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    CRM VARCHAR(20)
);

CREATE TABLE enfermeiros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    CRE VARCHAR(20)
);

CREATE TABLE consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE,
    valor DECIMAL(10, 2),
    convenio BOOLEAN,
    especialidade VARCHAR(100),
    paciente_id INT,
    medico_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

CREATE TABLE internacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE,
    data_alta DATE,
    valor_diaria DECIMAL(10, 2),
    quarto_tipo VARCHAR(50),
    paciente_id INT,
    medico_id INT,
    enfermeiro_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros(id)
);

INSERT INTO pacientes (nome, idade, data_nascimento) VALUES
('João', 25, '1999-03-15'),
('Maria', 32, '1992-07-22'),
('Pedro', 45, '1979-11-10'),
('Ana', 19, '2005-05-30'),
('José', 60, '1964-09-01'),
('Paula', 27, '1997-12-18'),
('Carlos', 38, '1986-04-05'),
('Laura', 50, '1974-08-20'),
('Felipe', 22, '2002-01-25'),
('Sofia', 28, '1996-06-12'),
('Isabela', 35, '1989-10-03'),
('Eduardo', 42, '1982-07-08'),
('Amanda', 31, '1993-11-27'),
('Gabriel', 17, '2007-02-14'),
('Marcelo', 29, '1995-04-19'),
('Letícia', 40, '1984-12-09'),
('Luiza', 21, '2003-08-28'),
('Rafael', 26, '1998-09-24'),
('Juliana', 37, '1987-03-07'),
('Mateus', 23, '2001-06-30');

INSERT INTO medicos (nome, especialidade, CRM) VALUES
('Dr. Carlos', 'Cardiologista', 'CRM12345'),
('Dra. Ana', 'Dermatologista', 'CRM23456'),
('Dr. Pedro', 'Cirurgião', 'CRM34567'),
('Dra. Laura', 'Gastroenterologista', 'CRM45678'),
('Dr. João', 'Neurologista', 'CRM56789'),
('Dra. Maria', 'Ginecologista', 'CRM67890'),
('Dr. Roberto', 'Ortopedista', 'CRM78901'),
('Dra. Sofia', 'Endocrinologista', 'CRM89012'),
('Dr. Gabriel', 'Urologista', 'CRM90123'),
('Dra. Patrícia', 'Oftalmologista', 'CRM01234');

INSERT INTO enfermeiros (nome, CRE) VALUES
('Enf. Camila', 'CRE01234'),
('Enf. Paula', 'CRE12345'),
('Enf. Marcelo', 'CRE23456'),
('Enf. Amanda', 'CRE34567'),
('Enf. Felipe', 'CRE45678'),
('Enf. Letícia', 'CRE56789'),
('Enf. Eduardo', 'CRE67890'),
('Enf. Isabela', 'CRE78901'),
('Enf. Rafael', 'CRE89012'),
('Enf. Juliana', 'CRE90123');

INSERT INTO consultas (data_consulta, valor, convenio, especialidade, paciente_id, medico_id) VALUES
('2020-02-10', 150.00, true, 'Cardiologista', 1, 1),
('2020-05-15', 80.00, false, 'Dermatologista', 2, 2),
('2020-07-20', 200.00, true, 'Cirurgião', 3, 3),
('2020-08-05', 120.00, false, 'Ginecologista', 4, 6),
('2020-09-30', 180.00, true, 'Neurologista', 5, 5);

INSERT INTO internacoes (data_entrada, data_alta, valor_diaria, quarto_tipo, paciente_id, medico_id, enfermeiro_id) VALUES
('2020-03-20', '2020-04-05', 150.00, 'apartamento', 1, 3, 1),
('2020-06-10', '2020-06-25', 120.00, 'enfermaria', 2, 4, 2),
('2020-08-15', '2020-09-10', 200.00, 'apartamento', 3, 1, 3),
('2020-10-01', '2020-10-15', 180.00, 'enfermaria', 4, 2, 4),
('2020-11-20', '2020-12-10', 160.00, 'apartamento', 5, 5, 5);

-- Consulta1 > 1. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT * FROM consultas WHERE YEAR(data_consulta) = 2020;

-- Consulta2 > 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
SELECT * FROM internacoes WHERE data_alta > data_entrada;

-- Consulta3 > 3. Receituário completo da primeira consulta registrada com receituário associado.
SELECT c.*, r.descricao AS receituario
FROM consultas c
LEFT JOIN receituarios r ON c.id = r.consulta_id
ORDER BY c.data_consulta
LIMIT 1;

-- Consulta4 > 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
(SELECT * FROM consultas WHERE convenio = false ORDER BY VALOR DESC LIMIT 1)
UNION ALL
(SELECT * FROM consultas WHERE convenio = false ORDER BY ASC LIMIT 1);

-- Consulta5 > 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
SELECT i.*, (DATEDIFF(i.data_alta, i.data_entrada) + 1) * i.valor_diaria AS total_internacao
FROM internacoes i;

-- Consultas6 > 6. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
SELECT data_entrada, quarto_tipo, id AS numero_quarto
FROM internacoes
WHERE quarto_tipo = 'apartamento';

 -- Consulta7 > 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
SELECT p.nome AS paciente, c.data_consulta, c.especialidade
FROM pacientes p
JOIN consultas c ON p.id = c.paciente_id
WHERE c.data_consulta > DATE_SUB(NOW(), INTERVAL 18 YEAR)
AND c.especialidade != 'pediatria'
ORDER BY c.data_consulta;

-- Consulta8 > 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada AS data_internacao, r.descricao AS procedimentos
FROM pacientes p
JOIN internacoes i ON p.id = i.paciente_id
JOIN medicos m ON i.medico_id = m.id
JOIN procedimentos r ON i.id = r.internacao_id
WHERE m.especialidade = 'gastroenterologia'
AND i.quarto_tipo = 'enfermaria';

SHOW DATABASES

INSERT INTO medicos (especialidade) VALUES ('gastroenterologia');

SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada AS data_internacao, r.descricao AS procedimentos;
FROM pacientes p
JOIN internacoes i ON p.id = i.paciente_id
JOIN medicos m ON i.medico_id = m.id
JOIN procedimentos r ON i.id = r.internacao_id
WHERE m.especialidade = 'gastroenterologia'
AND i.quarto_tipo = 'enfermaria';

-- Consulta9 > 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
SELECT m.nome AS medico, m.CRM, COUNT(c.id) AS quantidade_consultas
FROM medicos m
LEFT JOIN consultas c ON m.id = c.medico_id
GROUP BY m.id;

-- Consulta10 > 10. Todos os médicos que tenham "Gabriel" no nome.
SELECT * FROM medicos WHERE nome LIKE '%Gabriel%';

-- Consulta11 > 11. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT e.nome AS enfermeiro, e.CRE, COUNT(i.id) AS numero_internacoes
FROM enfermeiros e
JOIN internacoes i ON e.id = i.enfermeiro_id
GROUP BY e.id
HAVING COUNT(i.id) > 1;
