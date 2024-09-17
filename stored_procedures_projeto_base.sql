-- CRIAR UMA PROCEDURE ONDE EU PASSE UMA VARIAVEL DE ENTRADA E, A PARTIR DESSA VARIAVEL, RETORNAR STATUS.
	-- SE FINALIZADO - TRAZER ID E STATUS_TAREFA
	-- SE CANCELADO - TRAZER ID E STATUS_TAREFA
	-- SE "EM ANDAMENTO" - ERRO, POIS NÃO É UM STATUS REGISTRADO NO DATABASE.
    
    USE projetos_empresa;
    
    DELIMITER //
CREATE PROCEDURE ProjetoStatus (IN status varchar(20))
BEGIN 	
		IF status = 'finalizado' THEN
        SELECT projetos.id, status_tarefas
        FROM projetos
        JOIN tarefas
        ON projetos.id = tarefas.id_projetos
        WHERE status_tarefas = 'Finalizado';
        
        ELSEIF status = 'cancelado' THEN
        SELECT projetos.id, status_tarefas
        FROM projetos
        JOIN tarefas
        ON projetos.id = tarefas.id_projetos
        WHERE status_tarefas = 'Cancelado';
        
        ELSE 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Status desconhecido! Refaça sua solicitação.'; 
		END IF;
END 
//
DELIMITER ;    

CALL ProjetoStatus('finalizado');


-- PROCURAR MEMBROS DE UM PROJETO ESPECÍFICO ATRAVÉS DE SEU ID 
-- RETORNAR SUAS RESPECTIVAS TAREFAS, PROJETO QUE ESTÁ INSERIDO & E O STATUS DE SUA TAREFA.

DELIMITER //
CREATE PROCEDURE MembrosPorProjeto (IN id_projeto INT)
BEGIN
    SELECT cadastro_projetos.id AS id_do_projeto,
    cadastro_projetos.descricao AS nome_projeto,
    membros_projeto.nome_completo, 
    membros_projeto.setor AS setor_membro,
    tarefas.status_tarefas, 
    tarefas.descricao AS descricao_tarefa
    FROM membros_projeto 
    JOIN tarefas 
    ON membros_projeto.id = tarefas.id_membros
    JOIN projetos
    ON membros_projeto.id_projetos = projetos.id
    JOIN cadastro_projetos 
    ON projetos.id_cadastro = cadastro_projetos.id
    WHERE membros_projeto.id_projetos = id_projeto;
END;
//
DELIMITER ;

CALL MembrosPorProjeto(7);

-- VERIFICAR ORÇAMENTO TOTAL POR PROJETOS
-- RETORNAR ATRAVÉS DO SEU ID (1, 2 OU 3)

DELIMITER //
CREATE PROCEDURE VerificarOrcamentoProjeto (IN id_projeto INT)
BEGIN
    SELECT cp.descricao, ct.orcamento_total
    FROM cadastro_projetos cp
    JOIN custos_totais ct ON cp.descricao = ct.descricao
    WHERE cp.id = id_projeto;
END;
//
DELIMITER ;

CALL VerificarOrcamentoProjeto(3);

-- INSERINDO REGISTROS NA TABELA DE CADASTRO_PROJETOS
-- INSERINDO = ID E DESCRICAO
-- NOVO ID E NOVO PROJETO NA MINHA DATABASE E TABELA CADASTRO_PROJETOS!

DELIMITER //
CREATE PROCEDURE InserirProjeto (IN id_projeto INT, IN nome_projeto VARCHAR(100))
BEGIN
    INSERT INTO cadastro_projetos (id, descricao)
    VALUES (id_projeto, nome_projeto);
END;
//
DELIMITER ;

CALL InserirProjeto(4, 'Implementação de CRM');

SELECT *
FROM cadastro_projetos;