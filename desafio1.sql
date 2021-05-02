CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(50),
  valor_plano DECIMAL(3,2)
) engine=InnoDB;

INSERT INTO plano(plano, valor_plano)
VALUES ('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99);

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(50),
  idade INT,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine=InnoDB;

INSERT INTO usuario(nome_usuario, idade, plano_id)
VALUES ('Thati', 23, 1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);

CREATE TABLE artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(50)
) engine=InnoDB;

INSERT INTO artista(nome_artista)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(50),
  artista_id INT,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine=InnoDB;

INSERT INTO album(nome_album, artista_id) VALUES
('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);

CREATE TABLE musica(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(100),
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine=InnoDB;

INSERT INTO musica(nome_musica, album_id) VALUES
('Soul For Us', 1), ('Reflections Of Magic', 1), ('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2), ('Time Fireworks', 2),
('Magic Circus', 3), ('Honey, So Do I', 3), ("Sweetie, Let's Go Wild", 3), ('She Knows', 3),
('Fantasy For Me', 4), ('Celebration Of More', 4), ('Rock His Everything', 4), ('Home Forever', 4),
('Diamond Power', 4), ("Honey, Let's Be Silly", 4), ('Thang Of Thunder', 5), ('Words Of Her Life', 5),
('Without My Streets', 5);

CREATE TABLE favoritos(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) engine=InnoDB;

INSERT INTO favoritos(usuario_id, artista_id)
VALUES (1, 1), (1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4);

CREATE TABLE historico(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
) engine=InnoDB;

INSERT INTO historico(usuario_id, musica_id) VALUES
(1, 1), (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16), (3, 6), (4, 3),
(4, 18), (4, 11);
