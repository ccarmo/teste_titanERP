#### Com base na tabela de “produtos” acima favor inserir um registro na referida tabela passando os seguintes valores : cod_prod =170, loj_prod=2, desc_prod=LEITE CONDESADO MOCOCA, dt_inclu_prod=30/12/2010  e preço_prod = R$45,40

``` 
INSERT INTO tb_produto VALUES (170, 2, 'LEITE CONDESADO MOCOCA', '2010-12-30', 45.40);
``` 

#### O Índice da tabela  de “produtos é o cód_prod e a loj_prod, com base no referido índice faça a alteração do preço do produto para R$95,40, lembrando que o cod_prod =170 e a loj_prod=2: 

``` 
UPDATE tb_produto SET preco_prod = 95.40 WHERE cod_prod = 170 AND loj_prod = 2;
``` 

#### Com base na tabela de “produtos” monte um select trazendo todos os registros da loja 1 e 2:

``` 
SELECT * FROM tb_produto WHERE loj_prod = 1 OR loj_prod = 2 ORDER BY loj_prod ASC;
``` 

#### Com base na tabela de “produtos” monte um select para trazer a maior e a menor data  de inclusão do produto “dt_inclu_prod”:

``` 
SELECT  DATE_FORMAT(MIN(dt_inclu_prod),'%d/%m/%Y') AS data_minima, DATE_FORMAT(MAX(dt_inclu_prod),'%d/%m/%Y') AS data_maxima FROM tb_produto;
``` 

#### Com base na tabela de “produtos” monte um select para trazer a quantidade total de registros existentes na tabela de “produtos”:

``` 
SELECT COUNT(cod_prod) AS total_prod FROM tb_produto;
``` 

#### Com base na tabela de “produtos” monte um select para trazer todos os produtos que comecem com a letra “L” na tabela de “produtos”:

```
SELECT * FROM tb_produto WHERE desc_prod LIKE 'L%';
```
#### Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizado por loja:

```
SELECT loj_prod AS codigo_loja, SUM(preco_prod) as total_valor FROM tb_produto GROUP BY loj_prod;
```

#### Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizados por loja que seja maior que R$100.000:

```
SELECT loj_prod AS codigo_loja, SUM(preco_prod) as total_valor FROM tb_produto WHERE preco_prod > 100.00 GROUP BY loj_prod;
```

#### A)Montar um unico select para trazer os seguintes campos: o código da loja do produto, a descrição da loja, código do produto, a descrição do produto, o preço do produto, a quantidade em estoque do produto. Considere  que o código da loja para esta consulta seja igual a 1.

```
SELECT tb_produto.loj_prod as codigo_loja, tb_loja.desc_loj as descricao_loja, tb_produto.cod_prod as codigo_produto, tb_produto.desc_prod as descricao_produto, tb_estoque.qtd_prod as quantidade_produto
FROM tb_produto
LEFT JOIN tb_loja    
ON tb_produto.loj_prod = tb_loja.loj_prod
LEFT JOIN tb_estoque
ON tb_produto.cod_prod = tb_estoque.cod_prod
WHERE tb_produto.loj_prod = 1;
```

#### B)Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de produtos que não existem na tabela de estoque.

```
SELECT *
FROM tb_produto
LEFT JOIN tb_estoque
ON tb_produto.cod_prod = tb_estoque.cod_prod
WHERE tb_estoque.cod_prod is NOT NULL
ORDER BY tb_produto.loj_prod ASC;
```

#### C)Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de estoque que não existem na tabela de produtos.

```
SELECT *
FROM tb_estoque
LEFT JOIN tb_prod
ON tb_prod.cod_prod = tb_estoque.cod_prod
WHERE tb_prod.cod_prod is NULL;
```
