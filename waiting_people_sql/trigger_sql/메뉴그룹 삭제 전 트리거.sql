DELIMITER //

CREATE TRIGGER before_tb_menu_group_delete
	BEFORE DELETE
	ON tb_menu_group
	FOR EACH ROW
BEGIN
	UPDATE tb_menu
		SET menu_group_seq = (SELECT 
	 									     menu_group_seq
	 								   FROM tb_menu_group
	 								  WHERE menu_group_name = '기본메뉴'
	 					 				 AND restaurant_seq IS NULL)
	 WHERE menu_group_seq = OLD.menu_group_seq;
END //

DELIMITER ;