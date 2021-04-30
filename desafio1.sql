DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id int NOT NULL AUTO_INCREMENT,
    plano varchar(30),
    valor float,
    PRIMARY KEY(plano_id)
) engine = InnoDB;

CREATE TABLE usuarios(
    usuario_id int NOT NULL AUTO_INCREMENT,
    usuario varchar(30),
    idade int,
    plano_id int,
    PRIMARY KEY(usuario_id),
    FOREIGN KEY(plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id int NOT NULL AUTO_INCREMENT,
    artista varchar(30),
    PRIMARY KEY(artista_id)
) engine = InnoDB;

CREATE TABLE albuns(
    album_id int NOT NULL AUTO_INCREMENT,
    album varchar(30),
    artista_id int,
    PRIMARY KEY(album_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id int NOT NULL AUTO_INCREMENT,
    cancao varchar(30),
    album_id int,
    PRIMARY KEY(cancao_id),
    FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
    usuario_id int NOT NULL,
    artista_id int NOT NULL,
    PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducoes(
    usuario_id int NOT NULL,
    cancao_id int NOT NULL,
    PRIMARY KEY(usuario_id, cancao_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO
    SpotifyClone.artistas(artista)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO
    SpotifyClone.planos(plano, valor)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO
    SpotifyClone.usuarios(usuario, idade, plano_id)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

INSERT INTO
    SpotifyClone.albuns(album, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO
    SpotifyClone.cancoes(cancao, album_id)
VALUES
("Soul For Us", 1),
    ("Reflections Of Magic", 1),
    ("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
    ("Time Fireworks", 2),
("Magic Circus", 3),
    ("Honey, So Do I", 3),
    ("Sweetie, Let's Go Wild", 3),
    ("She Knows", 3),
("Fantasy For Me", 4),
    ("Celebration Of More", 4),
    ("Rock His Everything", 4),
    ("Home Forever", 4),
    ("Diamond Power", 4),
    ("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
    ("Words Of Her Life", 5),
    ("Without My Streets", 5);

INSERT INTO
    SpotifyClone.seguindo_artistas(usuario_id, artista_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 4),
    (1, 4),
    (1, 3),
    (2, 3),
    (3, 1);

INSERT INTO
    SpotifyClone.historico_de_reproducoes(usuario_id, cancao_id)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 2),
    (2, 13),
    (2, 15),
    (2, 17),
    (3, 4),
    (3, 6),
    (3, 16),
    (4, 3),
    (4, 11),
    (4, 18);
