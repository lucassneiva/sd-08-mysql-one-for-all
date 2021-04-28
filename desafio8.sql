USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON `Usuario`
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.Usuario_Artista WHERE usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.Usuario_Cancao WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
