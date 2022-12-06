--Exemplo 1, vai inserir em curso e aluno a partir do SELECT 
INSERT ALL
	INTO CURSO(cod_curso,NOME,VALOR)
	INTO Aluno(cod_aluno,nome,salario)
		SELECT cod_contrato+50,'INSERT ALL', 1013
		FROM Contrato
		WHERE cod_contrato=34;
		
--Exemplo 2 - Com INSERT all
	CREATE SEQUENCE seq_curso START WITH 6;
	
INSERT ALL
	WHEN total>=1000 THEN
		INTO Curso(cod_curso,nome,valor) VALUES (seq_curso.nextVal,'Curso>1000',total)
	WHEN desconto IS NULL THEN
		INTO Curso(cod_curso,nome,valor) VALUES (seq_curso.nextval,'Desconto is null',total)
	SELECT cod_contrato, total, desconto FROM Contrato WHERE cod_contrato = 35;
	
SELECT * FROM Curso;

--Exemplo 3 - Uso de MERGE, serve para atualizar dados de uma tabela a partir de algum select
CREATE SEQUENCE seq_con2 START WITH 36;
SELECT * FROM Contrato;
SELECT * FROM aluno;

MERGE INTO contrato TCN 
	USING (SELECT cod_aluno AS Aluno FROM Aluno
			WHERE estado='RS')
	ON 	(TCN.COD_ALUNO=Aluno)
		WHEN MATCHED THEN -- Encontrou o registro
			UPDATE SET desconto = 22
		WHEN NOT MATCHED THEN -- Nao encontrou o registro
			insert(tcn.COD_CONTRATO,tcn.DATA,tcn.COD_ALUNO,tcn.DESCONTO,tcn.TOTAL) VALUES (seq_con2.nextval,sysdate,aluno,0,666);
	