USE COMERCIO_OLTP
GO

SELECT * FROM PRODUTO
GO

INSERT INTO PRODUTO VALUES( N'SAO PAULO / SALVADOR', N'3500.00',N'3100.00' ,N'9',N'36')
GO
/*
DELETE FROM PRODUTO = DML (APAGA SOMENTE OS REGISTROS) PERMITE REALIZAR ROOLBACK
 != DE UM PARA O OUTRO O DELETE N�O VAI ALTERAR O IDENTITY ATIVO NA TABELA INSERINDO ID DA SEQUENCIA
TRUNCATE TABLE PRODUTO = DDL MANIPULA A ESTRUTURA DOS DADOS ( APAGA A TABELA TODA)

TRABALHANDO COM TABELA DE AUTOREALCIONAMENTO ABAIX CRIAREMOS UMA CONSULTA ONDE TRAREMOS SEUS VENDEDORES COM SEUS RESPECTIVOS GERENTE PARA APRESENTA��O DO GERENTE.
*/
SELECT * FROM VENDEDOR
GO

SELECT IDVENDEDOR NOME, SEXO, NOME, SEXO, ID_GERENTE 
FROM [dbo].[VENDEDOR]
GO

SELECT IDVENDEDOR,
NOME AS GERENTE,
SEXO,
NOME AS VENDEDOR,
SEXO, ID_GERENTE 
FROM [dbo].[VENDEDOR]
GO

SELECT IDVENDEDOR,
NOME AS GERENTE,
SEXO,
NOME AS VENDEDOR,
SEXO, ID_GERENTE 
FROM [dbo].[VENDEDOR]
GO

SELECT V.IDVENDEDOR,
	V.NOME AS GERENTE,
	G.NOME AS VENDEDOR,
	G.ID_GERENTE
FROM VENDEDOR V
INNER JOIN VENDEDOR G
ON V.IDVENDEDOR = G.ID_GERENTE
GO

SELECT V.IDVENDEDOR,
	V.NOME AS GERENTE,
	G.NOME AS VENDEDOR,
	G.IDVENDEDOR
FROM VENDEDOR V
INNER JOIN VENDEDOR G
ON V.IDVENDEDOR = G.ID_GERENTE
GO

SELECT V.IDVENDEDOR,
	V.NOME AS GERENTE,
	G.NOME AS VENDEDOR,
	G.SEXO,
	G.IDVENDEDOR
FROM VENDEDOR V
INNER JOIN VENDEDOR G
ON V.IDVENDEDOR = G.ID_GERENTE
GO

/* 
REALLIZANDO CONCATENA��O NO SQLSERVER CONVERS�ES
*/

SELECT 'BUSINEES INTELIGENCE'

SELECT 'BUSINEES' +  ' ' + 'INTELIGENCE'

SELECT 10 + 10

SELECT '10' + 10

SELECT 'UNIDADOS' + 10
/*
RESULTADO= Mensagem 245, N�vel 16, Estado 1, Linha 81
Falha ao converter o varchar valor 'UNIDADOS' para o tipo de dados int.
*/

SELECT '10' + '10'

SELECT CONVERT(INT,'10') + CONVERT(INT, '10')

SELECT CONVERT(VARCHAR, CONVERT(INT,'10') + CONVERT(INT, '10')) + '30'

SELECT RAND()
/* 
ESSE COMANDO GERA NUMERO DO TIPO FLOAT, IREMOS UTILIZAR PAR ATRANSFORMA EM ITEIRO ABAIXO 
*/

SELECT CONVERT(INT, RAND())

SELECT TOP 1 * FROM CLIENTE

SELECT TOP 1 * FROM CLIENTE
ORDER BY
NEWID()

SELECT TOP 1 IDCLIENTE FROM CLIENTE
ORDER BY
NEWID()

SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO
ORDER BY
NEWID()

SELECT TOP 1 IDVENDEDOR FROM VENDEDOR
ORDER BY
NEWID()

SELECT RAND() * 52 --DIA MES ANO

/* PREENCHENDO A TABELA NOTAS FISCAIS */

DECLARE
	@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT, @DATA DATE
BEGIN
	SET @ID_CLIENTE = 
	(SELECT TOP 1 IDCLIENTE 
	FROM CLIENTE
	ORDER BY 	NEWID())
	SET @ID_VENDEDOR =
	(SELECT TOP 1 IDVENDEDOR 
	FROM VENDEDOR
	ORDER BY 	NEWID())
	SET @ID_FORMA =
	(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO
	ORDER BY NEWID())
	SET @DATA =	(SELECT
		CONVERT(DATE, CONVERT(VARCHAR(15), '2015-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 12)) + 1) + '-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 27)) + 1))))

INSERT INTO NOTA_FISCAL(ID_CLIENTE, ID_VENDEDOR, ID_FORMA, DATA) VALUES
(@ID_CLIENTE, @ID_VENDEDOR, @ID_FORMA, @DATA)
END
GO 8000

--MES
SELECT CONVERT(VARCHAR(5),(CONVERT(INT, RAND() *12 )) + 1 )
GO 15

-- DIA
SELECT CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 27)) + 1)

DECLARE
	@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT, @DATA DATE
BEGIN
	SET @ID_CLIENTE = 
	(SELECT TOP 1 IDCLIENTE 
	FROM CLIENTE
	ORDER BY 	NEWID())
	SET @ID_VENDEDOR =
	(SELECT TOP 1 IDVENDEDOR 
	FROM VENDEDOR
	ORDER BY 	NEWID())
	SET @ID_FORMA =
	(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO
	ORDER BY NEWID())
	SET @DATA =	(SELECT
		CONVERT(DATE, CONVERT(VARCHAR(15), '2016-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 12)) + 1) + '-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 27)) + 1))))

INSERT INTO NOTA_FISCAL(ID_CLIENTE, ID_VENDEDOR, ID_FORMA, DATA) VALUES
(@ID_CLIENTE, @ID_VENDEDOR, @ID_FORMA, @DATA)
END
GO 9100

DECLARE
	@ID_CLIENTE INT, @ID_VENDEDOR INT, @ID_FORMA INT, @DATA DATE
BEGIN
	SET @ID_CLIENTE = 
	(SELECT TOP 1 IDCLIENTE 
	FROM CLIENTE
	ORDER BY 	NEWID())
	SET @ID_VENDEDOR =
	(SELECT TOP 1 IDVENDEDOR 
	FROM VENDEDOR
	ORDER BY 	NEWID())
	SET @ID_FORMA =
	(SELECT TOP 1 IDFORMA FROM FORMA_PAGAMENTO
	ORDER BY NEWID())
	SET @DATA =	(SELECT
		CONVERT(DATE, CONVERT(VARCHAR(15), '2017-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 12)) + 1) + '-' +
		CONVERT(VARCHAR(5), (CONVERT(INT, RAND()* 27)) + 1))))

INSERT INTO NOTA_FISCAL(ID_CLIENTE, ID_VENDEDOR, ID_FORMA, DATA) VALUES
(@ID_CLIENTE, @ID_VENDEDOR, @ID_FORMA, @DATA)
END
GO 16000

/*GERAND OS ITENS DE NOTA */

DECLARE
	@ID_PRODUTO INT,
	@ID_NOTA_FISCAL INT,
	@QUANTIDADE INT,
	@VALOR NUMERIC(10,2),
	@TOTAL NUMERIC(10,2)

BEGIN
	SET @ID_PRODUTO = 
	(SELECT TOP 1 IDPRODUTO FROM PRODUTO ORDER BY NEWID())
	
	SET @ID_NOTA_FISCAL = 
	(SELECT TOP 1 IDNOTA FROM NOTA_FISCAL ORDER BY NEWID())

	SET @QUANTIDADE = 
	(SELECT ROUND(RAND() * 4 + 1, 0))

	SET @VALOR = 
	(SELECT VALOR FROM PRODUTO 
	WHERE IDPRODUTO = @ID_PRODUTO)

	SET @TOTAL = 
	@QUANTIDADE * @VALOR

	INSERT INTO ITEM_NOTA(ID_PRODUTO, ID_NOTA_FISCAL, QUANTIDADE, TOTAL)
	VALUES(@ID_PRODUTO, @ID_NOTA_FISCAL, @QUANTIDADE, @TOTAL)
END

GO 34200

/* 
CURSOR
� COMO UMA PROCEDURE
DECLARE
	@VARIAVEL
BEGIN
	INSERT INTO TABELA(NOME) VALUES(@VARIAVEL)
END
GO 
*/

DROP TABLE LIVROS
GO

CREATE TABLE LIVROS(
	IDLIVRO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30),
	VALOR DECIMAL(10,2)
)
GO

INSERT INTO LIVROS VALUES('SQL',100)
INSERT INTO LIVROS VALUES('JAVA',60)
INSERT INTO LIVROS VALUES('PYTHON',110)
INSERT INTO LIVROS VALUES('SPARK',190)
GO

SELECT * FROM LIVROS
GO
/*
--CRIANDO CURSOR

-- DECLARANDO VARAVEIS
DECLARE
	C_REG CURSOR FOR 
	SELECT NOME, VALOR FROM LIVROS
DECLARE
	@NOME VARCHAR(30),
	@PRECO DECIMAL(10,2)

OPEN C_REG

FETCH NEXT FROM C_REG
INTO @NOME, @PRECO

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'VALOR DO LIVRO ' + @NOME + ' R$ ' + CAST( @PRECO AS VARCHAR(10))

	FETCH NEXT FROM C_REG
	INTO @NOME, @PRECO

END
CLOSE C_REG
DEALLOCATE C_REG
GO
*/

USE COMERCIO_OLTP
GO

SELECT * FROM NOTA_FISCAL
GO

SELECT * FROM ITEM_NOTA
ORDER BY ID_NOTA_FISCAL
GO

SELECT IDNOTA FROM NOTA_FISCAL
WHERE IDNOTA NOT IN
(SELECT ID_NOTA_FISCAL 
FROM ITEM_NOTA)
ORDER BY 1
GO

/* -- APARTIR CURSOR PARA NOTAS SEM ITENS --
PODEMOS EXECUTAR DE 2 FORMAS 1� SELECIONANDO O CODIG E EXECUTANDO 
JA A 2� |||
		VVV

			'AP�S CRIADA A PROCEDURE ELA FICA ARMAZENADA EM DATABASE "COMERCIO_OLTP", PROGRAMA��O,PROCEDIMETNOS ARMAZENADOS.'
**********************************************************************************************
CREATE PROCEDURE CAD_NOTAS AS

DECLARE 

	C_NOTAS CURSOR FOR
	SELECT IDNOTA FROM NOTA_FISCAL
	WHERE IDNOTA NOT IN(
	SELECT ID_NOTA_FISCAL 
	FROM ITEM_NOTA
	)

DECLARE
	@IDNOTA INT,
	@ID_PRODUTO INT, 
	@TOTAL DECIMAL(10,2)

OPEN C_NOTAS

FETCH NEXT FROM C_NOTAS
INTO @IDNOTA

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @ID_PRODUTO = 
	(SELECT TOP 1 IDPRODUTO 
	FROM PRODUTO 
	ORDER BY NEWID())

	SET @TOTAL =
	(SELECT VALOR FROM PRODUTO 
	WHERE IDPRODUTO = 
	@ID_PRODUTO)

	INSERT INTO ITEM_NOTA(ID_PRODUTO, ID_NOTA_FISCAL, QUANTIDADE, TOTAL)
	VALUES(@ID_PRODUTO, @IDNOTA,1, @TOTAL)
FETCH NEXT FROM C_NOTAS
INTO @IDNOTA
	
END
CLOSE C_NOTAS
DEALLOCATE C_NOTAS
GO
************************************************************************************
PARA EXECUTAR A PROCEDURE VIA COMANDO  DESCRITO ABAIXO:
 EXEC CAD_NOTAS
 GO

************************************************************************************
 */

/* CRIANDO UMA VIEM DE ITEM_NOTA
Obs: n�o pode criar a view com o 'ORDER BY'
*/

 CREATE VIEW V_ITEM_NOTA AS
 SELECT ID_NOTA_FISCAL AS "NOTA FISCAL",
	PRODUTO,
	VALOR,
	QUANTIDADE,
	TOTAL AS "TOTAL DO ITEM"
FROM PRODUTO
INNER JOIN ITEM_NOTA
ON IDPRODUTO = ID_PRODUTO
--ORDER BY 1

SELECT * FROM V_ITEM_NOTA
ORDER BY 1
GO
/*
CRIANDO UMA VIEW DE UMA NOTA FISCAL E ALOCANDO O VALOR DO TOTAL.
COM OS SEGUINTES DADOS NOME, SOBRENOME, SEXO, DATA, IDNOTA, PRODUTO, TOTAL
*/
/*
SELECT C.NOME, C.SOBRENOME, C.SEXO, N.DATA, N.IDNOTA, PRODUTO, N.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO =I.ID_PRODUTO
ORDER BY 5
GO

SELECT ID_NOTA_FISCAL, SUM(TOTAL) 
AS SOMA
FROM ITEM_NOTA
GROUP BY ID_NOTA_FISCAL
ORDER BY 1
GO
*/

CREATE VIEW V_NOTA_FISCAL AS
SELECT ID_NOTA_FISCAL, SUM(TOTAL) 
AS SOMA
FROM ITEM_NOTA
GROUP BY ID_NOTA_FISCAL
GO

SELECT * FROM V_NOTA_FISCAL
ORDER BY 1

CREATE VIEW V_CARGA_NF AS
SELECT N.IDNOTA, N.TOTAL TOTALNOTA, I.SOMA
FROM NOTA_FISCAL N
INNER JOIN V_NOTA_FISCAL I
ON IDNOTA = ID_NOTA_FISCAL
GO

SELECT * FROM V_CARGA_NF
ORDER BY 1
GO

UPDATE V_CARGA_NF SET TOTALNOTA = SOMA
GO

/************************************************************************************
CRIANDO  UM RELATORIO
*/
/*
SELECT C.NOME, C.SOBRENOME,	C.SEXO, N.DATA, N.IDNOTA, P.PRODUTO, N.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = I.ID_PRODUTO
ORDER BY 5
GO
*/

CREATE VIEW V_RELATORIO_OLTP AS
SELECT C.NOME, C.SOBRENOME,	C.SEXO, N.DATA, N.IDNOTA, P.PRODUTO, N.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = I.ID_PRODUTO
GO

SELECT * FROM V_RELATORIO_OLTP
GO

/* CONSTRAINT EXEMPLIFICA��O 

CREATE DATABASE EXEMPLO
GO
 
USE EXEMPLO
GO

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL
)
GO

DROP TABLE TELEFONE
GO

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY,
	TIPO CHAR(3),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT
)
GO

INSERT INTO CLIENTE VALUES('JOAO')
INSERT INTO CLIENTE VALUES('KITERIA')
INSERT INTO CLIENTE VALUES('ADELAIDE')
INSERT INTO CLIENTE VALUES('JOSE')
INSERT INTO CLIENTE VALUES('MARIA')
INSERT INTO CLIENTE VALUES('ANA')
GO

SELECT * FROM CLIENTE
GO

INSERT INTO TELEFONE VALUES(124,'RES', '9987-8787',1)
INSERT INTO TELEFONE VALUES(365,'CEL', '8876-7875',2)
INSERT INTO TELEFONE VALUES(324,'CEL', '6453-7789',1)
INSERT INTO TELEFONE VALUES(856,'RES', '7354-9878',4)
INSERT INTO TELEFONE VALUES(896,'COM', '9826-0098',3)
INSERT INTO TELEFONE VALUES(326,'COM', '7896-9098',2)
INSERT INTO TELEFONE VALUES(156,'RES', '9983-0376',5)
INSERT INTO TELEFONE VALUES(765,'COM', '8836-3782',5)
GO

SELECT * FROM TELEFONE
GO

SELECT NOME, TIPO, NUMERO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON IDCLIENTE = ID_CLIENTE
GO
/* 
QUANDO REALIZAER LEFT OU RIGHT JOIN
EM CASOS QUE A TABELA MAIOR TENHA DADOS A MAIS COMO NO EXEMPPLO ABAIXO A TABELA CLIENTE TINHA MAIS REGISTRO QUE A TABELA TELEFONE
*/

SELECT NOME, TIPO, NUMERO
FROM CLIENTE C
LEFT JOIN TELEFONE T
ON IDCLIENTE = ID_CLIENTE
GO

INSERT INTO TELEFONE VALUES(609,'RES', '5409-0987',10)
INSERT INTO TELEFONE VALUES(520,'COM', '8906-0007',10)
GO

SELECT * FROM TELEFONE
GO

SELECT NOME, TIPO, NUMERO
FROM CLIENTE C
RIGHT JOIN TELEFONE T
ON IDCLIENTE = ID_CLIENTE
GO

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE
FOREIGN KEY (ID_CLIENTE) 
REFERENCES CLIENTE(IDCLIENTE)
GO

DELETE FROM TELEFONE
WHERE ID_CLIENTE = 10
GO

ALTER TABLE TELEFONE DROP CONSTRAINT FK_TELEFONE
GO
************************************************************************************
*/

SELECT * FROM VENDEDOR
GO
/*
DROP TABLE VENDEDOR
GO
*/

ALTER TABLE VENDEDOR ADD CONSTRAINT FK_GERENTE
FOREIGN KEY(ID_GERENTE) REFERENCES VENDEDOR(IDVENDEDOR)
GO

ALTER TABLE NOTA_FISCAL ADD CONSTRAINT FK_NOTA_CLIENTE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
GO

ALTER TABLE NOTA_FISCAL ADD CONSTRAINT FK_NOTA_VENDEDOR
FOREIGN KEY(ID_VENDEDOR) REFERENCES VENDEDOR(IDVENDEDOR)
GO

ALTER TABLE ITEM_NOTA ADD CONSTRAINT FK_ITEM_PRODUTO
FOREIGN KEY(ID_PRODUTO) REFERENCES PRODUTO(IDPRODUTO)
GO

ALTER TABLE ITEM_NOTA ADD CONSTRAINT FK_ITEM_NOTAFISCAL
FOREIGN KEY(ID_NOTA_FISCAL) REFERENCES NOTA_FISCAL(IDNOTA)
GO

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_FORNECEDOR
FOREIGN KEY(ID_FORNECEDOR) REFERENCES FORNECEDOR(IDFORNECEDOR)
GO

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_CATEGORIA
FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA)
GO

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERCO_CLIENTE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
GO

ALTER TABLE NOTA_FISCAL ADD CONSTRAINT FK_NOTA_FORMA
FOREIGN KEY(ID_FORMA) REFERENCES FORMA_PAGAMENTO(IDFORMA)
GO

--ABERTO POR ITEM
SELECT C.NOME + ' ' + C.SOBRENOME AS CLIENTE,
C.SEXO AS SEXO_CLIENTE,
P.PRODUTO AS PRODUTO,
CA.NOME AS CATEGORIA,
N.IDNOTA AS NOTA_FISCAL,
N.DATA AS DATA_NOTA,
QUANTIDADE,
VALOR AS PRECO_PRODUTO,
I.TOTAL AS TOTAL_ITEM,
N.TOTAL AS TOATAL_NOTA,
FP.FORMA AS FORMA_PAGAMENTO
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN FORMA_PAGAMENTO FP
ON IDFORMA = ID_FORMA
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_PRODUTO
INNER JOIN CATEGORIA CA
ON IDCATEGORIA =  ID_CATEGORIA
ORDER BY 5
GO

-- ABERTO POR NOTA
SELECT C.NOME, C.SOBRENOME, C.SEXO, N.DATA, N.IDNOTA, N.TOTAL, FP.FORMA
FROM CLIENTE C
INNER JOIN NOTA_FISCAL N
ON C.IDCLIENTE = N.ID_CLIENTE
INNER JOIN FORMA_PAGAMENTO FP
ON IDFORMA = ID_FORMA
INNER JOIN ITEM_NOTA I
ON N.IDNOTA = I.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = I.ID_PRODUTO
ORDER BY 5
GO
-----------------------------------------------------------------------------------------
CREATE DATABASE COMERCIO_STAGE
GO
-----------------------------------------------------------------------------------------
USE COMERCIO_STAGE
GO
-----------------------------------------------------------------------------------------
-- TODO 'POR' � CANDIDATO A SER UMA DIMENS�O

--CLIENTE

-- VENDEDOR

-- CATEGORIA

-- FORNECEDOR

-- PRODUTO

-- FORMA PAGAMENTO
-- REGIAO

--FATO --S�O AS MEDIDAS DO NEGOCIO

-- TOTAL
-- QUANTIDADE
-- LUCRO
-- CUSTO

CREATE TABLE ST_CLIENTE(
	IDCLIENTE INT DEFAULT NULL,
	NOME VARCHAR(100) DEFAULT NULL,
	SEXO VARCHAR(20) DEFAULT NULL,
	NASCIMENTO DATE DEFAULT NULL,
	CIDADE VARCHAR(100) DEFAULT NULL,
	ESTADO VARCHAR(10) DEFAULT NULL,
	REGIAO VARCHAR(20) DEFAULT NULL
)
GO

CREATE TABLE ST_VENDEDOR(
	IDVENDEDOR INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL,
	SEXO VARCHAR(20) DEFAULT NULL,
	IDGERENTE INT DEFAULT NULL
)
GO

CREATE TABLE ST_CATEGORIA(
	IDCATEGORIA INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL
)
GO

CREATE TABLE ST_FORNECEDOR(
	IDFORNECEDOR INT DEFAULT NULL,
	NOME VARCHAR(100) DEFAULT NULL 
)
GO

CREATE TABLE ST_PRODUTO(
	IDPRODUTO INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL,
	VALOR_UNITARIO NUMERIC(10,2) DEFAULT NULL,
	CUSTO_MEDIO NUMERIC(10,2) DEFAULT NULL,
	ID_CATEGORIA INT DEFAULT NULL
)
GO

CREATE TABLE ST_NOTA(
	IDNOTA INT DEFAULT NULL
)
GO

CREATE TABLE ST_FORMA(
	IDFORMA INT DEFAULT NULL,
	FORMA VARCHAR(50) DEFAULT NULL
)
GO

CREATE TABLE ST_FATO(
	IDCLIENTE INT DEFAULT NULL,
	IDVENDEDOR INT DEFAULT NULL,
	IDPRODUTO INT DEFAULT NULL,
	IDFORNECEDOR INT DEFAULT NULL,
	IDNOTA INT DEFAULT NULL,
	IDFORMA INT DEFAULT NULL,
	QUANTIDADE INT DEFAULT NULL,
	TOTAL_ITEM NUMERIC(10,2) DEFAULT NULL,
	DATA DATE DEFAULT NULL,
	CUSTO_TOTAL NUMERIC(10,2) DEFAULT NULL,
	LUCRO_TOTAL NUMERIC(10,2) DEFAULT NULL
)
GO
------------------------------------------------------------------------------------------
USE COMERCIO_OLTP
GO

-- NO INTEGRATION SERVICES
ALTER TABLE [dbo].[ST_CLIENTE]
	ADD EMAIL VARCHAR (100)
GO

CREATE DATABASE BI_ERROR
GO

-- 22/05/2023
-- APLICANDO REGRA CAMEL CASE NO INTEGRATION PARA IMPLEMENTAR O ETL E OS CONTAINERES DE CARREGAMENTO

CREATE PROCEDURE CAMEL_CASE AS
DECLARE C_NOMES CURSOR FOR
SELECT IDPRODUTO, NOME
FROM ST_PRODUTO

DECLARE @IDPRODUTO INT,
		@PALAVRA VARCHAR(50),
	    @STRINGTOTAL VARCHAR(5000),
		@INICIO INT,
		@FIM INT	

OPEN C_NOMES
FETCH NEXT FROM C_NOMES INTO
@IDPRODUTO,@PALAVRA

WHILE @@FETCH_STATUS = 0

BEGIN
	  --ARMAZENA O NOME DO PRODUTO
	  SET @PALAVRA = LOWER(@PALAVRA)
	  -- VARIAVEL INNICIO = 2 PORQUE A PRIMEIRA LETRA JA VIRA COMO MAIUSCULA
      SET @INICIO = 2
	  -- VARIAVEL FIM = AO TAMANHO DA PALAVRA
      SET @FIM = LEN(@PALAVRA)
	  -- STRINGTOTAL RECEBE A PRIMEIRA LETRA DA PALAVRA EM CAIXA BAIXA
      SET @STRINGTOTAL = UPPER(LEFT(@PALAVRA,1))
	  
	  WHILE @INICIO <= @FIM
		
		BEGIN
				-- COMPARA COM '"VAZIO"' PARA SETAR QUE A PALAVRA ACABOU
				IF SUBSTRING(@PALAVRA,@INICIO,1) = ' '
				BEGIN 
					SELECT @INICIO = @INICIO + 1
					SELECT @STRINGTOTAL = @STRINGTOTAL + ' ' + 
					UPPER(SUBSTRING(@PALAVRA,@INICIO,1))
				END
				ELSE
				BEGIN
					SELECT @STRINGTOTAL = @STRINGTOTAL + 
					SUBSTRING(@PALAVRA,@INICIO,1)
				END
				
				SELECT @INICIO = @INICIO + 1
		END
		
		UPDATE ST_PRODUTO SET NOME = @STRINGTOTAL
		WHERE IDPRODUTO = @IDPRODUTO

		FETCH NEXT FROM C_NOMES INTO
		@IDPRODUTO,@PALAVRA

END
CLOSE C_NOMES
DEALLOCATE C_NOMES
GO

SELECT LEN(NOME) FROM ST_PRODUTO
WHERE IDPRODUTO = 1
GO