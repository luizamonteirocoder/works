--- CRIAÇÃO DE VIEWS ---

USE projetos_empresa;

CREATE VIEW equipe_projetos AS
SELECT gerentes.id AS gerente_id,
gerentes.nome_sobrenome AS nome_completo,
cadastro_projetos.descricao AS nome_projeto,
membros_projeto.nome_completo AS membros_projeto,
membros_projeto.setor,
membros_projeto.id_projetos
FROM projetos
JOIN membros_projeto
ON projetos.id = membros_projeto.id_projetos
JOIN cadastro_projetos 
ON projetos.id_cadastro = cadastro_projetos.id
JOIN gerentes
ON projetos.id_gerente = gerentes.id
ORDER BY membros_projeto.id_projetos ASC;

SELECT *
FROM equipe_projetos;

CREATE VIEW visao_projetos AS
SELECT projetos.*,
tarefas.descricao,
tarefas.status_tarefas
FROM projetos
JOIN tarefas
ON projetos.id = tarefas.id_projetos;

SELECT *
FROM visao_projetos;

CREATE VIEW custos_totais AS
SELECT cadastro_projetos.descricao, 
SUM(orcamentos.valor_total) AS orcamento_total
FROM orcamentos
LEFT JOIN projetos
ON orcamentos.id_projetos = projetos.id
LEFT JOIN cadastro_projetos
ON projetos.id_cadastro = cadastro_projetos.id
GROUP BY cadastro_projetos.descricao;

SELECT *
FROM custos_totais;

CREATE VIEW status_projetos AS
SELECT gerentes.id AS id_gerente,
gerentes.nome_sobrenome AS nome_completo,
projetos.id AS id_projeto,
tarefas.status_tarefas,
cadastro_projetos.descricao AS projeto_atual
FROM gerentes
JOIN projetos ON projetos.id_gerente = gerentes.id
JOIN tarefas
ON projetos.id = tarefas.id_projetos
JOIN cadastro_projetos
ON projetos.id_cadastro = cadastro_projetos.id
ORDER BY status_tarefas;

SELECT *
FROM status_projetos;