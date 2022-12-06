
SELECT CONCAT(cod_aluno,nome) FROM Aluno; -- concatena (junta) os parametros passados

SELECT cod_aluno || ') ' || nome FROM Aluno
ORDER BY COD_ALUNO; -- equivalente a concat

SELECT INITCAP(nome) FROM ALUNO; -- inicia com a primeira letra maiscula
SELECT INITCAP('JOSE DA SILVA') FROM ALUNO; -- se colocar FROM dual mostra uma vez só

SELECT INSTR(NOME,'r') FROM ALUNO; -- retorna em que posicao esta o R por exemplo

SELECT LENGTH(nome) FROM ALUNO; -- numero de caracteres NO paramentro passado

SELECT Lower(nome) FROM ALUNO; -- transforma para minusculo

SELECT UPPER(nome) FROM ALUNO; -- transforma para maisculo

SELECT LPAD(cod_aluno,5,'0') FROM Aluno; -- LEFT, preenchimento de 0 a esquerda para ter 5 casas em todos

SELECT RPAD(salario,8,'0') FROM Aluno; -- RIGHT, preenchimento de 0 a direita para ter 8 casas em todos
SELECT RPAD(nome,10,'$') FROM Aluno; 

SELECT SUBSTR(nome,1,3) FROM ALUNO; -- copia parte de um texto, substr(campo,posicao inicial, qtde de caracter)
SELECT SUBSTR(nome,LENGTH(nome),1) FROM Aluno; -- pegando o ultimo caracter 
SELECT SUBSTR(nome,LENGTH(nome)-1,2) FROM Aluno; -- pegando os dois ultimos
SELECT substr(nome,3,LENGTH(nome)-3) FROM Aluno; -- a partir da posição 3

SELECT REPLACE(UPPER(nome),'R','$') FROM Aluno; -- substituir R por $


-------------------------------------- MAIS EXEMPLOS --------------------------------------------------------
 SELECT * FROM Aluno
 WHERE lower(nome) = 'marcio';

SELECT * FROM ALUNO 
WHERE UPPER(nome) = 'MARCIO';

SELECT * FROM ALUNO 
WHERE UPPER(SUBSTR(cidade,1,3)) = 'CAN'; 

UPDATE ALUNO SET 
salario = 633.47
WHERE COD_ALUNO = 1;

SELECT salario, 
REPLACE(salario, ',' , ''),  -- substituindo onde tem virgula por vazio
RPAD(salario,10,'0'),  -- zeros a direita ate 10 casas
LPAD(salario,10,'0'),  -- zeros a esquerda ate 10 casas
LPAD(REPLACE(salario,',',''),10,'0') 
FROM Aluno;  


--------------------------------- DATA ---------------------------------------------------------------
SELECT * FROM dual; -- dual tabela virtual para completar o SELECT

SELECT SYSDATE FROM Dual; --sysdate retorna DATA/hora do servidor

--Round e trunc
SELECT 
round(45.925, 2), --Arredonda para cima 2 casas
Trunc(45.929,2), -- Arredonda para baixo 2 casas
Mod(10,2) AS Resto_Divisao,
Trunc(1.99), -- Arredonda para 1 pq n passei casas
Trunc(1.99,2) -- Mantem do jeito que ta pois já esta em duas casas decimais
FROM dual;


--Funcoes de Data/Hora
SELECT DATA,
SYSDATE,
DATA+5, -- DATA + 5 dias
SYSDATE - DATA AS DIF_DIAS, -- diferença de dias 
Trunc(SYSDATE-DATA) AS Dias, -- dias arredondados
SYSDATE + 2 / 24 AS ADD_HORAS, -- adicionando duas horas
SYSDATE + 15 / 1440 AS ADD_MINUTOS, -- somando 15 minutos
SYSDATE + 30 / (3600*24) AS ADD_SEGUNDOS -- somando 30 segundos
FROM Contrato;

--Hora fica 00:00:00
SELECT Trunc(SYSDATE) FROM dual;

SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE-90) AS DIF_MES FROM Dual; -- Diferença de meses entre datas

SELECT ADD_MONTHS(SYSDATE,5) AS ADICIONA_MES_DATA FROM dual; -- Adiciona meses

SELECT NEXT_DAY(SYSDATE,'QUARTA-FEIRA') AS PROXIMA_QUARTA_DATA FROM dual; -- Proxima DATA a partir de um dia da semana

SELECT LAST_DAY(SYSDATE) AS ULTIMO_DIA_MES FROM dual; -- Ultimo dia do mes 

SELECT Round(SYSDATE,'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM dual; -- Primeiro dia do proximo mes, (se for dia <15 pega o primeiro dia do mes atual)

SELECT TRUNC(SYSDATE,'MONTH') AS PRIMEIRO_DIA_MES_CORRENTE FROM dual; -- Primeiro dia do mes corrente


----------------------------------------------- FORMATAÇÃO DE DATA -------------------------------------------------------------------------------------

--Conversor to_char(data, formato)
SELECT TO_CHAR(SYSDATE,'DD') FROM dual; -- Dia

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY') DATA FROM dual; -- DATA ignorando hora

SELECT TO_CHAR(SYSDATE,'DD/MM') DIA_MES FROM dual; -- Dia e Mes

SELECT TO_CHAR(SYSDATE,'DD') DIA FROM dual; -- Dia

SELECT TO_CHAR(SYSDATE,'MM') MES FROM dual; -- Mes

SELECT TO_CHAR(SYSDATE,'YYYY') ANO FROM dual; -- Ano

SELECT TO_CHAR(SYSDATE,'YY') ANO FROM dual; -- Ano

SELECT TO_CHAR(SYSDATE,'MONTH') MES1 FROM dual; -- Traz o nome do mes em palavra

SELECT TO_CHAR(SYSDATE,'D') DIA_SEMANA FROM dual; -- Traz o dia da semana

SELECT TO_CHAR(SYSDATE,'DY') DIA_SEMANA FROM dual; -- QUA (tres primeiros caracteres do dia)

SELECT TO_CHAR(SYSDATE,'DAY') DIA_SEMANA1 FROM dual; -- Quarta-Feira

SELECT TO_CHAR(SYSDATE,'YEAR') Ano FROM Dual; -- Em ingles 

SELECT TO_CHAR(SYSDATE,' "NOVO HAMBURGO", fmDAY "," DD "de" fmMonth "de" YYYY') FROM dual; 


----------------------------------------- FORMATAÇÃO DE HORA ---------------------------------------------------------

SELECT TO_CHAR(SYSDATE,'HH24:MI') HORA_MIN FROM dual; -- Trás hora e minutos

SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') HORA_MIN_SEG FROM dual; -- Hora, minutos e segundos

SELECT TO_CHAR(SYSDATE,'DD/MM HH24:MI:SS') DATA_HORA FROM dual;

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI:SS') DATA_HORA FROM dual;



---------------------------------------------- FORMATAÇÃO DE NUMEROS ---------------------------------------------------

--L -> R$
--G -> ponto
--D -> casas decimais

SELECT TRIM(TO_CHAR(Salario,'L99999.99')) salario1, TRIM(TO_CHAR(Salario,'L99G999D99')) salario2 FROM Aluno;  


--------------------------------------------- NVL E NVL2 -----------------------------------------

SELECT * FROM CONTRATO;

SELECT Total, 
desconto,
desconto+total,
nvl(desconto,0), -- substituindo null por 0 
nvl(desconto,0) + total, --
nvl2(desconto, total, -1) -- se o desconto FOR nulo vai ser -1, ELSE vai ser TOTAL 
FROM CONTRATO

UPDATE ALUNO SET Nome = NULL WHERE COD_ALUNO = 7; -- deixando campo nulo

SELECT cod_aluno, nvl(nome, 'SEM NOME') FROM ALUNO;

---------------------------------------------- CASE -----------------------------------------------------------

SELECT nome, estado, CASE 
WHEN Estado = 'RS' THEN 'GAUCHO'
WHEN Estado = 'AC' THEN 'ACREANO'
WHEN Estado = 'RJ' AND  SALARIO > 500 THEN 'CARIOCA'
WHEN ESTADO = 'SP' THEN 'PAULISTA'
ELSE 'OUTROS'
END AS Apelido
FROM Aluno;













