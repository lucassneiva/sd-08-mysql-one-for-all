DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE PLANOS(
  PLANO_ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME_PLANO VARCHAR(20),
  VALOR_PLANO DECIMAL(4,2)
) ENGINE="InnoDB";

INSERT INTO PLANOS (NOME_PLANO, VALOR_PLANO) VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE USUARIOS(
  USUARIO_ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(20),
  IDADE SMALLINT,
  PLANO_ID INT,
  FOREIGN KEY (PLANO_ID) REFERENCES PLANOS(PLANO_ID)
) ENGINE="InnoDB";

INSERT INTO USUARIOS (NOME, IDADE, PLANO_ID) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);


CREATE TABLE ARTISTAS(
  ARTISTA_ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME_ARTISTA VARCHAR(50)  
);

INSERT INTO ARTISTAS (NOME_ARTISTA) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE ALBUNS(
  ALBUM_ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME_ALBUM VARCHAR(20),
  ARTISTA_ID INT,
  FOREIGN KEY (ARTISTA_ID) REFERENCES ARTISTAS(ARTISTA_ID)
) ENGINE="InnoDB";

INSERT INTO ALBUNS (NOME_ALBUM, ARTISTA_ID) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE CANCOES(
  CANCAO_ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME_CANCAO VARCHAR(30),
  ALBUM_ID INT,
  FOREIGN KEY (ALBUM_ID) REFERENCES ALBUNS(ALBUM_ID)
) ENGINE="InnoDB";

INSERT INTO CANCOES (NOME_CANCAO, ALBUM_ID) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);
CREATE TABLE USUARIO_CANCOES(
  USUARIO_ID INT,
  CANCAO_ID INT,
  FOREIGN KEY (USUARIO_ID) REFERENCES USUARIOS(USUARIO_ID),
  FOREIGN KEY (CANCAO_ID) REFERENCES CANCOES(CANCAO_ID),
  PRIMARY KEY(USUARIO_ID, CANCAO_ID)
) ENGINE="InnoDB";

INSERT INTO USUARIO_CANCOES (USUARIO_ID, CANCAO_ID) VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);

CREATE TABLE USUARIO_ARTISTA(
  USUARIO_ID INT,
  ARTISTA_ID INT,
  FOREIGN KEY (USUARIO_ID) REFERENCES USUARIOS(USUARIO_ID),
  FOREIGN KEY (ARTISTA_ID) REFERENCES ARTISTAS(ARTISTA_ID),
  PRIMARY KEY (USUARIO_ID, ARTISTA_ID)
) ENGINE="InnoDB";

INSERT INTO USUARIO_ARTISTA (USUARIO_ID, ARTISTA_ID) VALUES
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(3,4);
