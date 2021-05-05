CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan (
plan_id INT AUTO_INCREMENT PRIMARY KEY,
plan_name VARCHAR(50) NOT NULL,
plan_price DECIMAL(5, 2) NOT NULL
)  ENGINE=INNODB;

INSERT INTO plan
VALUES
(1, "gratuito", 0.00),
(2, "familiar", 7.99),
(3, "universitário", 5.99);

CREATE TABLE user (
user_id INT AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(50) NOT NULL,
user_age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
)  ENGINE=INNODB;

INSERT INTO user
VALUES
(1, "Thati", 23, 1),
(2, "Cintia", 35, 2),
(3, "Bill", 20, 3),
(4, "Roger", 45, 1);

CREATE TABLE artist (
artist_id INT AUTO_INCREMENT PRIMARY KEY,
artist_name VARCHAR(50) NOT NULL
)  ENGINE=INNODB;

INSERT INTO artist
VALUES
(1, "Walter Phoenix"),
(2, "Peter Strong"),
(3, "Lance Day"),
(4, "Freedie Shannon");

CREATE TABLE album (
album_id INT AUTO_INCREMENT PRIMARY KEY,
album_name VARCHAR(50) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
)  ENGINE=INNODB;

INSERT INTO album
VALUES
(1, "Envious", 1),
(2, "Exuberant", 1),
(3, "Hallowed Steam", 2),
(4, "Incandescent", 3),
(5, "Temporary Culture", 4);

CREATE TABLE music (
music_id INT AUTO_INCREMENT PRIMARY KEY,
music_name VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album (album_id)
)  ENGINE=INNODB;

INSERT INTO music
VALUES
(1, "Soul For Us", 1),
(2, "Reflections Of Magic", 1),
(3, "Dance With Her Own", 1),
(4, "Troubles Of My Inner Fire", 2),
(5, "Time Fireworks", 2),
(6, "Magic Circus", 3),
(7, "Honey, So Do I", 3),
(8, "Sweetie, Let's Go Wild", 3),
(9, "She Knows", 3),
(10, "Fantasy For Me", 4),
(11, "Celebration Of More", 4),
(12, "Rock His Everything", 4),
(13, "Home Forever", 4),
(14, "Diamond Power", 4),
(15, "Honey, Let's Be Silly", 4),
(16, "Thang Of Thunder", 5),
(17, "Words Of Her Life", 5),
(18, "Without My Streets", 5);

CREATE TABLE reproduction_history (
user_id INT NOT NULL,
music_id INT NOT NULL,
PRIMARY KEY (user_id , music_id),
FOREIGN KEY (user_id) REFERENCES user (user_id),
FOREIGN KEY (music_id) REFERENCES music (music_id)
)  ENGINE=INNODB;

INSERT INTO reproduction_history
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

CREATE TABLE followed_artist (
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id , artist_id),
FOREIGN KEY (user_id) REFERENCES user (user_id),
FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
)  ENGINE=INNODB;

INSERT INTO followed_artist
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
