CREATE TYPE tipo AS ENUM ('chef', 'comum');


CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    imagem_usuario TEXT,
    tipo tipo NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITHOUT TIME ZONE
);


CREATE TABLE Receita (
    id_receita SERIAL PRIMARY KEY,
    titulo_receita VARCHAR(255) NOT NULL,
    origem_receita VARCHAR(255) NOT NULL,
    url_imagem TEXT,
    id_usuario INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT fk_receita_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


CREATE TABLE Favoritos (
    id_favorito SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_receita INTEGER NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT fk_favorito_usuario  FOREIGN KEY (id_usuario)REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_favorito_receita FOREIGN KEY (id_receita) REFERENCES Receita(id_receita)
);

INSERT INTO Usuario 
(id_usuario, nome, nome_usuario, email, senha, imagem_usuario, tipo, created_at, update_at)VALUES
(1, 'Chef Marco Bianchi', 'chef1', 'chef1@saepchef.com', '123456', 'chef1.jpg', 'chef', '2026-01-10 09:15:00', '2026-01-10 09:15:00'),
(2, 'Chef Ana Ferreira', 'chef2', 'chef2@saepchef.com', '123456', 'chef2.jpg', 'chef', '2026-01-12 10:30:00', '2026-01-12 10:30:00'),
(3, 'Chef Lucas Tanaka', 'chef3', 'chef3@saepchef.com', '123456', 'chef3.jpg', 'chef', '2026-01-14 14:20:00', '2026-01-14 14:20:00'),
(4, 'Mariana Costa', 'usuario1', 'usuario1@gmail.com', '123456', 'usuario1.jpg', 'comum', '2026-01-14 18:45:00', '2026-01-14 18:45:00'),
(5, 'Rafael Souza', 'usuario2', 'usuario2@gmail.com', '123456', 'usuario2.jpg', 'comum', '2026-01-18 11:00:00', '2026-01-18 11:00:00'),
(6, 'Beatriz Lima', 'usuario3', 'usuario3@gmail.com', '123456', 'usuario3.jpg', 'comum', '2026-01-20 16:10:00', '2026-01-20 16:10:00');

INSERT INTO Receita
(id_receita, titulo_receita, origem_receita, url_imagem, created_at, update_at, id_usuario)VALUES
(1, 'Sopa de Feijão', 'Brasil', 'receita1.jpg', '2026-01-10 09:15:00', '2026-01-10 09:15:00', 1),
(2, 'Gelatina', 'Brasil', 'receita2.jpg', '2026-01-12 10:30:00', '2026-01-12 10:30:00', 2),
(3, 'Arroz e feijão com Salada', 'Brasil', 'receita3.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 3),
(4, 'Feijoada', 'Brasil', 'receita4.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 1),
(5, 'Bolinho de Carne', 'Brasil', 'receita5.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 2),
(6, 'Salada', 'Brasil', 'receita6.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 3),
(7, 'Arroz e feijão', 'Brasil', 'receita7.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 1),
(8, 'Pizza', 'Brasil', 'receita8.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 2),
(9, 'Macarronada', 'Brasil', 'receita9.jpg', '2026-01-14 14:20:00', '2026-01-14 14:20:00', 3);