--Criando o database link com usuario system
CREATE DATABASE LINK curso_link
CONNECT TO Matheus IDENTIFIED BY "123"
USING 'xe';

SELECT * FROM Aluno@curso_link;

--Muito Util para pegar informações de um banco que preciso