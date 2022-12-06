--Exemplo 1
CREATE OR REPLACE FUNCTION consulta_preco(pCod_Curso NUMBER) RETURN NUMBER 
AS 
	vValor NUMBER;
BEGIN
	SELECT valor INTO vValor FROM Curso WHERE cod_curso = pCod_curso;

	RETURN (vValor);
END;

--Executando
DECLARE
	vCod NUMBER := 2;
	vValor NUMBER;
BEGIN
	vValor := consulta_preco(vCod);
	Dbms_Output.Put_Line('Preco do curso: '||vValor);
END;

--Exemplo 2
CREATE OR REPLACE FUNCTION existe_aluno(pCod_Aluno IN Aluno.COD_ALUNO%TYPE) RETURN boolean
IS 
	vAluno number(10);
BEGIN
	SELECT cod_aluno
	INTO vAluno
	FROM ALUNO 
	WHERE COD_ALUNO = pCod_aluno;
	RETURN(true);
EXCEPTION
	WHEN OTHERS THEN
		return(false);
END;

--Executando
DECLARE
	vCodigo integer := 34;
BEGIN
	IF existe_aluno(vCodigo) THEN
		Dbms_output.Put_Line('COdigo encontrado');
	ELSE
		Dbms_output.Put_Line('Codigo nao encontrado');
	END IF;
END;

--Exemplo 3 
CREATE OR REPLACE PROCEDURE cadastra_aluno
(
pCod_aluno in Aluno.COD_ALUNO%TYPE,
pNome IN Aluno.NOME%TYPE,
pCidade IN Aluno.CIDADE%TYPE,
pEstado IN Aluno.ESTADO%TYPE
)
IS 
BEGIN
	if( NOT existe_aluno(pCod_aluno)) THEN 
		INSERT INTO Aluno(cod_aluno,nome,cidade,estado) VALUES (pCod_Aluno,pNome,pCidade,pEstado);
		Dbms_output.Put_Line('Aluno Cadastrado com sucesso');
	ELSE
		Dbms_output.Put_Line('Codigo ja existe');
	END IF;
END;

--Executando
DECLARE
BEGIN
	cadastra_aluno(10,'Arthur','Mococa','SP');
	
END;

SELECT * FROM Aluno;

--Exemplo 4 - Função Pipelined
CREATE OR REPLACE TYPE reg_aluno AS OBJECT (codigo integer, nome varchar2(30), cidade varchar(30));

--Matriz, criando uma tabela a partir do objeto reg_aluno
CREATE OR REPLACE TYPE table_reg_aluno AS TABLE OF reg_aluno;

--Funcao
CREATE OR REPLACE FUNCTION get_aluno(pCodigo number) RETURN table_reg_aluno PIPELINED
IS 
	outLista reg_aluno;
	CURSOR csql IS
		SELECT alu.cod_aluno, alu.nome, alu.cidade FROM ALUNO alu
		WHERE alu.COD_ALUNO = pCodigo;
	reg csql%rowtype; -- criando uma variavel reg com o tipo do csql
BEGIN
	OPEN csql;
	FETCH csql INTO reg; -- pegar csql e jogar dentro do reg
	outlista := reg_aluno(reg.cod_aluno, reg.nome, reg.cidade); --outlista recebendo o cursor
	PIPE row(OUTLISTA); -- Escreve a linha
	CLOSE csql;
	RETURN;
END;

--Teste 
SELECT Alu.*, con.total FROM table(get_aluno(1)) Alu, CONTRATO con
WHERE con.COD_ALUNO = alu.codigo;







