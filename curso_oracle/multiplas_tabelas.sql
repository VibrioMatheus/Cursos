SELECT * FROM desconto;

SELECT * FROM CONTRATO c;

SELECT c.cod_contrato AS Contrato, d.classe AS Desconto FROM CONTRATO c , Desconto d
WHERE nvl(c.DESCONTO,0) BETWEEN d.inferior AND d.superior -- desconto entre inferior e superior
ORDER BY c.COD_CONTRATO;

--Select de duas tabelas (a mesma tabela)
SELECT c.nome AS Curso, pre_req.Nome AS Pre_Requisito
FROM Curso c, Curso pre_req
WHERE c.PRE_REQ = PRE_REQ.COD_CURSO (+); -- (+) trás até AS infos com null