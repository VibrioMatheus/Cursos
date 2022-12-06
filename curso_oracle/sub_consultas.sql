--Exemplo
SELECT cod_contrato, DATA, total FROM CONTRATO 
WHERE TOTAL > (SELECT valor FROM CURSO 
WHERE cod_curso = 1);


--Todos os alunos da mesma cidade e estado do Aluno 1, menos o Aluno 1
SELECT cod_aluno, nome, cidade, ESTADO  FROM ALUNO
WHERE (cidade,ESTADO)  = (SELECT cidade,ESTADO  FROM ALUNO -- se comparar dois NO WHERE, tem que usar os dois NO sub SELECT 
				WHERE COD_ALUNO = 1)
AND COD_ALUNO != 1;

--Soma todos os itens, e mostra somente cujo o valor minimo seja maior que o valor medio dos cursos
SELECT cod_curso, MIN(valor), SUM(valor), COUNT(*) Qtde FROM ITEM 
WHERE COD_CURSO > 0
GROUP BY COD_CURSO -- GROUP BY onde nao tem função de grupo
HAVING min(valor) >= (SELECT avg(VALOR) FROM CURSO)
ORDER BY COD_CURSO;

--Soma totoal de contrato por aluno e mostra somente cujo o menor contrato seja maior que o valor medio de curso
SELECT cod_aluno, MIN(total), sum(total) FROM CONTRATO
GROUP BY COD_ALUNO 
HAVING min(TOTAL) > (SELECT avg(valor) FROM CURSO );

-- Todos os cursos que estao na tabela de item (vendidos)
SELECT cod_curso, nome, valor FROM CURSO 
WHERE COD_CURSO IN (SELECT COD_CURSO FROM ITEM);

--Todos os cursos que nao estao na tabela de item (nao vendidos)
SELECT cod_curso, nome, valor FROM CURSO 
WHERE COD_CURSO NOT IN (SELECT COD_CURSO FROM ITEM );

--Todos os cursos que foram vendidos pelo valor padrao
SELECT * FROM ITEM 
WHERE (COD_CURSO, VALOR) IN 
		(SELECT COD_CURSO, valor FROM CURSO );
	
-- SubConsulta na clasula From
SELECT i.cod_contrato, i.valor, i.cod_curso, c.cod_curso, c.valor FROM ITEM i, (SELECT cod_curso, valor FROM CURSO WHERE valor>500) c 
WHERE c.cod_curso = i.COD_CURSO ;




