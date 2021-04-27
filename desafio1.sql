DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
	id_plano INT PRIMARY KEY,
  plano VARCHAR(50),
  valor_plano DOUBLE
) engine=InnoDB;

INSERT INTO plano VALUES (1, 'gratuito', 0), (2, 'familiar', 7.99), (3, 'universitário', 5.99);

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY,
  nome VARCHAR(50),
  idade INT,
  id_plano INT,
  FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
) engine=InnoDB;

INSERT INTO usuario VALUES (1, 'Thati', 23, 1), (2, 'Cintia', 35, 2), (3, 'Bill', 20, 3), (4, 'Roger', 45, 1);

CREATE TABLE artista(
  id_artista INT PRIMARY KEY,
  nome VARCHAR(50)
) engine=InnoDB;

INSERT INTO artista VALUES (1, 'Walter Phoenix'), (2, 'Peter Strong'), (3, 'Lance Day'), (4, 'Freedie Shannon');

CREATE TABLE album(
  id_album INT PRIMARY KEY,
  titulo VARCHAR(50),
  id_artista INT,
  FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) engine=InnoDB;

INSERT INTO album VALUES (1, 'Envious', 1), (2, 'Exuberant', 1), (3, 'Hallowed Steam', 2), (4, 'Incandescent', 3), (5, 'Temporary Culture', 4);

CREATE TABLE cancao(
  id_cancao INT PRIMARY KEY,
  titulo VARCHAR(100),
  id_album INT,
  FOREIGN KEY (id_album) REFERENCES album(id_album)
) engine=InnoDB;

INSERT INTO cancao VALUES
(1, 'Soul For Us', 1), (2, 'Reflections Of Magic', 1), (3, 'Dance With Her Own', 1),
(4, 'Troubles Of My Inner Fire', 2), (5, 'Time Fireworks', 2),
(6, 'Magic Circus', 3), (7, 'Honey, So Do I', 3), (8, "Sweetie, Let's Go Wild", 3), (9, 'She Knows', 3),
(10, 'Fantasy For Me', 4), (11, 'Celebration Of More', 4), (12, 'Rock His Everything', 4), (13, 'Home Forever', 4), (14, 'Diamond Power', 4), (15, "Honey, Let's Be Silly", 4),
(16, 'Thang Of Thunder', 5), (17, 'Words Of Her Life', 5), (18, 'Without My Streets', 5);


CREATE TABLE artistas_favoritos(
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  CONSTRAINT pk_artistas_favoritos PRIMARY KEY (id_usuario, id_artista),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) engine=InnoDB;

INSERT INTO artistas_favoritos VALUES (1, 1), (1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4);

CREATE TABLE historico(
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  CONSTRAINT pk_historico PRIMARY KEY (id_usuario, id_cancao),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_cancao) REFERENCES cancao(id_cancao)
) engine=InnoDB;

INSERT INTO historico VALUES
(1, 1), (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16), (3, 6),
(4, 3), (4, 18), (4, 11);
