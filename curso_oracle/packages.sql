--Especificação ou Declaração 
CREATE OR REPLACE PACKAGE pkg_Aluno
IS 
	vCidade varchar2(30); -- Variaveis publicas
	vMedia NUMBER(8,2); -- Variaveis publicas
	vNome varchar2(30); -- Variaveis publicas
	PROCEDURE deleta_aluno(pCod_aluno number);
	PROCEDURE media_contratos;
	PROCEDURE con_aluno(pCod_aluno number);
END;

-- Corpo
CREATE OR REPLACE PACKAGE BODY pkg_aluno -- Corpo
IS 
--Variaveis locais
vTeste varchar(20);
--************************
PROCEDURE media_contratos
IS
BEGIN
	vTeste := 'teste';
	SELECT avg(total) INTO vMedia FROM CONTRATO;
END;
--**************************
PROCEDURE con_aluno(pCod_aluno NUMBER)
IS
BEGIN
	vNome := '';
	SELECT nome INTO vNome FROM ALUNO
	WHERE COD_ALUNO = pCod_aluno;
EXCEPTION
	WHEN no_data_found THEN
		Dbms_output.Put_Line('Aluno nao existe');
END;
--*******************************
PROCEDURE deleta_aluno(pCod_aluno number)
IS
BEGIN
	con_aluno(pCod_aluno);
	IF LENGTH(vNome) > 0 THEN
		DELETE FROM Aluno WHERE COD_ALUNO = pcod_aluno;
		Dbms_output.Put_Line(vNome||'->Excluido');
	END IF;
END;
END;

--Testando
DECLARE
	m NUMBER;
BEGIN
	pkg_aluno.media_contratos; -- executa a PROCEDURE
	m := pkg_aluno.vMedia;
	Dbms_output.Put_Line('Média: '||m);
END;
