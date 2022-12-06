--Exemplo 1 - Criando a Procedure
CREATE OR REPLACE PROCEDURE aumenta_precoCurso(pCod_Curso NUMBER)
IS
	-- Variaveis se tivesse
BEGIN 
	UPDATE CURSO SET
	VALOR = VALOR * 1.1 -- Aumentar em 10% o valor do curso
	WHERE COD_CURSO = pCod_curso;
END;

SELECT * FROM curso;

--Executando a procedure
EXECUTE aumenta_precoCurso(1);

--Executando como bloco anonimo
DECLARE
	vCod integer := 1;
BEGIN
	aumenta_precoCurso(vCod);
END;

--Exemplo 2 - Criando outra Procedure com OUT (OUT --> Tem que obrigatoriamente devolver variáveis como diz no parametro)
CREATE OR REPLACE PROCEDURE Consulta_Aluno
--Parametros
( 
pCodigo IN Aluno.cod_aluno%TYPE,
pNome OUT Aluno.nome%TYPE,
pCep OUT Aluno.CEP%TYPE,
pCidade OUT Aluno.CIDADE%type
)
IS 
BEGIN 
	SELECT nome,cep,cidade
	into pNome, pCep, pCidade
	FROM Aluno
	WHERE cod_aluno = pCodigo;
END;


--Executando a procedure
DECLARE
	vNome varchar2(30);
	vCidade varchar(30);
	vCep varchar(10);
	vCod integer := 1;
BEGIN
	Consulta_Aluno(vCod,vNome,vCep,vCidade); --Como temos variaveis do tipo OUT vamos ter retorno
	
	Dbms_output.Put_Line(vNome);
	Dbms_output.Put_Line(vCidade);
	Dbms_output.Put_Line(vCep);
END;

--Exemplo 3 - Procedure usando cursor e record (boa qndo tivermos muitas informações)
CREATE OR REPLACE PROCEDURE Consulta_Aluno2(pRegistro IN OUT Aluno%RowType)
IS 
	CURSOR csql IS 
		SELECT * FROM Aluno WHERE cod_aluno = pRegistro.cod_aluno;
BEGIN
	OPEN csql;
	FETCH csql INTO pRegistro;
	CLOSE csql;
END;

--Executando
DECLARE
	registro Aluno%rowType;
BEGIN
	registro.cod_aluno := 1;
	consulta_Aluno2(registro);
	Dbms_output.Put_Line(registro.nome);
	Dbms_output.Put_Line(Registro.cidade||' Cep: '||registro.cep);
END;

--Exemplo 4 - Formata Numero 
CREATE OR REPLACE PROCEDURE formata_numero(pTelefone IN OUT varchar2)
IS 
BEGIN 
	pTelefone := substr(pTelefone,1,4) || '-' || substr(pTelefone,5,4);
END;

--Executando
DECLARE 
	vTelefone varchar2(20);
BEGIN
	vTelefone := '12345678';
	formata_numero(vtelefone);
	Dbms_Output.Put_Line(vTelefone);
END;






