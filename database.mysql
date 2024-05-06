CREATE TABLE `Alta` (
  `Email` Varchar (255),
  `Update_exit` datetime,
  `Final_value` num
);

CREATE TABLE `Consulta_medica` (
  `Especialidade` Varchar (255),
  `Consultorio` Integer,
  FOREIGN KEY (`Especialidade`) REFERENCES `Alta`(`Email`)
);

CREATE TABLE `Especialidade` (
  `ID` Integer,
  `CRM` Varchar(255),
  `CRE` Varchar(255),
  `Especialidade` Varchar,
  FOREIGN KEY (`ID`) REFERENCES `Consulta_medica`(`Especialidade`)
);

CREATE TABLE `Médicos` (
  `Nome` Varchar (255),
  `CPF` INT,
  `Endereço` Varchar (255),
  `Especialidade` Varchar (255),
  `ID` INT,
  FOREIGN KEY (`CPF`) REFERENCES `Especialidade`(`Especialidade`)
);

CREATE TABLE `Analise_convenio` (
  `Nome_convenio` Varchar (255),
  `Telefone` Integer,
  `ID_Carteirinha` Varchar (255),
  `Email _cadastrado` Varchar (255),
  FOREIGN KEY (`ID_Carteirinha`) REFERENCES `Consulta_medica`(`Consultorio`)
);

CREATE TABLE `Paciente` (
  `Nome` Varchar (255),
  `Telefone` Integer,
  `Endereço` Varchar (255),
  `Email` Varchar (255),
  `Update_entry` datetime,
  FOREIGN KEY (`Telefone`) REFERENCES `Analise_convenio`(`Telefone`)
);

CREATE TABLE `Lista` (
  `nome_convenio` <type>,
  `Email_cadastrado` <type>,
  `ID_user` <type>,
  FOREIGN KEY (`nome_convenio`) REFERENCES `Analise_convenio`(`Telefone`)
);

CREATE TABLE `Tipo_de_quarto` (
  `Cod_hospedagem` Varchar (100),
  `Quartos_duplos` Varchar (100),
  `Apartamentos` Varchar (100),
  `Price_day` Integer
);

CREATE TABLE `Diagnostico_preciso` (
  `Especialidade` Varchar (255),
  `Consultorio` Integer,
  FOREIGN KEY (`Especialidade`) REFERENCES `Alta`(`Final_value`),
  FOREIGN KEY (`Consultorio`) REFERENCES `Tipo_de_quarto`(`Quartos_duplos`)
);

CREATE TABLE `Ala_internacao` (
  `ID_Carteirinha` Varchar (255)
);

CREATE TABLE `Enfermaria` (
  `CRE` Varchar (255),
  `Nome_enfermeira` Varchar (255),
  `Numero_hospedagem` Tipo
);

