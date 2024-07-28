-- 메뉴 그룹 등록 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_tb_menu_group_insert
	BEFORE INSERT
	ON tb_menu_group
   FOR EACH ROW
BEGIN
   IF NEW.menu_group_name = '' OR NEW.menu_group_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 그룹을 입력해주세요.';
   END IF;
END //

DELIMITER ;


-- 메뉴 그룹 수정 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_tb_menu_group_update
   BEFORE UPDATE
   ON tb_menu_group
   FOR EACH ROW
BEGIN
   IF NEW.menu_group_name = '' OR NEW.menu_group_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 그룹을 입력해주세요.';
	END IF;
END //

DELIMITER ;


-- 메뉴 그룹 삭제 전 관련 메뉴 기본 메뉴로 바꾸는 트리거
-- by changyoun
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