-- DESAFIO FUNCOES

-- CRIAÇÃO DE UMA FUNÇÃO QUE RETORNA O ORÇAMENTO MÉDIO POR PROJETO
-- O RETORNO PODE SER USADO EM RELATÓRIOS OU DENTRO DE VIEWS PARA EXIBIR INSIGHTS FINANCEIROS.

DELIMITER //
CREATE FUNCTION calcular_orcamento_medio(id_projeto INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE orcamento_medio DECIMAL(10, 2);

    SELECT AVG(valor_total) INTO orcamento_medio
    FROM orcamentos
    WHERE id_projetos = id_projeto;

    RETURN orcamento_medio;
END;
//
DELIMITER ;

-- QUERY PARA TRAZER INFORMAÇÕES DA DESCRIÇÃO DO PROJETO, ORÇAMENTO TOTAL E MÉDIO
SELECT 
    custos_totais.descricao, 
    MAX(custos_totais.orcamento_total) AS orcamento_total, 
    ROUND(AVG(calcular_orcamento_medio(projetos.id)),2) AS orcamento_medio
FROM custos_totais
JOIN cadastro_projetos
ON cadastro_projetos.descricao = custos_totais.descricao
JOIN projetos
ON projetos.id_cadastro = cadastro_projetos.id
GROUP BY custos_totais.descricao;

--
-- CRIAÇÃO DE FUNÇÃO PARA VERIFICAR STATUS DE CONCLUSÃO DOS PROJETOS: EM ANDAMENTO OU CONCLÚIDO

DELIMITER //
CREATE FUNCTION verificar_conclusao_projeto(id_projeto INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);

    IF (SELECT COUNT(*) 
        FROM tarefas 
        WHERE id_projetos = id_projeto AND status_tarefas != 'Finalizado') = 0 THEN
        SET status = 'Concluído';
    ELSE
        SET status = 'Em andamento';
    END IF;

    RETURN status;
END;
//
DELIMITER ;

-- QUERY PARA TRAZER INFORMAÇÕES DO STATUS DE CONCLUSÃO DOS PROJETOS: EM ANDAMENTO OU CONCLÚIDO
-- E TAMBÉM O "ID" DO RESPECTIVO GERENTE DO PROJETO

SELECT projetos.id AS id_projeto,
cadastro_projetos.descricao, 
gerentes.id AS id_gerente,
gerentes.nome_sobrenome AS gerente_responsavel,
verificar_conclusao_projeto(projetos.id) AS status_projeto
FROM projetos
JOIN cadastro_projetos
ON projetos.id_cadastro = cadastro_projetos.id
JOIN gerentes
ON projetos.id_gerente = gerentes.id;