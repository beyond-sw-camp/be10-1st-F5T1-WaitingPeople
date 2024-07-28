DELIMITER //

CREATE TRIGGER before_tb_menu_delete
	BEFORE DELETE
	ON tb_menu
	FOR EACH ROW
BEGIN
	UPDATE
			 tb_image_file
	   SET delete_yn = 'Y',
	   	 menu_seq = NULL
	 WHERE menu_seq = OLD.menu_seq;
END //

DELIMITER ;