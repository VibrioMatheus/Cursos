--Exemplo 1 com UNION
SELECT cod_aluno, total, desconto FROM CONTRATO
WHERE COD_ALUNO = 1
UNION ALL --Nao agrupa iguais, UNION agrupa iguais
SELECT COD_ALUNO, total, desconto FROM Contrato 
WHERE total >= 1000;

--Exemplo 2 com UNION e UNION ALL
SELECT cod_contrato, DATA, total, 'UNION 1' AS query FROM Contrato 
WHERE TOTAL>=1000 AND total<2000
UNION ALL 
SELECT COD_CONTRATO, DATA, TOTAL, 'UNION 2' AS QUERY FROM CONTRATO 
WHERE DESCONTO IS NOT NULL
UNION
SELECT COD_CONTRATO, DATA, total, 'UNION 3' AS QUERY
FROM Contrato 
WHERE total > 2000
ORDER BY 4; --ORDER BY coluna 4

--Exemplo 3 com INTERSECT 
SELECT cod_contrato, DATA, desconto, total FROM CONTRATO
WHERE desconto IS NOT NULL
INTERSECT -- Registros estao presentes em todos os conjuntos(selects)
SELECT cod_contrato, DATA, desconto, TOTAL FROM Contrato 
WHERE total > 1000
ORDER BY 1;

-- Exemplo 4 com MINUS
SELECT cod_contrato, DATA, desconto, total 
FROM Contrato 
WHERE DESCONTO IS NOT NULL 
MINUS -- MINUS vai fazer um menos o outro, descarta os iguais
SELECT COD_CONTRATO, DATA, desconto, TOTAL 
FROM Contrato
WHERE total > 2000
ORDER BY 1;

