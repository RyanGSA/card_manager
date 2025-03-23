CREATE TABLE Produto
(
  id_produto INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  qnt_vendida INT NOT NULL,
  qnt_produzida INT NOT NULL,
  PRIMARY KEY (id_produto)
);

CREATE TABLE Loja
(
  id_loja INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  rua VARCHAR(255) NOT NULL,
  numero INT NOT NULL,
  PRIMARY KEY (id_loja)
);

CREATE TABLE Venda
(
  id_venda INT NOT NULL,
  preco FLOAT NOT NULL,
  forma_pgmt VARCHAR(255) NOT NULL,
  id_loja INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_venda),
  FOREIGN KEY (id_loja) REFERENCES Loja(id_loja),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Deck
(
  id_deck INT NOT NULL,
  tamanho INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_deck),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Jogo
(
  id_jogo INT NOT NULL,
  regras VARCHAR(255) NOT NULL,
  edicao VARCHAR(255) NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_jogo),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Adicional
(
  id_adicional INT NOT NULL,
  nome_adicional VARCHAR(255) NOT NULL,
  id_jogo INT NOT NULL,
  PRIMARY KEY (id_adicional),
  FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
);

CREATE TABLE Deck_Jogo
(
  id_deck_jogo INT NOT NULL,
  id_deck INT NOT NULL,
  id_jogo INT NOT NULL,
  PRIMARY KEY (id_deck_jogo),
  FOREIGN KEY (id_deck) REFERENCES Deck(id_deck),
  FOREIGN KEY (id_jogo) REFERENCES Jogo(id_jogo)
);

CREATE TABLE Grupo
(
  id_grupo INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  tamanho INT NOT NULL,
  PRIMARY KEY (id_grupo)
);

CREATE TABLE Habilidade
(
  id_habilidade INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  id_grupo INT NOT NULL,
  PRIMARY KEY (id_habilidade),
  FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo)
);

CREATE TABLE Mecanica
(
  id_mecanica INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  id_deck INT NOT NULL,
  PRIMARY KEY (id_mecanica),
  FOREIGN KEY (id_deck) REFERENCES Deck(id_deck)
);

CREATE TABLE Efeito
(
  id_efeito INT NOT NULL,
  efeito_1 VARCHAR(255) NOT NULL,
  efeito_2 VARCHAR(255) NOT NULL,
  id_habilidade INT NOT NULL,
  PRIMARY KEY (id_efeito),
  FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id_habilidade)
);

CREATE TABLE Caracteristica
(
  id_caracteristica INT NOT NULL,
  caracteristica_1 VARCHAR(255) NOT NULL,
  caracteristica_2 VARCHAR(255) NOT NULL,
  id_grupo INT NOT NULL,
  PRIMARY KEY (id_caracteristica),
  FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo)
);

CREATE TABLE Carta
(
  id_carta INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  qnt_produzida INT NOT NULL,
  custo INT NOT NULL,
  ataque INT NOT NULL,
  defesa INT NOT NULL,
  id_deck INT NOT NULL,
  PRIMARY KEY (id_carta),
  FOREIGN KEY (id_deck) REFERENCES Deck(id_deck)
);

CREATE TABLE Carta_Grupo
(
  id_carta_grupo INT NOT NULL,
  id_grupo INT NOT NULL,
  id_carta INT NOT NULL,
  PRIMARY KEY (id_carta_grupo),
  FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo),
  FOREIGN KEY (id_carta) REFERENCES Carta(id_carta)
);

CREATE TABLE Carta_Habilidade
(
  id_carta_habilidade INT NOT NULL,
  id_carta INT NOT NULL,
  id_habilidade INT NOT NULL,
  PRIMARY KEY (id_carta_habilidade),
  FOREIGN KEY (id_carta) REFERENCES Carta(id_carta),
  FOREIGN KEY (id_habilidade) REFERENCES Habilidade(id_habilidade)
);

-- Populando a tabela Produto
INSERT INTO Produto (id_produto, nome, qnt_vendida, qnt_produzida)
VALUES
  (1, 'deck de ossos', 100, 200),
  (2, 'deck de animais', 50, 100),
  (3, 'deck de robôs', 30, 60),
  (4, 'deck de criaturas mágicas', 70, 150),
  (5, 'deck de aliens', 40, 80),
  (6, 'deck de figuras históricas', 60, 120),
  (7, 'deck de eletrodomésticos', 90, 180),
  (8, 'Guerra dos Robôs', 80, 160),
  (9, 'Inscryption', 20, 40),
  (10, 'Rei da Colina', 45, 90),
  (11, 'Mundo Mutante', 60, 110),
  (12, 'Corrida do Ouro', 30, 200);


-- Populando a tabela Loja
INSERT INTO Loja (id_loja, nome, tipo, rua, numero)
VALUES
  (1, 'Card Games Emporium', 'Loja Física', 'Main Street', 101),
  (2, 'Gamers Haven', 'Loja Física', 'Oak Avenue', 202),
  (3, 'Online Card Shop', 'Loja Online', 'N/A', 0),
  (4, 'Magic Palace', 'Loja Física', 'Elm Road', 303),
  (5, 'Card Kingdom', 'Loja Online', 'N/A', 0),
  (6, 'The Gathering Spot', 'Loja Física', 'Pine Lane', 404),
  (7, 'Online Card Market', 'Loja Online', 'N/A', 0),
  (8, 'GameStop', 'Loja Física', 'Birch Street', 505),
  (9, 'Card Collectors Corner', 'Loja Física', 'Cedar Drive', 606),
  (10, 'TCG Warehouse', 'Loja Online', 'N/A', 0);

-- Populando a tabela Grupo
INSERT INTO Grupo (id_grupo, nome, tamanho)
VALUES
  (1, 'Aves', 9),
  (2, 'Venenosos', 5),
  (3, 'Ungulados', 10),
  (4, 'Formigas', 2),
  (5, 'Filhotes', 5),
  (6, 'Torres Mágicas', 3),
  (7, 'Geradores', 5),
  (8, 'Fracos', 4);

-- Populando a tabela Jogo
INSERT INTO Jogo (id_jogo, regras, edicao, id_produto)
VALUES
  (1, 'jogador ganha um parafuso ao atacar uma carta oponente, quando todas as cartas de um lado forem derrotadas vence o jogador com mais parafusos', 2023, 8),
  (2, 'ganha quem derrotar todas as cartas oponentes', 2023, 9),
  (3, 'ganha quem conseguir manter uma carta na mesma posição por 5 turnos', 2023, 10),
  (4, 'regras de inscryption + jogador pode sacrificar 3 pontos de ataque ou defesa de uma carta para dá-la uma mutação aleatória', 2023, 11),
  (5, 'jogador pode escolher "cavar" como ação, tendo uma chance de ganhar ouro, o primeiro jogador com 5 ouros ganha', 2023, 12);

-- Populando a tabela Deck
INSERT INTO Deck (id_deck, tamanho, id_produto)
VALUES
  (1, 20, 1),
  (2, 15, 2),
  (3, 21, 3),
  (4, 17, 4),
  (5, 15, 5),
  (6, 22, 6),
  (7, 10, 7);

-- Populando a tabela Venda

INSERT INTO Venda (id_venda, preco, forma_pgmt, id_loja, id_produto)
VALUES
  (1, 30, 'Cartão de Crédito', 1, 9),
  (2, 10, 'Dinheiro', 2, 1),
  (3, 15, 'PayPal', 3, 9),
  (4, 10, 'Cartão de Débito', 4, 3),
  (5, 25, 'Boleto Bancário', 3, 5),
  (6, 11, 'Cartão de Crédito', 6, 1),
  (7, 3, 'Dinheiro', 7, 2),
  (8, 5, 'PayPal', 8, 4),
  (9, 20, 'Cartão de Débito', 9, 9),
  (10, 40, 'Boleto Bancário', 10, 10),
  (11, 12, 'Pix', 5, 3),
  (12, 35, 'Cartão de Crédito', 2, 8);

-- Populando a tabela Deck_Jogo

INSERT INTO Deck_Jogo (id_deck_jogo, id_deck, id_jogo)
VALUES
  (1, 1, 2),
  (2, 2, 2),
  (3, 3, 2),
  (4, 4, 2),
  (5, 3, 1),
  (6, 7, 1),
  (7, 5, 1),
  (8, 6, 5),
  (9, 2, 5),
  (10, 1, 5);

-- Populando a tabela Mecanica

INSERT INTO Mecanica (id_mecanica, nome, descricao, id_deck)
VALUES
  (1, 'Sacrificio', 'devem ser sacrificadas uma quantia de cartas no campo igual ao custo de uma carta na mão para invocar tal carta', 1),
  (2, 'Necromancia', 'quando uma carta morre obtém-se um osso, o custo de novas cartas é pago com ossos', 2),
  (3, 'Energia', 'consome-se energia para invocar cartas e atacar, algumas cartas geram energia', 3),
  (4, 'Magia', 'a cada torre magica, é abatido 1 do custo de cada carta da cor da torre', 4),
  (5, 'Abdução', 'troca os pontos de ataque de uma carta para poder abduzir uma carta oponente', 5),
  (6, 'Viagem no tempo', 'pode retornar uma carta ao seu estado da rodada anterior', 6),
  (7, 'Conta de Luz', 'quanto mais cartas no campo maior vai ficando a conta de luz, se passar do limite ocorre uma derrota imediata', 7);

-- Populando a tabela Habilidade
INSERT INTO Habilidade (id_habilidade, nome, descricao, id_grupo)
VALUES
  (1, 'voo', 'levanta voo para evitar ataques', 1),
  (2, 'colônia', 'se torna mais forte em grupos maiores', 4),
  (3, 'crescer', 'evolui para outra carta no próximo turno', 5),
  (4, 'galopar', 'se movimenta rapidamente', 3),
  (5, 'envenenar', 'envenena o oponente atacado', 2),
  (6, 'radiar mana', 'emite mana da cor correspondente', 6),
  (7, 'gerar energia', 'gera energia a cada round', 7),
  (8, 'fraqueza', 'morre sem ser atacado', 8);

-- Populando a tabela Efeito

INSERT INTO Efeito (id_efeito, efeito_1, efeito_2, id_habilidade)
VALUES
  (1, 'evita ataques não aéreos', 'pode atacar cartas voadoras', 1),
  (2, 'ataque é aumentado de acordo com a quantidade de cartas desse grupo que estão em campo', 'N/A', 2),
  (3, 'vira sua versão adulta no próximo turno', 'N/A', 3),
  (4, 'pode se mover para um campo vizinho', 'N/A', 4),
  (5, 'inimigo atacado morrerá em 3 turnos', 'imune a ataques de veneno', 5),
  (6, 'diminui o custo das cartas da cor da torre por 1', 'N/A', 6),
  (7, 'gera 1 energia no inicio do turno', 'N/A', 7),
  (8, 'morre automaticamente em 1 turno', 'N/A', 8);

-- Populando a tabela Caracteristic

INSERT INTO Caracteristica (id_caracteristica, caracteristica_1, caracteristica_2, id_grupo)
VALUES
  (1, 'tem penas', 'tem asas', 1),
  (2, 'são perigosos', 'são intimidadores', 2),
  (3, 'são de médio a grande porte', 'têm cascos', 3),
  (4, 'pequenas', 'crocantes', 4),
  (5, 'pequenos e inexperientes', 'crescem rapido', 5),
  (6, 'feitas de pedra', 'tornam magia possível', 6),
  (7, 'sem locomoção própria', 'máquinas', 7),
  (8, 'frágeis', 'facilmente derrotados', 8);

-- Populando a tabela Adiciona

INSERT INTO Adicional (id_adicional, nome_adicional, id_jogo)
VALUES
  (1, 'parafusos', 1),
  (2, 'cartas de mutação', 4),
  (3, 'peças de ouro', 5),
  (4, 'dado dourado', 5);

INSERT INTO Carta (id_carta, nome, qnt_produzida, custo, ataque, defesa, id_deck)
VALUES
  (1, 'esquilo', 999, 0, 0, 1, 2),
  (2, 'lobo', 800, 2, 3, 2, 2),
  (3, 'formiga', 457, 1, 0, 2, 2),
  (4, 'filhote de lobo', 200, 1, 1, 1, 2),
  (5, 'cobra', 150, 2, 1, 1, 2),
  (6, 'corvo', 600, 2, 2, 3, 2),
  (7, 'esqueleto', 999, 0, 1, 1, 1),
  (8, 'soldado-esqueleto', 350, 3, 3, 1, 1),
  (9, 'gerador', 999, 2, 0, 1, 3),
  (10, 'microondas', 45, 10, 5, 5, 7),
  (11, 'andorinha', 300, 1, 1, 2, 2),
  (12, 'rainha formiga', 100, 2, 0, 4, 2),
  (13, 'escorpião', 50, 3, 3, 1, 2),
  (14, 'veado', 200, 2, 2, 4, 2);


-- Populando a tabela Carta_Grupo done
INSERT INTO Carta_Grupo (id_carta_grupo, id_grupo, id_carta)
VALUES
  (1, 4, 3),
  (2, 5, 4),
  (3, 2, 5),
  (4, 1, 6),
  (5, 8, 7),
  (6, 7, 9),
  (7, 1, 11),
  (8, 4, 12),
  (9, 2, 13),
  (10, 3, 14);

-- Populando a tabela Carta_Habilidade done
INSERT INTO Carta_Habilidade (id_carta_habilidade, id_carta, id_habilidade)
VALUES
  (1, 3, 2),
  (2, 4, 3),
  (3, 5, 5),
  (4, 6, 1),
  (5, 7, 8),
  (6, 9, 7),
  (7, 11, 1),
  (8, 12, 2),
  (9, 13, 5),
  (10, 14, 4);
