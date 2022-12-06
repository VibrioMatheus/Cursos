CREATE SEQUENCE seq_aluno2
START WITH 60 -- valor inicial
INCREMENT BY 2--Qtde a incrementar
MINVALUE 60 --Valor maximo
MAXVALUE 350 --Valor maximo
NOCACHE -- nao guarda em cache faixa de valores
NOCYCLE;

INSERT INTO ALUNO (cod_aluno, NOME) VALUES (seq_aluno2.nextval,'Master training');

--Valor atual
SELECT seq_aluno2.currval FROM dual;

--Alterar valor da sequência
ALTER SEQUENCE seq_aluno2
MAXVALUE 500;

--Para mudar o valor atual da sequência temos que dropar dps criar dnv, por exemplo:
DROP SEQUENCE seq_aluno1
CREATE SEQUENCE seq_aluno1 START WITH 80;

--------------------------------------- INDICES SECUNDÁRIOS ----------------------------------------------

SELECT nome FROM ALUNO a
WHERE nome LIKE '%MA%';    -- Ver plano de execução

CREATE INDEX ind_Aluno_nome1 ON Aluno(nome); -- Com a criação de um indice ganhamos perfomace na hora da procura

SELECT nome FROM Aluno WHERE nome LIKE '%A%';