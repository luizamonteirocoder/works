-- CONSULTAS DO PROJETO FINAL

USE projetos_empresa;

-- 1. O analista de PMO da MonteCorp extraiu um relatório que centralizou todas as informações dos gerentes
-- ID, nome/sobrenome, projeto responsável e em qual filial está alocado.

SELECT gerentes.id AS id_gerente,
gerentes.nome_sobrenome,
gerentes.email,
gerentes.cidade AS filial,
gerentes.estado,
cadastro_projetos.descricao AS projeto_atual
FROM gerentes
JOIN projetos
ON gerentes.id = projetos.id_gerente
JOIN cadastro_projetos
ON projetos.id_cadastro = cadastro_projetos.id;

-- 1.1 O analista de PMO da MonteCorp também extraiu um relatório com as informações dos membros dos projetos
-- ID, nome/sobrenome, projeto responsável e em qual filial está alocado.

SELECT membros.id_projetos,
membros.nome_completo,
membros.setor AS cargo,
membros.email,
membros.cidade,
membros.estado,
cadastro_projetos.descricao AS projeto_atual,
tarefas.descricao AS função
FROM membros_projeto AS membros
JOIN tarefas
ON membros.id = tarefas.id_membros
JOIN projetos
ON membros.id_projetos = projetos.id
JOIN cadastro_projetos
ON cadastro_projetos.id = projetos.id_cadastro;

-- 2. O analista explorou demais dados referente ao status de cada tarefa que compõem os projetos
-- Data de início, finalização das demandas e gerente responsável.

SELECT projetos.id,
cadastro_projetos.descricao AS projeto_atual,
gerentes.nome_sobrenome AS gerente,
projetos.data_inicio,
projetos.data_fim,
tarefas.descricao AS função,
tarefas.status_tarefas
FROM projetos
JOIN gerentes
ON projetos.id_gerente = gerentes.id
JOIN tarefas
ON projetos.id = tarefas.id_projetos
JOIN cadastro_projetos
ON cadastro_projetos.id = projetos.id_cadastro;

-- 3. Demandas em andamento, não iniciada ou cancelada

SELECT
projetos.id, 
cadastro_projetos.descricao AS projeto_atual,
tarefas.descricao AS função,
COUNT(CASE WHEN tarefas.status_tarefas = 'Finalizado' THEN 1 END) AS finalizados,
COUNT(CASE WHEN tarefas.status_tarefas = 'Cancelado' THEN 1 END) AS cancelados,
COUNT(CASE WHEN tarefas.status_tarefas = 'Em Andamento' THEN 1 END) AS em_andamento,
COUNT(CASE WHEN tarefas.status_tarefas = 'Nao iniciado' THEN 1 END) AS nao_iniciado
FROM projetos
JOIN tarefas
ON projetos.id = tarefas.id_projetos
JOIN cadastro_projetos
ON cadastro_projetos.id = projetos.id_cadastro
GROUP BY projetos.id, projeto_atual, função;

-- 4. A sede da empresa em Porto Alegre iniciou dois projetos num prazo estipulado de 60 dias, sendo o modelo piloto da nova gestão inovadora. 
-- Relatório que indique em quantos dias os projetos foram concluídos e o gerente responsável.

SELECT 
projetos.id,
gerentes.nome_sobrenome AS gerente,
gerentes.cidade AS sede,
projetos.data_inicio,
projetos.data_fim,
COUNT(*) AS total_finalizados,
DATEDIFF(projetos.data_fim, projetos.data_inicio) AS qtd_dias
FROM projetos 
JOIN 
	(SELECT
	 id 
     FROM gerentes 
     WHERE cidade = 'Porto Alegre') AS filial
ON filial.id = projetos.id_gerente
JOIN gerentes
ON projetos.id_gerente = gerentes.id
JOIN tarefas 
ON projetos.id = tarefas.id_projetos
WHERE tarefas.status_tarefas = 'Finalizado'
GROUP BY projetos.id;

-- 5. A filial de São Paulo mostrou um resultado excelente, com a menor quantidade de dias na execução do projeto.

SELECT 
projetos.id,
cadastro_projetos.descricao AS função,
gerentes.nome_sobrenome AS gerente,
gerentes.cidade AS filial,
projetos.data_inicio,
projetos.data_fim,
DATEDIFF(projetos.data_fim, projetos.data_inicio) AS qtd_dias
FROM projetos
JOIN gerentes ON gerentes.id = projetos.id_gerente
JOIN cadastro_projetos ON cadastro_projetos.id = projetos.id_cadastro
JOIN tarefas ON projetos.id = tarefas.id_projetos
WHERE tarefas.status_tarefas = 'Finalizado'
AND DATEDIFF(projetos.data_fim, projetos.data_inicio) = (
	SELECT MIN(DATEDIFF(data_fim, data_inicio))
	FROM projetos
	JOIN tarefas ON projetos.id = tarefas.id_projetos
	WHERE tarefas.status_tarefas = 'Finalizado'
    )
GROUP BY projetos.id;

-- 6. Custos totais e View

SELECT cadastro_projetos.descricao AS projeto_atual, 
SUM(orcamentos.valor_total) AS orcamento_total
FROM orcamentos
LEFT JOIN projetos
ON orcamentos.id_projetos = projetos.id
LEFT JOIN cadastro_projetos
ON projetos.id_cadastro = cadastro_projetos.id
GROUP BY cadastro_projetos.descricao;