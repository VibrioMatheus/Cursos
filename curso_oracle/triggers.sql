--Exemplo 1
DECLARE 
HORA varchar2(2);
h NUMBER;
BEGIN
	h := TO_NUMBER(to_char(sysdate,'HH24')); -- vai receber somente a hora (inteiro)
	Dbms_Output.Put_Line(H||'  '||to_char(sysdate, 'DAY'));
END;

--Exemplo 2
BEGIN
	if(to_char(sysdate, 'DAY') IN ('SÁBADO', 'DOMINGO') OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) THEN
	raise_application_error(-20001,'Fora do horário comercial');
	END IF;
END;


--Primeira Trigger serve para criarmos algo automatico apos o update, select, insert ou delete
CREATE OR REPLACE TRIGGER valida_horario_curso
BEFORE INSERT OR DELETE ON Contrato
BEGIN
	if(TO_CHAR(SYSDATE,'D')IN (1, 7) OR 
	TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))
	NOT BETWEEN 8 AND 18) THEN 
	raise_application_error(-20001,'Fora horário comercial');
	END IF;
END;

CREATE TABLE log (
usuario varchar2(30),
horario DATE,
valor_antigo varchar2(10),
valor_novo varchar2(10)
);

--Segunda trigger, trigger de log
CREATE OR REPLACE TRIGGER gera_log_alt
AFTER UPDATE OF total ON Contrato
DECLARE 
BEGIN 
	INSERT INTO log(Usuario, Horario) VALUES (USER,sysdate);
END;

UPDATE Contrato SET total = 5000 WHERE cod_contrato = 1;
SELECT * FROM log;

--Terceira trigger
CREATE OR REPLACE TRIGGER valida_horario_curso2
BEFORE INSERT OR UPDATE OR DELETE ON Contrato
BEGIN 
	if(TO_CHAR(sysdate,'D')IN (1, 7)OR
	TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))NOT BETWEEN 8 AND 18) THEN 
	if(inserting) THEN 
		raise_application_error(-20001,'Não pode inserir');
	elsif(deleting) THEN 
		raise_application_error(-20002,'Nao pode remover');
	elsif(updating('TOTAL')) THEN
		raise_application_error(-20003, 'Nao pode alterar total');
	ELSE
		raise_application_error(-20004, 'Nao pode alterar');
	END IF;
	END IF;
END;

--Teste
ALTER TRIGGER valida_horario_curso disable;

DELETE FROM CONTRATO;
UPDATE Contrato SET total = 5000 WHERE cod_contrato = 1;
INSERT INTO CONTRATO values(90,sysdate,10,1500,null);


--Quarta trigger
CREATE OR REPLACE TRIGGER audita_aluno
AFTER INSERT OR DELETE OR UPDATE ON ALUNO 
FOR EACH ROW -- Executa para cada linha afetada, sem o FOR EACH ROW executa uma vez só
BEGIN 
	if(deleting) THEN 
		INSERT INTO log(usuario,horario,obs) VALUES (USER,sysdate,'Linhas deletadas.');
	elsif(inserting) THEN
		INSERT INTO log(usuario,horario,obs) VALUES (USER,sysdate,'Linhas inseridas');
	elsif(updating('salario')) THEN
		INSERT INTO log VALUES (:OLD.nome,sysdate,:OLD.salario,:NEW.salario,'Alterado Salario');
	ELSE
		INSERT INTO log(usuario,horario,obs) VALUES (USER,sysdate,'Atualização Aluno.');
	END IF;
END;

--Teste
UPDATE Aluno SET salario = 2500;
SELECT * FROM log;

--Quinta trigger com a tabela de contrato para calcular comissao
CREATE OR REPLACE TRIGGER calc_comissao
BEFORE INSERT OR UPDATE OF total ON Contrato
REFERENCING OLD AS antigo NEW AS novo
FOR EACH ROW 
WHEN(novo.total >=5000)
DECLARE
	vComissao  NUMERIC(6,2) := 0.15;
BEGIN
	if(:novo.total <= 10000) THEN
		:novo.valor_comissao := :novo.total*(vComissao);
	ELSE
		:novo.valor_comissao := :novo.total*(vComissao+0.01);
	END IF;
END;

--Teste
INSERT INTO Contrato(cod_contrato,total) VALUES (34,6000);
INSERT INTO Contrato(cod_contrato,total) VALUES (35,12000);
SELECT * FROM CONTRATO;

--Sexta trigger com uso de view com trigger e dml
CREATE OR REPLACE VIEW vContratos_pares
AS SELECT cod_contrato, DATA, cod_aluno, desconto, total
FROM CONTRATO
WHERE mod(COD_CONTRATO,2) = 0;

CREATE OR REPLACE TRIGGER tri_contrato_pares
instead OF INSERT OR DELETE OR UPDATE ON vContratos_pares
DECLARE
BEGIN 
	INSERT INTO log(usuario,horario,obs) VALUES (USER,sysdate,'DML da View vContratos_pares');
END;

INSERT INTO vContratos_pares values(90,sysdate,10,NULL,5000);

SELECT * FROM log;






