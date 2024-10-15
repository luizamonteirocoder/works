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

--
--
--

-- FAZER UPDATE NA TABELA DE GERENTES
-- ADICIONEI CIDADE E ESTADO

USE projetos_empresa;

ALTER TABLE gerentes
ADD COLUMN cidade VARCHAR(100),
ADD COLUMN estado VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;

UPDATE gerentes
SET 
    cidade = CASE 
        WHEN id = 1 THEN 'Porto Alegre'
        WHEN id = 2 THEN 'Porto Alegre'
        WHEN id = 3 THEN 'Sao Paulo'
        WHEN id = 4 THEN 'Rio de Janeiro'
        WHEN id = 5 THEN 'Sao Paulo'
        WHEN id = 6 THEN 'Belo Horizonte'
        WHEN id = 7 THEN 'Vitoria'
        WHEN id = 8 THEN 'Recife'
        WHEN id = 9 THEN 'Campo Grande'
        WHEN id = 10 THEN 'Manaus'
        
        ELSE cidade -- mantém o valor atual se o ID não corresponder
    END,
    estado = CASE 
        WHEN id = 1 THEN 'RS'
        WHEN id = 2 THEN 'RS'
        WHEN id = 3 THEN 'SP'
        WHEN id = 4 THEN 'RJ'
        WHEN id = 5 THEN 'SP'
        WHEN id = 6 THEN 'MG'
        WHEN id = 7 THEN 'ES'
        WHEN id = 8 THEN 'PE'
        WHEN id = 9 THEN 'MS'
        WHEN id = 10 THEN 'AM'
        
        ELSE estado -- mantém o valor atual se o ID não corresponder
    END;

--
--
--

-- FAZER UPDATE NA TABELA DE MEMBROS
-- ADICIONEI CIDADE E ESTADO

ALTER TABLE membros_projeto
ADD COLUMN cidade VARCHAR(100),
ADD COLUMN estado VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;

UPDATE membros_projeto
SET 
    cidade = CASE 
        WHEN id = 1 THEN 'Porto Alegre'
        WHEN id = 2 THEN 'Porto Alegre'
        WHEN id = 3 THEN 'Sao Paulo'
        WHEN id = 4 THEN 'Rio de Janeiro'
        WHEN id = 5 THEN 'Sao Paulo'
        WHEN id = 6 THEN 'Belo Horizonte'
        WHEN id = 7 THEN 'Vitoria'
        WHEN id = 8 THEN 'Recife'
        WHEN id = 9 THEN 'Campo Grande'
        WHEN id = 10 THEN 'Manaus'
        
        ELSE cidade -- mantém o valor atual se o ID não corresponder
    END,
    estado = CASE 
        WHEN id = 1 THEN 'RS'
        WHEN id = 2 THEN 'RS'
        WHEN id = 3 THEN 'SP'
        WHEN id = 4 THEN 'RJ'
        WHEN id = 5 THEN 'SP'
        WHEN id = 6 THEN 'MG'
        WHEN id = 7 THEN 'ES'
        WHEN id = 8 THEN 'PE'
        WHEN id = 9 THEN 'MS'
        WHEN id = 10 THEN 'AM'
        
        ELSE estado -- mantém o valor atual se o ID não corresponder
    END;
    
--
    
-- FAZER UPDATE NA TABELA DE MEMBROS
-- ADICIONEI A COLUNA EMAIL
    
ALTER TABLE membros_projeto
ADD COLUMN email VARCHAR(100);

SET SQL_SAFE_UPDATES = 0;

UPDATE membros_projeto
SET 
	email = CASE 
        WHEN id = 1 THEN 'griffith.sellers@montecorp.com.br'
        WHEN id = 2 THEN 'mara.johnson@montecorp.com.br'
        WHEN id = 3 THEN 'kenyon.greene@montecorp.com.br'
        WHEN id = 4 THEN 'ruby.welch@montecorp.com.br'
        WHEN id = 5 THEN 'theodore.hayden@montecorp.com.br'
        WHEN id = 6 THEN 'jaime.hill@montecorp.com.br'
        WHEN id = 7 THEN 'kenyon.foster@montecorp.com.br'
        WHEN id = 8 THEN 'ezekiel.pratt@montecorp.com.br'
        WHEN id = 9 THEN 'beverly.henry@montecorp.com.br'
        WHEN id = 10 THEN 'zenia.pugh@montecorp.com.br'
        
        ELSE email -- mantém o valor atual se o ID não corresponder
    END;
