-- CRIAÇÃO DE TRIGGERS: DESAFIO ENTREGÁVEL 8

-- CRIAÇÃO DE TRIGGER PARA IMPEDIR A EXCLUSÃO DE PROJETOS COM TAREFAS PENDENTES
-- SE O PROJETO ESTIVER COM STATUS "EM ANDAMENTO" / "CANCELADO".. NÃO SERÁ POSSÍVEL DE DELETAR REGISTRO
USE projetos_empresa;

DELIMITER //
CREATE TRIGGER trigger_prevenir_exclusao_projetos
BEFORE DELETE ON projetos
FOR EACH ROW
BEGIN
    DECLARE tarefas_pendentes INT;
    
    SELECT COUNT(*) INTO tarefas_pendentes
    FROM tarefas
    WHERE id_projetos = OLD.id AND status_tarefas != 'Finalizado';
    
    IF tarefas_pendentes > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível excluir o projeto, pois há tarefas pendentes.';
    END IF;
END;
//
DELIMITER ;

DELETE FROM projetos WHERE id = 3;
-- 3	Nao iniciado	Implementação de plataforma de BI

DELETE FROM projetos WHERE id = 8;
-- 8	Cancelado	Desenvolvimento de portal de compras corporativo


-- CRIAÇÃO DE TRIGGER PARA ATUALIZAR A DATA DE FINALIZAÇÃO (DATA_FIM)
-- SE UM PROJETO ESTAVA COM STATUS DIVERGENTE DE "FINALIZADO", IRÁ ALTERAR
-- QUANDO O STATUS FOR ALTERADO PARA "FINALIZADO" ATUALMENTE, A DATA_FIM IRÁ MUDAR PARA A DATA ATUAL (DATA E HORÁRIO)
DELIMITER //
CREATE TRIGGER trigger_update_data_conclusao
AFTER UPDATE ON tarefas
FOR EACH ROW
BEGIN

    IF NEW.status_tarefas = 'Finalizado' AND OLD.status_tarefas != 'Finalizado' THEN
        UPDATE projetos
        SET data_fim = NOW() 
        WHERE id = NEW.id_projetos;

        INSERT INTO log_atualizacoes_status_projetos (id_projeto, descricao, usuario, data_atualizacao, hora_atualizacao)
        VALUES (
            NEW.id_projetos, 
            CONCAT('Projeto ID: ', NEW.id_projetos, ' teve sua data de conclusão atualizada.'), 
            USER(),  -- Captura o usuário atual
            CURDATE(),  -- Captura a data atual
            CURTIME()  -- Captura a hora atual
        );
    END IF;
END;
//
DELIMITER ;

-- O ID "3" ESTAVA COM STATUS "EM ANDAMENTO" ANTERIORMENTE
UPDATE tarefas
SET status_tarefas = 'Finalizado'
WHERE id = 3;

-- ATUALMENTE ESTÁ COMO "FINALIZADO" E A DATA_FIM ALTEROU TAMBÉM
select tarefas.id,
projetos.id,
projetos.data_inicio,
projetos.data_fim
from tarefas
JOIN projetos
ON tarefas.id_projetos = projetos.id
WHERE id_projetos = 3;

-- TABELA DE LOG: CRIAÇÃO DE TABELA PARA ARMAZENAR OS LOGS DA OPERAÇÃO "UPDATE DATA CONCLUSAO / STATUS PROJETO" ACIMA
-- CAMPOS DE LOG: O LOG REGISTRA USUÁRIO, DATA, E HORA DA OPERAÇÃO.

CREATE TABLE log_atualizacoes_status_projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projeto INT,
    descricao VARCHAR(255),
    usuario VARCHAR(100),  -- Campo para armazenar o usuário
    data_atualizacao DATE,  -- Campo para armazenar a data
    hora_atualizacao TIME,  -- Campo para armazenar a hora
    FOREIGN KEY (id_projeto) REFERENCES projetos(id)
    );
    
    SELECT *
    FROM log_atualizacoes_status_projetos;
