CREATE TABLE cadastro_medicos (
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (email)
);

CREATE TABLE confirmacao_email (
    email VARCHAR(255),
    codigo VARCHAR(255),
    FOREIGN KEY (email) REFERENCES cadastro_medicos(email)
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(14),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255),
    FOREIGN KEY (email) REFERENCES cadastro_medicos(email)
);

CREATE TABLE especialidades_medicas (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    especialidade VARCHAR(255)
);

CREATE TABLE especialidades_medicos (
    id_medico INT,
    id_especialidade INT,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    FOREIGN KEY (id_especialidade) REFERENCES especialidades_medicas(id_especialidade)
);

