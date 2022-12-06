
SELECT Count(*) AS Qtde_Registros,
ROUND(avg(TOTAL)) AS media,
max(total) AS maximo,
min(total) AS minimo,
sum(total) AS soma,
max(data) AS data_maior,
min(DATA) AS data_menor
FROM CONTRATO c;

--Proximo código sequencial tabela
SELECT MAX(cod_contrato) + 1 AS PROXIMO_CODIGO
FROM CONTRATO c;

--Total de contratos por aluno
SELECT cod_aluno, count(*) AS Qtde_Contrato, sum(total) AS valor_total FROM CONTRATO 
group BY COD_ALUNO ; -- AS colunas que nao estiverem usando função de grupo tem que usar GROUP BY

--Total de contrato por DATA 
SELECT TO_CHAR(TRUNC(DATA),'DD/MM/YYYY') AS DATA, -- Trunc é para tirar a hora
sum(total) AS soma,
avg(total) AS Media,
COUNT(*) AS qtde
FROM CONTRATO 
GROUP BY TRUNC(DATA)
ORDER BY DATA DESC;

---------------------------- GROUP BY COM VÁRIAS TABELAS ---------------------------------------------

-- Qtde de registros com estado informado
SELECT COUNT(estado) FROM ALUNO; 


--Qtde de estados diferentes
SELECT COUNT(DISTINCT(estado)) FROM ALUNO; 

--Qtde de registros por estado
SELECT estado, COUNT(*) FROM ALUNO
GROUP BY ESTADO; 

--Total de contrato por estado e data
SELECT a.estado, trunc(c.data) AS DATA, sum(c.total) Total, COUNT(*) qtde FROM ALUNO a, CONTRATO c 
WHERE a.COD_ALUNO = c.COD_ALUNO 
GROUP BY a.ESTADO, TRUNC(c.data)
ORDER BY a.ESTADO , DATA DESC;

-- Having - filtrar coluna com funcao de grupo (having serve para funções de grupo que vai usar no select)
SELECT cod_aluno, avg(total) MEDIA FROM CONTRATO 
WHERE COD_ALUNO > 0
HAVING avg(TOTAL) > 500
GROUP BY COD_ALUNO 
ORDER BY COD_ALUNO;

-- Media mais alta dos alunos
SELECT MAX(AVG(total)) FROM CONTRATO 
GROUP BY COD_ALUNO;

--Soma dos salários por estado
SELECT Estado, SUM(salario) AS total FROM ALUNO 
GROUP BY ESTADO 
ORDER BY total DESC;



