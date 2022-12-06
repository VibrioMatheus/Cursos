SELECT * FROM Aluno;

ALTER TABLE Aluno ADD estado char(2) DEFAULT 'RS'; --Com DEFAULT todos adicionados ficam com RS

ALTER TABLE Aluno ADD Salario NUMBER (8,2) DEFAULT 620;

UPDATE Aluno SET
	Estado = 'AC', Salario = 250
WHERE COD_ALUNO = 1;

UPDATE ALUNO SET
	Estado = 'MT', Salario = 2000
WHERE COD_ALUNO = 2;

UPDATE Aluno SET
	Estado = 'SP', Salario = 800
WHERE COD_ALUNO = 3;

COMMIT;

SELECT * FROM Aluno 
WHERE Estado <> 'RS'
AND salario <= 800
ORDER BY salario DESC;

INSERT INTO Aluno(cod_aluno, nome, cidade) VALUES (seque_aluno.nextval,'Valdo','Dois Irmaos');
INSERT INTO Aluno(cod_aluno, nome, cidade) VALUES (seque_aluno.nextval,'Aldo','Quatro Irmaos');

UPDATE Aluno SET
	Estado = 'SP', Salario = 900, Nome = 'Pedro'
WHERE cod_aluno = 7;

SELECT Estado, salario, nome FROM ALUNO 
ORDER BY estado, salario DESC; -- Quando usar duas colunas para ORDER BY, temos que usar DESC por exemplo para ordenar

-- 31/12/1899 - Data zero
-- 01/01/1900 - Data 1

ALTER TABLE ALUNO ADD nascimento DATE DEFAULT Sysdate - 1000; -- DATA atual menos 1000 dias
--
SELECT SYSDATE - SYSDATE - 100 FROM dual;

--Manipulando datas
UPDATE Aluno SET nascimento='10/10/2001' -- Hora fica 00:00:00
WHERE COD_ALUNO = 1;

UPDATE Aluno SET nascimento='10/08/2000'
WHERE COD_ALUNO =2;

--Filtrar por data
SELECT cod_aluno, nascimento, TRUNC(nascimento) AS nascimento, nome FROM ALUNO -- trunc NO campo DATA ele tira a hora, considerando apenas a data
WHERE Trunc(nascimento) = '10/10/2001';


SELECT cod_aluno, nascimento, trunc(nascimento), nome FROM ALUNO 
WHERE nascimento
BETWEEN TO_DATE('10/10/2001 00:00','DD/MM/YYYY HH24:MI') 
AND TO_DATE('10/10/2001 23:55', 'DD/MM/YYYY HH24:MI') -- colocando formato e querendo entre duas datas e hora


--TABELA CONTRATO 
SELECT * FROM CONTRATO 

SELECT cod_contrato, DATA, total, desconto, desconto + 1000 AS Calculo FROM CONTRATO c 
WHERE total <= DESCONTO + 1000;

UPDATE CONTRATO SET desconto = NULL 
WHERE COD_CONTRATO = 2;

SELECT * FROM Contrato 
WHERE desconto IS NULL;

SELECT * FROM CONTRATO 
WHERE desconto IS NOT NULL;

SELECT * FROM contrato 
WHERE desconto BETWEEN 0 AND 10; --esteja entre 0 e 10

--Colunar com valor null
SELECT cod_contrato, total, desconto, nvl(desconto,0) FROM Contrato 
WHERE NVL(desconto,0) BETWEEN 0 AND 10; --esteja entre 0 e 10, considerando os nulos como 0

--Mesmo efeito do between
SELECT * FROM CONTRATO
WHERE DESCONTO >= 0
AND DESCONTO <= 10
OR DESCONTO IS NULL;

-- IN /// NOT IN 
SELECT * FROM item 
WHERE cod_curso IN (1,2,3);

SELECT * FROM item 
WHERE cod_curso NOT IN (1,2,3);

INSERT INTO curso VALUES (5,'Linux', 1000, 50);

--Cursos nao vendidos
SELECT * FROM CURSO 
WHERE COD_CURSO NOT IN (SELECT cod_curso FROM item);

--Cursos vendidos
SELECT * FROM CURSO 
WHERE COD_CURSO IN (SELECT cod_curso FROM item);

--somente onde a segunda letra seja A
SELECT * FROM CURSO  WHERE nome LIKE 'L%'; --Cursos que começam com L
SELECT * FROM Curso WHERE nome LIKE '%Oracle%'; -- Cursos onde contenham a palavra Oracle
SELECT * FROM Curso WHERE nome LIKE '%SQL'; -- Cursos onde terminam com SQL

--Adicionando coluna na tabela curso
ALTER TABLE CURSO ADD pre_req integer;

UPDATE Curso SET pre_req = 1
WHERE COD_CURSO = 2;

UPDATE Curso SET pre_req = 3
WHERE COD_CURSO = 4;

--Cursos sem pre requisito
SELECT * FROM Curso WHERE pre_req IS NULL;

--Cursos com pre requisitos
SELECT * FROM CURSO WHERE pre_req IS NOT NULL;

--Precedencia de operadores, Hierarquia --> (), and, or
SELECT * FROM CURSO 
WHERE (valor > 750 OR valor < 1000)
AND CARGA_HORARIA = 25;






