
SELECT NOME, IDNOTA, DATA, IDITEMNOTA, PRODUTO, VALOR, QUANTIDADE, N.TOTAL
FROM CLIENTE
INNER JOIN NOTA_FISCAL N
ON IDCLIENTE = ID_CLIENTE
INNER JOIN ITEM_NOTA
ON ID_NOTA_FISCAL = IDNOTA
INNER JOIN PRODUTO
ON IDPRODUTO = ID_PRODUTO
ORDER BY 2
GO

SELECT * FROM ITEM_NOTA 

SELECT * FROM NOTA_FISCAL