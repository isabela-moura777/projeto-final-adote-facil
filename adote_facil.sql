CREATE TABLE usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
email VARCHAR(150) NOT NULL,
senha VARCHAR(15) NOT NULL,
data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
telefone VARCHAR(20) NOT NULL,
tipo_perfil VARCHAR(100) NOT NULL,
foto_perfil VARCHAR(255),
cidade VARCHAR(50)
);

CREATE TABLE mensagens(
id_mensagem INT PRIMARY KEY AUTO_INCREMENT,
id_pedido INT NOT NULL,
CONSTRAINT FK_MENSAGENS_PEDIDO FOREIGN KEY (id_pedido)
REFERENCES pedido (id_pedido),
id_usuario INT NOT NULL,
CONSTRAINT FK_MENSAGENS_USUARIO FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario),
conteudo TEXT NOT NULL,
data_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
lida BOOLEAN NOT NULL DEFAULT FALSE,
data_leitura DATETIME
);

CREATE TABLE pedido(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
CONSTRAINT FK_PEDIDO_USUARIO FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario),
id_animal INT NOT NULL,
CONSTRAINT FK_PEDIDO_ANIMAIS FOREIGN KEY (id_animal)
REFERENCES animais (id_animal),
situacao_pedido ENUM(
	'Pendente',
    'Em análise',
    'Aprovado',
    'Recusado',
    'Cancelado',
    'Concluido'
) NOT NULL DEFAULT 'Pendente',
data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ong(
id_ong INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cnpj VARCHAR(14) NOT NULL UNIQUE,
telefone VARCHAR(20) NOT NULL,
endereco VARCHAR(150) NOT NULL
);

CREATE TABLE animais(
id_animal INT PRIMARY KEY AUTO_INCREMENT,
id_ong INT NOT NULL,
CONSTRAINT FK_ANIMAIS_ONG FOREIGN KEY (id_ong)
REFERENCES ong (id_ong),
nome VARCHAR(100) NOT NULL,
especie VARCHAR(50) NOT NULL,
raca VARCHAR(50) NOT NULL,
porte VARCHAR(50) NOT NULL,
sexo CHAR(1),
data_nascimento DATE,
descricao VARCHAR(100),
situacao_animal ENUM(
	'Disponível para adoção',
    'Em processo de adoção',
    'Adotado',
    'Em tratamento',
    'Indisponível'
) NOT NULL DEFAULT 'Disponível para adoção'
);

CREATE TABLE tags(
id_tag INT PRIMARY KEY AUTO_INCREMENT,
id_animal INT NOT NULL,
CONSTRAINT FK_TAG_ANIMAIS FOREIGN KEY (id_animal)
REFERENCES animais (id_animal),
tag VARCHAR(100) NOT NULL
);

CREATE TABLE favoritos(
id_favorito INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
CONSTRAINT FK_FAVORITOS_USUARIO FOREIGN KEY (id_usuario)
REFERENCES usuario (id_usuario),
id_animal INT NOT NULL,
CONSTRAINT FK_FAVORITOS_ANIMAIS FOREIGN KEY (id_animal)
REFERENCES animais (id_animal)
);
