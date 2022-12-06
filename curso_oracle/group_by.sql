--Exemplo com RollUP para achar os sub-totais
SELECT cod_aluno, TRUNC(DATA), SUM(desconto) AS Desconto, sum(total) AS Total FROM Contrato
GROUP BY ROLLUP (COD_ALUNO,TRUNC(data));

SELECT * FROM COntrato;

UPDATE CONTRATO 
SET DESCONTO  = 15, DATA = SYSDATE - 23
WHERE cod_contrato = 34;

--Exemplo com Rollup pada deixar as linhas bem definidas
SELECT cod_aluno, CASE 
	WHEN trunc(DATA) IS NULL AND cod_aluno IS NOT NULL
		THEN 'Sub-Total'
	WHEN cod_aluno IS NULL 
		THEN 'Total'
	ELSE TO_CHAR(trunc(DATA))
	END Descricao, round(AVG(desconto),2) desconto, SUM(total) total FROM Contrato
	GROUP BY ROLLUP (COD_ALUNO, TRUNC(data));
	
--Exemplo com cube(trás ao contrário do rollup), trás subtotal por data tambem
SELECT cod_aluno, TRUNC(data), sum(total) FROM Contrato 
GROUP BY CUBE(cod_aluno, TRUNC(data));

--Identifica total geral
SELECT GROUPING(cod_aluno), SUM(total) FROM Contrato 
GROUP BY ROLLUP(cod_aluno);

--Total geral melhorado
SELECT GROUPING(cod_aluno), CASE
	WHEN GROUPING(cod_aluno) = 0 THEN to_char(cod_aluno)
	ELSE 'Total geral:'
	END Aluno, SUM(total) 
	FROM CONTRATO 
	GROUP BY ROLLUP(cod_aluno);

----- Grouping_ID
SELECT TRUNC(DATA), cod_aluno, CASE 
	WHEN grouping_id(cod_aluno) = 1 AND grouping_id(trunc(data)) = 0
		THEN 'Total do dia : '
	WHEN GROUPING_ID(cod_aluno) = 1 AND grouping_id(trunc(data)) = 1
		THEN 'Total geral : '
END AS Descricao, SUM(total) AS Total FROM Contrato
GROUP BY ROLLUP(trunc(data), COD_ALUNO); 

-------- Grouping sets retorna apenas subtotais
SELECT cod_aluno, trunc(data), sum(total) FROM Contrato 
GROUP BY GROUPING SETS (cod_aluno, trunc(data));

------------- Total igual repete o rank
SELECT trunc(data), cod_aluno, sum(total), RANK() OVER (ORDER BY sum(total) DESC) POSICAO FROM Contrato 
GROUP BY (trunc(data), cod_aluno);

-------- Posicao por grupo (partition by)
SELECT trunc(data), cod_aluno, sum(total), RANK() OVER (PARTITION BY TRUNC(data) ORDER BY sum(total) desc) Posicao FROM CONTRATO 
GROUP BY (TRUNC(data), cod_aluno)
ORDER BY trunc(data);

--Ratio to report mostra o % de cada subtotal do total
SELECT cod_aluno, sum(total) "Total do Cliente", round(RATIO_TO_REPORT(SUM(total)) OVER()*100 ,2)"% do Total" FROM Contrato 
GROUP BY ROLLUP(total,cod_aluno);

--Exemplo com lag e lead, mostra o anterior e o posterior
SELECT TRUNC(data), SUM(total) total_dia,
	lag (SUM(total),1) OVER (ORDER BY TRUNC(data)) anterior,
	lead (SUM(total),1) OVER (ORDER BY TRUNC(data)) posterior
FROM CONTRATO 
GROUP BY TRUNC(DATA)
ORDER BY TRUNC(data); 






