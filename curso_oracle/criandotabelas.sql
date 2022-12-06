CREATE TABLE Aluno(
	cod_aluno integer NOT NULL,
	nome varchar(30),
	cidade varchar2(30),
	CEP varchar(10),
	PRIMARY KEY (cod_aluno)
);

SELECT * FROM Aluno;

INSERT INTO Aluno(cod_aluno,nome,cidade,CEP)
values(1,'Marcio','Novo Hamburgo','93000000');

INSERT INTO Aluno(cod_aluno,nome,cidade,CEP)
values(2,'Paula','Ivoti','93000000');

INSERT INTO Aluno(cod_aluno,nome,cidade,CEP)
values(3,'Maria','Sapiranga','93000000');


CREATE TABLE Curso(
	cod_curso integer NOT NULL PRIMARY KEY,
	nome varchar2(30),
	valor number(8,2),
	carga_horaria integer
);

SELECT * FROM Curso;

INSERT INTO Curso values(1,'Oracle SQL e PL/SQL',500,25);
INSERT INTO Curso values(2,'Oracle SQL e PL/SQL',499,25);
INSERT INTO Curso values(3,'Oracle SQL e PL/SQL',1500,100);
INSERT INTO Curso values(4,'Oracle SQL e PL/SQL',1600,100);

CREATE TABLE Contrato(
	cod_contrato integer NOT NULL PRIMARY KEY,
	DATA DATE,
	cod_aluno integer,
	total number(8,2),
	desconto number(5,2)
);

SELECT * FROM Contrato;

INSERT INTO Contrato values(1, SYSDATE,1,500,10);
INSERT INTO Contrato values(2, SYSDATE,2,500,10);
INSERT INTO Contrato values(3, SYSDATE,3,1500,05);
INSERT INTO Contrato values(4, SYSDATE-5,2,1600,10);
INSERT INTO Contrato values(5, SYSDATE-4,5,800,10);
INSERT INTO Contrato values(6, SYSDATE-3,5,445,0);
INSERT INTO Contrato values(7, SYSDATE-2,5,445,20);

CREATE TABLE Desconto(
	classe varchar(1) PRIMARY KEY,
	inferior number(4,2),
	superior number(4,2)
);

INSERT INTO Desconto values('A',00,10);
INSERT INTO Desconto values('B',11,15);
INSERT INTO Desconto values('C',16,20);
INSERT INTO Desconto values('D',21,25);
INSERT INTO Desconto values('E',26,30);

SELECT * FROM Desconto;

--Inserir coluna na tabela
ALTER TABLE Contrato ADD col_teste varchar(50);

SELECT * FROM Contrato;

--Excluir coluna da tabela
ALTER TABLE Contrato DROP COLUMN col_teste;

--Alterar nome de coluna
ALTER TABLE Aluno RENAME COLUMN Nome TO Nome2;
ALTER TABLE Aluno RENAME COLUMN Nome2 TO Nome;

SELECT * FROM Aluno;

--Excluir tabela
DROP TABLE tabela;

--Sequence
CREATE SEQUENCE seque_aluno START WITH 4;

INSERT INTO ALUNO(cod_aluno,nome,cidade,cep)
values(seque_aluno.NEXTVAL,'Valdo','Canos','11100000');

INSERT INTO ALUNO(cod_aluno,nome,cidade,cep)
values(seque_aluno.NEXTVAL,'Andre','Ivoti','213213321');

--Data/Hora atual
SELECT sysdate FROM DUAL; -- dual só funciona assim para ser usado com função

SELECT * FROM DUAL;

--Valor atual da sequence
SELECT seq_aluno.CURRVAL FROM Dual;

--Confirmar alterações realizada (insert, update e delete)
COMMIT;

SELECT * FROM Aluno;

DELETE FROM Aluno;

--Desfaz alterações realizada (insert, update e delete)
ROLLBACK;

--Excluir registro da tabela
SELECT * FROM Aluno;

DELETE FROM Aluno WHERE COD_ALUNO = 5;

SELECT * FROM Aluno WHERE Nome = 'Valdo';

DELETE FROM Aluno WHERE nome = 'Valdo';



CREATE TABLE Item(
	cod_item integer NOT NULL PRIMARY KEY,
	cod_curso integer,
	cod_contrato integer,
	valor number(8,2)
);

SELECT * FROM item;

INSERT INTO Item values(1,1,1,500);
INSERT INTO Item values(2,1,2,500);
INSERT INTO Item values(3,3,3,1500);
INSERT INTO Item values(4,4,4,1600);
INSERT INTO Item values(5,1,5,500);
INSERT INTO Item values(6,1,6,500);
INSERT INTO Item values(7,2,6,500);
INSERT INTO Item values(8,3,7,500);

COMMIT;

--Alterar registro da tabela
UPDATE Contrato SET
	desconto = 18
WHERE COD_CONTRATO = 2;

UPDATE Contrato SET
	desconto = 20,
	DATA = '05/01/2013',
	TOTAL = 2500 -- na ultima nao coloca virgula
WHERE COD_CONTRATO = 2;

UPDATE Aluno SET
	Cidade = 'Canoas'
WHERE CIDADE = 'Ivoti'; -- Upper Coloca em maiusculo 

COMMIT;

CREATE TABLE Contrato_VIP 
AS SELECT * FROM CONTRATO WHERE TOTAL > 500;

SELECT * FROM CONTRATO_VIP;

--add coluna na tabela
ALTER TABLE CONTRATO_VIP ADD valor number(5,2);

--alterar coluna
ALTER TABLE contrato_vip MODIFY valor number(12,2) DEFAULT 0;

-- renomear coluna
ALTER TABLE contrato_vip RENAME COLUMN valor TO valor2;

-- excluir a coluna
ALTER TABLE contrato_vip DROP COLUMN valor2;

--excluir tabela
DROP TABLE contrato_vip;

--Comentário na tabela 
COMMENT ON TABLE CONTRATO IS 'Informações de Contratos';

--Comentário na coluna da tabela
COMMENT ON COLUMN Contrato.COD_CONTRATO IS 'Codigo do Contrato';

-- Desabilita a coluna 
ALTER TABLE CONTRATO ADD total2 numeric(8,2);
ALTER TABLE CONTRATO SET unused (total2); -- desabilitando a coluna

--Excluir colunas nao usadas
ALTER TABLE CONTRATO DROP unused columns; 

--Exclui todos os registros da tabela
TRUNCATE TABLE tabela;












