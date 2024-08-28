--- PRIMEIRA ENTREGA - PROJETO FINAL

CREATE DATABASE projetos_empresa;

USE projetos_empresa;

CREATE TABLE gerentes (
id INT PRIMARY KEY AUTO_INCREMENT,
nome_sobrenome varchar(200),
email varchar(50),
telefone varchar(15)
);

CREATE TABLE orcamentos (
id INT PRIMARY KEY AUTO_INCREMENT,
id_projetos INT,
valor_total decimal (9,2)
);

CREATE TABLE projetos (
id INT PRIMARY KEY NOT NULL,
id_gerente INT,
descricao varchar(255),
data_inicio datetime,
data_fim datetime
);

ALTER TABLE projetos
ADD CONSTRAINT FOREIGN KEY (id_gerente) REFERENCES gerentes(id);

ALTER TABLE orcamentos
ADD CONSTRAINT FOREIGN KEY (id_projetos) REFERENCES projetos(id);

CREATE TABLE membros_projeto (
id INT PRIMARY KEY NOT NULL,
id_projetos INT,
nome_completo varchar(200),
setor varchar(200),
FOREIGN KEY (id_projetos) REFERENCES projetos(id)
);

CREATE TABLE tarefas (
id INT PRIMARY KEY AUTO_INCREMENT,
id_projetos INT,
id_membros INT,
descricao varchar(200),
status_tarefas varchar(50),
FOREIGN KEY (id_projetos) REFERENCES projetos(id),
FOREIGN KEY (id_membros) REFERENCES membros_projeto(id)
);