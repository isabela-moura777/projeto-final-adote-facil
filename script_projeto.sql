-- 1. Listar todos os animais
SELECT * FROM animais;

-- 2. Consultar o nome e a espécie dos animais
SELECT nome, especie FROM animais;

-- 3. Consultar somente os cachorros
SELECT * FROM animais
WHERE especie = 'Cachorro';

-- 4. Consultar somente os gatos
SELECT * FROM animais
WHERE especie = 'Gato';

-- 5. Consultar animais disponíveis para adoção
SELECT * FROM animais
WHERE situacao_animal = 'Disponível para adoção';

-- 6. Consultar animais de porte pequeno
SELECT * FROM animais
WHERE porte = 'Pequeno';

-- 7. Consultar animais do sexo feminino
SELECT * FROM animais
WHERE sexo = 'F';

-- 8. Consultar animais vinculados à ONG de ID 1
SELECT * FROM animais
WHERE id_ong = 1;

-- 9. Listar os animais em ordem alfabética
SELECT * FROM animais
ORDER BY nome ASC;

-- 10. Contar a quantidade de animais por situação
SELECT situacao_animal, COUNT(*) AS quantidade
FROM animais
GROUP BY situacao_animal;

-- 1. Listar todos os favoritos
SELECT * FROM favoritos;

-- 2. Consultar os favoritos do usuário de ID 1
SELECT * FROM favoritos
WHERE id_usuario = 1;

-- 3. Consultar os favoritos relacionados ao animal de ID 1
SELECT * FROM favoritos
WHERE id_animal = 1;

-- 4. Listar os nomes dos usuários e seus animais favoritos
SELECT usuario.nome AS usuario, animais.nome AS animal
FROM favoritos
JOIN usuario ON favoritos.id_usuario = usuario.id_usuario
JOIN animais ON favoritos.id_animal = animais.id_animal;

-- 5. Contar quantas vezes cada animal foi favoritado
SELECT id_animal, COUNT(*) AS total_favoritos
FROM favoritos
GROUP BY id_animal;

-- 6. Contar quantos favoritos cada usuário possui
SELECT id_usuario, COUNT(*) AS total_favoritos
FROM favoritos
GROUP BY id_usuario;

-- 7. Consultar os animais favoritos de cada usuário
SELECT usuario.nome, animais.nome AS animal_favorito
FROM favoritos
JOIN usuario ON favoritos.id_usuario = usuario.id_usuario
JOIN animais ON favoritos.id_animal = animais.id_animal
ORDER BY usuario.nome;

-- 8. Consultar os favoritos de usuários de São Paulo
SELECT favoritos.*
FROM favoritos
JOIN usuario ON favoritos.id_usuario = usuario.id_usuario
WHERE usuario.cidade = 'São Paulo';

-- 9. Consultar a quantidade total de favoritos
SELECT COUNT(*) AS total_favoritos
FROM favoritos;

-- 10. Listar os animais que possuem pelo menos um favorito
SELECT DISTINCT animais.nome
FROM animais
JOIN favoritos ON animais.id_animal = favoritos.id_animal;

-- 1. Listar todas as mensagens
SELECT * FROM mensagens;

-- 2. Consultar mensagens de um pedido específico
SELECT * FROM mensagens
WHERE id_pedido = 1;

-- 3. Consultar mensagens enviadas por um usuário
SELECT * FROM mensagens
WHERE id_usuario = 1;

-- 4. Consultar mensagens não lidas
SELECT * FROM mensagens
WHERE lida = 0;

-- 5. Consultar mensagens já lidas
SELECT * FROM mensagens
WHERE lida = 1;

-- 6. Consultar mensagens enviadas em determinada data
SELECT * FROM mensagens
WHERE DATE(data_envio) = '2026-10-27';

-- 7. Listar mensagens da mais recente para a mais antiga
SELECT * FROM mensagens
ORDER BY data_envio DESC;

-- 8. Mostrar o conteúdo das mensagens e o nome de quem enviou
SELECT mensagens.conteudo, usuario.nome AS remetente
FROM mensagens
JOIN usuario ON mensagens.id_usuario = usuario.id_usuario;

-- 9. Consultar mensagens relacionadas aos pedidos e animais
SELECT mensagens.conteudo, pedido.id_pedido, animais.nome AS animal
FROM mensagens
JOIN pedido ON mensagens.id_pedido = pedido.id_pedido
JOIN animais ON pedido.id_animal = animais.id_animal;

-- 10. Contar a quantidade de mensagens por pedido
SELECT id_pedido, COUNT(*) AS quantidade_mensagens
FROM mensagens
GROUP BY id_pedido;

-- 1. Listar todas as ONGs
SELECT * FROM ong;

-- 2. Consultar o nome e o telefone das ONGs
SELECT nome, telefone FROM ong;

-- 3. Consultar uma ONG pelo ID
SELECT * FROM ong
WHERE id_ong = 1;

-- 4. Consultar uma ONG pelo nome
SELECT * FROM ong
WHERE nome = 'Amigos de Patas';

-- 5. Consultar uma ONG pelo CNPJ
SELECT * FROM ong
WHERE cnpj = '12345678000190';

-- 6. Consultar ONGs localizadas em São Paulo
SELECT * FROM ong
WHERE endereco LIKE '%São Paulo%';

-- 7. Consultar ONGs localizadas em Guarulhos
SELECT * FROM ong
WHERE endereco LIKE '%Guarulhos%';

-- 8. Listar as ONGs e a quantidade de animais cadastrados
SELECT ong.nome, COUNT(animais.id_animal) AS quantidade_animais
FROM ong
LEFT JOIN animais ON ong.id_ong = animais.id_ong
GROUP BY ong.id_ong, ong.nome;

-- 9. Listar os animais e suas respectivas ONGs
SELECT animais.nome AS animal, ong.nome AS ong
FROM animais
JOIN ong ON animais.id_ong = ong.id_ong;

-- 10. Contar a quantidade total de ONGs cadastradas
SELECT COUNT(*) AS total_ongs
FROM ong;

-- 1. Listar todos os pedidos
SELECT * FROM pedido;

-- 2. Consultar pedidos pendentes
SELECT * FROM pedido
WHERE situacao_pedido = 'Pendente';

-- 3. Consultar pedidos em análise
SELECT * FROM pedido
WHERE situacao_pedido = 'Em análise';

-- 4. Consultar pedidos aprovados
SELECT * FROM pedido
WHERE situacao_pedido = 'Aprovado';

-- 5. Consultar pedidos recusados
SELECT * FROM pedido
WHERE situacao_pedido = 'Recusado';

-- 6. Consultar pedidos de um usuário específico
SELECT * FROM pedido
WHERE id_usuario = 1;

-- 7. Consultar pedidos relacionados a um animal específico
SELECT * FROM pedido
WHERE id_animal = 1;

-- 8. Listar pedidos em ordem de data
SELECT * FROM pedido
ORDER BY data_pedido DESC;

-- 9. Mostrar os pedidos com o nome do usuário e do animal
SELECT pedido.id_pedido, usuario.nome AS usuario,
       animais.nome AS animal, pedido.situacao_pedido
FROM pedido
JOIN usuario ON pedido.id_usuario = usuario.id_usuario
JOIN animais ON pedido.id_animal = animais.id_animal;

-- 10. Contar a quantidade de pedidos por situação
SELECT situacao_pedido, COUNT(*) AS quantidade
FROM pedido
GROUP BY situacao_pedido;

-- 1. Listar todas as tags
SELECT * FROM tags;

-- 2. Consultar as tags de um animal específico
SELECT * FROM tags
WHERE id_animal = 1;

-- 3. Consultar uma tag pelo nome
SELECT * FROM tags
WHERE tag = 'Carinhoso';

-- 4. Listar as tags em ordem alfabética
SELECT * FROM tags
ORDER BY tag ASC;

-- 5. Contar a quantidade total de tags
SELECT COUNT(*) AS total_tags
FROM tags;

-- 6. Contar a quantidade de tags por animal
SELECT id_animal, COUNT(*) AS quantidade_tags
FROM tags
GROUP BY id_animal;

-- 7. Mostrar as tags e os nomes dos animais relacionados
SELECT tags.tag, animais.nome AS animal
FROM tags
JOIN animais ON tags.id_animal = animais.id_animal;

-- 8. Consultar as tags dos animais da ONG de ID 1
SELECT tags.tag, animais.nome AS animal
FROM tags
JOIN animais ON tags.id_animal = animais.id_animal
WHERE animais.id_ong = 1;

-- 9. Consultar as tags que começam com a letra C
SELECT * FROM tags
WHERE tag LIKE 'C%';

-- 10. Consultar a quantidade de animais que possuem tags
SELECT COUNT(DISTINCT id_animal) AS animais_com_tags
FROM tags;

-- 1. Listar os usuários cadastrados
SELECT id_usuario, nome, email, telefone, tipo_perfil, cidade
FROM usuario;

-- 2. Consultar um usuário pelo ID
SELECT * FROM usuario
WHERE id_usuario = 1;

-- 3. Consultar usuários com perfil de adotante
SELECT * FROM usuario
WHERE tipo_perfil = 'Adotante';

-- 4. Consultar usuários responsáveis por ONGs
SELECT * FROM usuario
WHERE tipo_perfil = 'Responsável ONG';

-- 5. Consultar usuários de São Paulo
SELECT * FROM usuario
WHERE cidade = 'São Paulo';

-- 6. Buscar usuários pelo nome
SELECT * FROM usuario
WHERE nome LIKE '%Ana%';

-- 7. Contar a quantidade de usuários cadastrados
SELECT COUNT(*) AS total_usuarios
FROM usuario;

-- 8. Contar usuários por tipo de perfil
SELECT tipo_perfil, COUNT(*) AS quantidade
FROM usuario
GROUP BY tipo_perfil;

-- 9. Listar usuários em ordem alfabética
SELECT * FROM usuario
ORDER BY nome ASC;

-- 10. Consultar os usuários e a quantidade de pedidos realizados
SELECT usuario.nome, COUNT(pedido.id_pedido) AS total_pedidos
FROM usuario
LEFT JOIN pedido ON usuario.id_usuario = pedido.id_usuario
GROUP BY usuario.id_usuario, usuario.nome;
