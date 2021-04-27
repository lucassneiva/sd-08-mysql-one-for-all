CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas (
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO artistas(artista_id, artista)
VALUES(1, "Walter Phoenix"),(2, "Peter Strong"),
(3, "Lance Day"), (4, "Freedie Shannon");

CREATE TABLE albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) ENGINE=InnoDB;

INSERT INTO albuns(album_id, album, artista_id)
VALUES(1,"Envious", 1),(2,"Exuberant", 1), (3, "Hallowed Steam", 2),
(4, "Incandescent", 3), (5, "Temporary Culture", 4);

CREATE TABLE musicas (
musica_id INT PRIMARY KEY AUTO_INCREMENT,
musica VARCHAR(250) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) ENGINE=InnoDB;

INSERT INTO musicas(musica_id, musica, album_id)
VALUES(1,"Soul For Us", 1), (2, "Reflections Of Magic", 1),
(3, "Dance With Her Own", 1), (4, "Troubles Of My Inner Fire", 2),
(5, "Time Fireworks", 2), (6, "Magic Circus", 3), (7, "Honey, So Do I", 3),
(8, "Sweetie, Let's Go Wild", 3), (9, "She Knows", 3), (10, "Fantasy For Me", 4),
(11, "Celebration Of More", 4), (12, "Rock His Everything", 4), (13, "Home Forever", 4),
(14, "Diamond Power", 4), (15, "Honey, Let's Be Silly", 4), (16, "Thang Of Thunder", 5),
(17, "Words Of Her Life", 5), (18, "Without My Streets", 5);

CREATE TABLE planos(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor DECIMAL(4,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(200) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY(plano_id) REFERENCES planos(plano_id) 
) ENGINE=InnoDB;

CREATE TABLE usuarios_artistas (
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
) ENGINE=InnoDB;

CREATE TABLE usuarios_musicas (
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY(musica_id) REFERENCES musicas(musica_id)
) ENGINE=InnoDB;
