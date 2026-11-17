ALTER TABLE usuario
MODIFY COLUMN data_cadastro DATETIME
DEFAULT CURRENT_TIMESTAMP;

INSERT INTO usuario
	(id_usuario, nome, cpf, email, senha, telefone, tipo_perfil, foto_perfil, cidade)
VALUES
	(1, 'Ana Oliveira', '12345678901', 'ana.oliveira@example.com','senha123', '11987654321', 'Adotante', NULL, 'São Paulo'),
	(2, 'Bruno Santos', '23456789012', 'bruno.santos@example.com','senha456', '11976543210', 'Adotante', NULL, 'Campinas'),
	(3, 'Carla Mendes', '34567890123','carla.mendes@example.com','senha789', '11965432109', 'Adotante', NULL, 'Santos'),
    (4, 'Mariana Alves', '67890123456', 'mariana.alves@example.com', 'ariana1', '11932109876', 'Responsável ONG', NULL, 'São Paulo'),
	(5, 'Rafael Souza', '78901234567', 'rafael.souza@example.com', 'rafael123', '11921098765', 'Responsável ONG', NULL, 'Campinas');
    
INSERT INTO ong
	(id_ong, nome, cnpj, telefone, endereco)
VALUES
	(01, 'Amigos de Patas', '12345678000190', '1133334444', 'Rua das Flores, 100 - São Paulo'),
    (02, 'Projeto Novo Lar', '98765432000180','1144445555', 'Avenida Central, 250 - Guarulhos');
    
INSERT INTO animais
	(id_animal, id_ong, nome, especie, raca, porte, sexo, data_nascimento, descricao, situacao_animal)
VALUES
	(001, 01, 'Luna', 'Cachorro', 'Vira-lata', 'Médio', 'F', '2023-05-10', 'Carinhosa e brincalhona', 'Disponível para adoção'),
	(002, 01, 'Thor', 'Cachorro', 'Labrador', 'Grande', 'M', '2022-03-15', 'Dócil e ativo', 'Disponível para adoção'),
	(003, 02, 'Mimi', 'Gato', 'Siamês', 'Pequeno', 'F', '2024-01-20', 'Tranquila e carinhosa', 'Em processo de adoção'),
	(004, 02, 'Bob', 'Cachorro', 'Poodle', 'Pequeno', 'M', '2021-08-12', 'Gosta de companhia', 'Disponível para adoção');
    
INSERT INTO pedido
	(id_pedido, id_usuario, id_animal, situacao_pedido)
VALUES
	(00001, 1, 001, 'Pendente'),
	(00002, 2, 003, 'Em análise'),
	(00003, 3, 002, 'Pendente'),
	(00004, 4, 004, 'Aprovado');
    
    ALTER TABLE mensagens
	MODIFY COLUMN data_envio DATETIME
	DEFAULT CURRENT_TIMESTAMP;
    
    INSERT INTO mensagens
		(id_mensagem, id_pedido, id_usuario, conteudo, lida, data_leitura)
	VALUES
	(000001, 00001, 1, 'Gostaria de saber mais sobre a Luna.', TRUE, '2026-10-20 14:30:00'),
	(000002, 00001, 4, 'Olá! Podemos conversar sobre a adoção.', TRUE, '2026-10-20 15:00:00'),
	(000003, 00002, 2, 'Qual é o prazo para análise?', FALSE, NULL),
	(000004, 00003, 3, 'A Mimi já está vacinada?', TRUE, '2026-10-21 10:00:00');
    
INSERT INTO tags
	(id_tag, id_animal, tag)
VALUES
	(0000001, 001, 'Carinhoso'),
    (0000002, 002, 'Brincalhão'),
    (0000003, 003, 'Dócil'),
    (0000004, 004, 'Amigável');
    
INSERT INTO favoritos
	(id_favorito, id_usuario, id_animal)
VALUES
	(00000001, 1, 001),
	(00000002, 2, 003),
	(00000003, 3, 002),
	(00000004, 4, 004);
    
ALTER TABLE usuario
MODIFY COLUMN senha VARCHAR(255) NOT NULL;

ALTER TABLE ong
ADD COLUMN situacao_verificacao
ENUM ('Pendente', 'Verificada', 'Rejeitada')
NOT NULL DEFAULT 'Pendente',
ADD COLUMN data_verificacao TIMESTAMP NULL,
ADD COLUMN observacao_verificacao VARCHAR (255) NULL;
