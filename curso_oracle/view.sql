--Criando a view
CREATE OR REPLACE VIEW V_Contrato AS
SELECT cod_contrato, desconto FROM CONTRATO 
WHERE DESCONTO >= 10;

--Usando a view
SELECT * FROM V_Contrato;

--View com parametros de saida
CREATE OR REPLACE VIEW v_aluno2(cod,aluno,sal)
AS SELECT cod_aluno, nome, salario FROM Aluno;

SELECT * FROM v_aluno2;

--View complexa
CREATE OR REPLACE VIEW V_Contrato 
AS SELECT Trunc(data) AS DATA,
max(desconto) Maximo,
AVG(desconto) media,
count(*) qtde
FROM CONTRATO 
GROUP BY TRUNC(data);

SELECT * FROM v_Contrato;