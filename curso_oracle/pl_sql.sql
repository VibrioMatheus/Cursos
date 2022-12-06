--Declaração de bloco anonimo
DECLARE
	x integer;
	y integer;
	c integer;
BEGIN
	x := 10;
	y := 20;
	c := x + y;
	Dbms_output.put_line('Resultado: '||c);
END;

--Exemplo 2 - com tabela
DECLARE 
	Desconto number(6,2) := 0.50;
	Cidade varchar(30) := 'Novo Hamburgo';
	vcod_aluno Aluno.cod_aluno%TYPE := 6;
	total number(8,2) := 1345.89;
BEGIN
	total := round(total * desconto, 2);
	Dbms_output.put_line('Total: '|| total);
	Desconto := 1.20;
	cidade := initCap(cidade);
	Dbms_output.put_line('Cidade: '||cidade);
	Dbms_output.put_line('Desconto: '||desconto);
	Dbms_output.put_line('Aluno: '||vcod_auno);
END;

--Exemplo 3 - com if
DECLARE 
	Preco1 number(8,2) := 10;
	Preco2 number(8,2) := 20;
	Flag boolean;
BEGIN
	Flag := (Preco1>Preco2);
	if(Flag=true) THEN
		Dbms_output.put_line('Verdadeiro');
	ELSE
		Dbms_output.put_line('Falso');
	END IF; -- Fim do IF
	
	if(Preco1>preco2) THEN
		Dbms_output.put_line('Preco1 é maior');
	ELSE
		Dbms_output.put_line('Preco2 é maior');
	END IF;
END;

--Exemplo 4 - Bind Variable

DECLARE
	vdesconto2 NUMBER;
	vcod_aluno NUMBER := 2;
BEGIN
	Dbms_output.put_line('desconto 2: '||:vdesconto2);
	UPDATE CONTRATO SET
	total = total * :vdesconto2
	WHERE cod_aluno = vcod_aluno;
END;

-- Exemplo 5 - Aninhamento
DECLARE 
	vTeste varchar(10) := 'Jose';
BEGIN
	DECLARE
	vTeste varchar(10) := 'Pedro';
	BEGIN
		Dbms_output.put_line(vteste);
	END;
	Dbms_output.put_line(vteste);
END;

---------------------------------------------------- SELECT EM PL_SQL --------------------

--Exemplo 1
DECLARE 
	vValor number(8,2);
	vNome varchar2(30);
BEGIN
	SELECT valor, nome
	INTO Vvalor, vNome -- valor vai para a Vvalor e o nome para a vNome
	FROM CURSO
	WHERE cod_curso = 2;
	
	Dbms_output.put_line('Valor: '|| TO_char(vValor,'fm9999.99'));
	Dbms_output.put_line('Curso: '|| INITCAP(vNome));
END;

--Exemplo 2
DECLARE 
	vDt_compra Contrato.DATA%TYPE;
	vDt_curso Contrato.DATA%TYPE;
BEGIN
	SELECT DATA, DATA+10
	INTO vDt_compra, vDt_curso
	FROM Contrato 
	WHERE cod_contrato = 5;
	Dbms_output.put_line('Data compra: '||vDt_compra);
	Dbms_output.put_line('Data curso: '||vDt_curso);
	
END;

--Exemplo 3 - Manipulando dados

SELECT max(cod_contrato) FROM Contrato;
CREATE SEQUENCE seq_contrato START WITH 8;

DECLARE 
	vCod Contrato.cod_contrato%TYPE;
BEGIN
	SELECT seq_contrato.nextval
	INTO vCod FROM Dual;

INSERT INTO Contrato(cod_contrato, DATA, cod_aluno, desconto) values(vCod, sysdate, 2, null);

Dbms_output.put_line('Criado contrato: '||vCod);
END;

SELECT * FROM CONTRATO;

-- Exemplo 4 - UPDATE 
DECLARE 
	vValor Curso.Valor%TYPE := 3000;
BEGIN
	UPDATE Curso SET 
	valor = valor - vValor
	WHERE CARGA_HORARIA >= 30;
END;

-- Exemplo 5 - DELETE 
DECLARE
	vContrato Contrato.cod_contrato%TYPE := 4;
BEGIN 
	DELETE FROM Contrato
	WHERE COD_CONTRATO = vContrato;
END;

-- Erro No_Data_Found
-- Exemplo 6 - Select into que nao encontra registros
DECLARE
	vdt_compra Contrato.DATA%TYPE;
	vTotal Contrato.total%TYPE;
	vDt_atual DATE := sysdate;
BEGIN
	SELECT DATA, total
	INTO vdt_compra, vTotal
	FROM CONTRATO
	WHERE DATA = vdt_atual;
END;

-- Exemplo 7 
DECLARE 
	vContrato NUMBER := 2;
	vTexto varchar2(50);
BEGIN
	UPDATE CONTRATO SET 
	desconto = desconto + 2
	WHERE COD_CONTRATO >= VContrato;

	--Retorna a qtde de registros afetados pelo comando sql
	vTexto := SQL%ROWCOUNT;

	Dbms_Output.Put_line(vtexto|| ' linhas atualizadas.');
END;




-------------------------- ESTRUTURAS DE CONTROLE -------------------------------------------

--Laço de repetição 
DECLARE 
	vContador integer := 0;
BEGIN 
	LOOP 
		vContador := vContador + 1;
		Dbms_Output.Put_line(vContador);
		EXIT WHEN vContador = 10;
	END LOOP;
	Dbms_Output.Put_line('Fim do LOOP');
END;

--For loop --> mais indicado para laços em tabelas
DECLARE 
	vContador integer;
BEGIN
	FOR vContador IN 1..10
	LOOP
		Dbms_Output.Put_line(vContador);
		
	END LOOP;
	Dbms_Output.Put_line('Fim do FOR');
END;

--While Loop
DECLARE
	vContador integer := 0;
	vTexto varchar(10);
BEGIN 
	WHILE vContador < 10
	LOOP
		vContador := vContador + 1;
		if(vContador MOD 2)=0 THEN
			vTexto := 'Par';
		ELSE
			vTexto := 'Impar';
		END IF;
		Dbms_Output.Put_line(vContador|| ' -> '||vTexto);
	END LOOP;
	
END;


------------------------------------- RECORD E COLLECTION ------------------------------------------

--Record (é tipo um struct)
DECLARE
	TYPE rec_aluno IS RECORD
	(   cod_aluno number NOT NULL := 0,
		nome Aluno.Nome%TYPE,
		cidade aluno.cidade%type
	);

	Registro rec_aluno; -- criando variavel do tipo rec_aluno
BEGIN
	registro.cod_aluno := 50;
	registro.nome := 'Master';
	registro.cidade := 'Novo Hamburgo';
	Dbms_Output.Put_line('Codigo: '||registro.cod_aluno);
	Dbms_Output.Put_line(' Nome: '||registro.nome);
	Dbms_Output.Put_line('Cidade: '||registro.cidade);
END;

--Mais um exemplo de Record
DECLARE
	reg Aluno%ROWTYPE; --RECORD (reg esta recebendo a estrutura de aluno)
	vcep varchar(10) := '98300000';
BEGIN
	SELECT cod_aluno, nome, cidade
	INTO reg.cod_aluno, reg.nome, reg.cidade
	FROM ALUNO 
	WHERE cod_aluno = 1;

	reg.cep := '93500000';
	reg.salario := 1500;

	Dbms_Output.Put_line('Codigo: '||reg.cod_aluno);
	Dbms_Output.Put_line('Nome: '||reg.nome);
	Dbms_Output.Put_line('Cidade: '||reg.cidade);
	Dbms_Output.Put_line('Cep: '||reg.cep);
	Dbms_Output.Put_line('Salario: '||reg.salario);
END;

--Exemplo de matriz
DECLARE
	TYPE t_aluno IS TABLE OF Aluno.nome%TYPE
	INDEX BY BINARY_INTEGER; -- Matriz
	
	registro t_aluno; -- RECORD
BEGIN
	Registro(1) := 'Marcio';
	Registro(2) := 'Jose';
	Registro(3) := 'Pedro';
	dbms_Output.Put_line('Nome 1: '||registro(1));
	Dbms_Output.Put_line('Nome 2: '||registro(2));
	Dbms_Output.Put_line('Nome 3: '||registro(3));
END;

--Exemplo de matriz
DECLARE 
	TYPE tipo IS TABLE OF varchar2(30) INDEX BY varchar2(2);
	uf_capital tipo;
BEGIN
	uf_capital('RS') := 'Porto Alegre';
	uf_capital('RJ') := 'Rio de Janeiro';
	uf_capital('PR') := 'Curitiba';
	uf_capital('MT') := 'Cuiaba';
	Dbms_Output.Put_line(uf_capital('RS'));
	Dbms_Output.Put_line(uf_capital('RJ'));
	Dbms_Output.Put_line(uf_capital('PR'));
	Dbms_Output.Put_line(uf_capital('MT'));
END;

--Exemplo de array
DECLARE
	TYPE nome_varray IS VARRAY(5) OF Aluno.nome%TYPE;
 	nome_vetor nome_varray := nome_varray();
 BEGIN
	 nome_vetor.Extend;
	nome_vetor(1) := 'Marcio';
	Dbms_Output.Put_line(nome_vetor(1));
END;


----------------------------------------- CURSORES ----------------------------------------------------

--Exemplo 1
DECLARE
	vCod_aluno Aluno.cod_aluno%TYPE;
	vNome Aluno.nome%TYPE;

	CURSOR c1 IS -- criação do cursos
		SELECT cod_aluno, nome
		FROM Aluno;
BEGIN
	OPEN c1; -- abrindo cursor
	LOOP
		FETCH c1 INTO vCod_aluno, vNome;
		EXIT WHEN c1%rowCount > 10 OR c1%notfound;
		Dbms_Output.Put_line('Codigo: '|| Lpad(vcod_aluno,4,'0')||' - '||'Nome: '||vNome);
	END LOOP;
	CLOSE c1; -- fechando cursor
END;

-- Exemplo Record com Cursor
DECLARE
	CURSOR c1 IS
		SELECT * FROM Aluno;
	reg c1%rowtype; -- RECORD do tanto que linha que veio do aluno
BEGIN
	OPEN c1;
LOOP
	FETCH c1 INTO reg;
	EXIT WHEN c1%rowcount > 10 OR c1%notfound;
	Dbms_Output.Put_line('Codigo: '||Lpad(reg.cod_aluno,5,'0')||'-'||'Nome: '||reg.nome);
END LOOP;
CLOSE c1;
END;

--Exemplo com FOR (mais aconselhada)
DECLARE
	CURSOR c1 IS
		SELECT * FROM Aluno;
	reg Aluno%rowtype; 
BEGIN
	FOR reg IN c1
LOOP
	Dbms_Output.Put_line('Codigo: '||Lpad(reg.cod_aluno,5,'0')||'-'||'Nome: '||reg.nome);
END LOOP;
END;
----------------------------------------------------------------------------------------------

-- QUando o select for pequeno, é interessante fazer ele dentro de um for
DECLARE 
	reg Aluno%rowtype;
BEGIN
	FOR reg IN (SELECT * FROM Aluno)
	LOOP
		Dbms_Output.Put_line('Codigo: '||Lpad(reg.cod_aluno,5,'0')||'-'||'Nome: '||reg.nome);
	END LOOP;
	
END;

-- Cursor com parametro exemplo
DECLARE 
	CURSOR c1 (pCod_aluno number) IS
	SELECT *
	FROM Aluno
	WHERE cod_aluno = pCod_aluno
	FOR UPDATE OF nome NOWAIT; -- bloquea a coluna nome para alteração
	Reg c1%rowtype;
BEGIN
	OPEN c1(4);
	FETCH c1 INTO reg;
	Dbms_Output.Put_line('Codigo: '||Lpad(reg.cod_aluno,5,'0')||'-'||'Nome: '||reg.nome);
	CLOSE c1; -- libera o registro para alteração
END;

 
---------------------------------- TRATAMENTO DE EXCEÇÕES (ERROS) --------------------------------------------

--Exemplo 1
DECLARE 
	vCod Aluno.cod_aluno%TYPE := 5662;
	vCidade ALuno.cidade%TYPE;
	x NUMBER;
BEGIN
	SELECT cidade INTO vCidade
	FROM ALUNO
	WHERE cod_aluno = vCod;
	x := 0/0;
	Dbms_Output.Put_Line('Cidade: '||vCidade);
EXCEPTION
	WHEN no_data_found THEN
		raise_application_error(-20001,'Aluno Inexistente!'||sqlcode||''||sqlerrm);
	WHEN too_many_rows THEN
		raise_application_error(-20002,'Registro Duplicado!'||sqlcode||''||sqlerrm);
	WHEN others THEN
		raise_application_error(-20002,'Exceção Desconhecida!'||sqlcode||''||sqlerrm);
END;

--Exemplo 2
DECLARE
	vDt_vencimento DATE;
	vConta NUMBER := 100; --codigo da conta
	eConta_vencida EXCEPTION;
BEGIN
	SELECT vencimento INTO vDt_vencimento
	FROM contas WHERE codigo = vConta;

	IF vdt_vencimento < trunc(sysdate) THEN
		raise eConta_vencida;
	END IF;

EXCEPTION
	WHEN eConta_vencida THEN
		dbms_output.put_line('Conta vencida');
	UPDATE contas SET valor = valor + juros
	WHERE codigo = vConta;
	
END;

SELECT * FROM contas;













