--Quais cartas foram produzidas menos de 200 vezes?
SELECT nome FROM Carta WHERE qnt_produzida < 200;

--Quais grupos tem mais de 5 membros?
SELECT nome FROM Grupo WHERE tamanho > 5;

--Qual a habilidade da carta "cobra"?
SELECT nome FROM Habilidade 
WHERE id_habilidade = (SELECT id_habilidade FROM Carta_Habilidade 
WHERE id_habilidade = (SELECT id_carta FROM Carta WHERE nome = 'cobra'));

--Qual produto teve mais vendas totais? 
SELECT MAX(qnt_vendida), nome FROM Produto;

--Qual a carta com o maior ataque de cada deck? 
SELECT MAX(x.ataque), x.nome, (SELECT nome FROM Produto WHERE id_produto = z.id_produto)
FROM Carta AS x
INNER JOIN Deck AS z
ON z.id_deck = x.id_deck
GROUP BY x.id_deck;

--Qual loja vendeu o jogo Inscryption pelo menor preço?
SELECT MIN(x.preco), y.nome 
FROM Venda AS x
INNER JOIN Loja AS y
ON x.id_loja = y.id_loja
WHERE x.id_produto = (SELECT id_produto
                        FROM Produto 
                        WHERE nome = 'Inscryption');

--Quais os decks das cartas com custo menor que 2?
SELECT x.id_carta, x.custo, x.nome, (SELECT nome FROM Produto WHERE id_produto = z.id_produto)
FROM Carta AS x
INNER JOIN Deck AS z
ON z.id_deck = x.id_deck
WHERE x.custo < 2
ORDER BY x.id_deck;

--Qual o maior preço atribuído a um produto em uma venda feita por cada loja?
SELECT MAX(preco), id_loja
FROM Venda
GROUP BY id_loja;

--Qual o menor preço cobrado por cada tipo de loja?
SELECT MIN(preco), y.tipo
FROM Venda AS x
INNER JOIN Loja AS y
ON x.id_loja = y.id_loja
GROUP BY y.tipo;

--Qual a maior defesa entre as cartas de cada custo diferente?
SELECT MAX(defesa), custo
FROM Carta
GROUP BY custo;


