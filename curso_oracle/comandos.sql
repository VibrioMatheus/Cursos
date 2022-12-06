
SELECT a.cod_aluno,a.nome,a.cidade FROM ALUNO a;

SELECT cod_aluno AS codigo, nome AS "Nome do aluno" FROM ALUNO;

--Distinct retira linhas duplicadas
SELECT DISTINCT cidade FROM ALUNO a;

--Nao agrupa pois cod_aluno diferente para cada linha
SELECT DISTINCT cidade, cod_aluno FROM Aluno 
ORDER BY CIDADE;

--Calculos
SELECT nome AS curso, valor, valor/carga_horaria, round(valor/carga_horaria,2) AS valor_hora FROM CURSO 
ORDER BY valor_hora;

--Calculos com null, resultado = null
UPDATE CONTRATO SET 
	desconto = NULL 
WHERE COD_CONTRATO = 4;

SELECT cod_contrato, total, desconto, total+desconto FROM Contrato;

--Tratando o null
SELECT cod_contrato, desconto, NVL(desconto,0), total, total+NVL(desconto,0) AS total_mais_desconto FROM CONTRATO; 

--Concatenaçãod de colunas
SELECT cod_aluno || ' - ' || NOME || ' // ' || Cidade AS Aluno FROM ALUNO -- // = +
ORDER BY cod_aluno;

--TIPOS DE COLUNAS

integer - 1,2 -- numero inteiro -> 38 digitos
number(5,2) - 999,99
NUMBER(4,2) - 99,99

DATE - '10/03/2011 00:00:00'

varchar2(10) - 'Marcio' -- Sinonimo de varchar
char(10) - 'Marcio '
