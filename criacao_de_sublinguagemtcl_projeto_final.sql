-- DESAFIO 10
-- SUBLINGUAGEM TCL 
-- PRIMEIRA TABELA

-- VAMOS INICIAR A TRANSAÇÃO COM A SENTENÇA ABAIXO
START TRANSACTION;

-- NESTE CASO, A TRANSAÇÃO IRÁ DELETAR REGISTROS QUE SE ENCONTRAM COM O STATUS "CANCELADO"
-- A TABELA ESCOLHIDA É A "TAREFAS"
DELETE FROM tarefas 
WHERE status_tarefas = 'Cancelado';

-- CONFIRMAR A TRANSAÇÃO, EXECUTANDO O COMANDO NA TABELA "TAREFAS"
COMMIT;


-- SEGUNDA ETAPA, VAMOS REPOR OS REGISTROS DELETADOS


-- VAMOS INICIAR A TRANSAÇÃO COM A SENTENÇA ABAIXO
START TRANSACTION;

-- NESTE CASO, IREI REPOR OS REGISTROS QUE FORAM DELETADOS ANTERIORMENTE
-- RELEMBRANDO, DE STATUS "CANCELADO"
INSERT INTO tarefas (id_projetos, descricao, status_tarefas)
VALUES 
(8, 'Supervisiona o processo de compras de bens e servicos, negocia com fornecedores, controla o orcamento e garante que as aquisicoes sejam feitas dentro dos padroes de qualidade e prazo.', 'Cancelado'),
(10, 'Desenvolve, testa e mantém software. Trabalha com diferentes linguagens de programação e frameworks, focando na criação de soluções robustas e escaláveis.', 'Cancelado');

-- CONFIRMAR A TRANSAÇÃO, EXECUTANDO O COMANDO NA TABELA "TAREFAS"
COMMIT;

--

-- SEGUNDA TABELA

-- INICIANDO A TRANSAÇÃO NA SEGUNDA TABELA
START TRANSACTION;

-- NESTA SENTENÇA, VAMOS CRIAR 4 NOVOS REGISTROS NA TABELA "CADASTRO_PROJETOS"
INSERT INTO cadastro_projetos (id, descricao)
VALUES 
(4, 'Integração de Sistema de Gestão Financeira'),
(5, 'Automação de Processos de Vendas'),
(6, 'Implementação de Soluções de Machine Learning'),
(7, 'Desenvolvimento de Aplicativo de Gestão de Estoque');

-- CRIANDO UM SAVEPOINT APÓS A INSERÇÃO DOS 4 NOVOS REGISTROS
SAVEPOINT savepoint1;

-- INSERINDO MAIS 4 NOVOS REGISTROS NA TABELA "CADASTRO_PROJETOS"
INSERT INTO cadastro_projetos (id, descricao)
VALUES 
(8, 'Projeto de Otimização de Operações Logísticas'),
(9, 'Desenvolvimento de Plataforma de Análise de Dados em Tempo Real'),
(10, 'Implementação de Sistema de Automação de Marketing'),
(11, 'Projeto de Automação de Processos de Compliance Corporativo');

-- CRIANDO UM 2º SAVEPOINT APÓS A INSERÇÃO DOS OUTROS 4 NOVOS REGISTROS
SAVEPOINT savepoint2;

-- ESTE COMANDO APAGA OS 4 NOVOS PRIMEIROS REGISTROS INSERIDOS NA TABELA 'CADASTRO_PROJETOS'
-- POR ISSO, O SAVEPOINT1 PRESERVA A INSERÇÃO DOS PRIMEIROS 4 REGISTROS 
-- ENQUANTO O SAVEPOINT2 PRESERVA OS OUTROS 4 INSERIDOS
-- TOTAL DE 8 REGISTROS INSERIDOS
DELETE FROM cadastro_projetos 
WHERE id BETWEEN 4 AND 7;

-- CONFIRMAR A TRANSAÇÃO, EXECUTANDO O COMANDO NA TABELA "CADASTRO_PROJETOS"
COMMIT;
