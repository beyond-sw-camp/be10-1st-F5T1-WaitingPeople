-- 메뉴 등록 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_tb_menu_insert
   BEFORE INSERT
   ON tb_menu
   FOR EACH ROW
BEGIN
   DECLARE default_menu_group_seq INT;

   IF NEW.menu_group_seq IS NULL OR NEW.menu_group_seq <= 0 THEN
   SELECT
          mg.menu_group_seq INTO default_menu_group_seq
     FROM tb_menu_group mg
    WHERE mg.menu_group_name = '기본메뉴'
      AND mg.restaurant_seq IS NULL;
      SET NEW.menu_group_seq = default_menu_group_seq;
   
   ELSEIF NEW.restaurant_seq <= 0 OR NEW.restaurant_seq IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '음식점 등록에 오류가 있습니다. 다시 입력하세요.';
   
   ELSEIF NEW.menu_name IS NULL OR TRIM(NEW.menu_name) = '' THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 이름을 입력하세요.';
   
   ELSEIF NEW.menu_price IS NULL OR NEW.menu_price < 0 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 가격은 양수로 입력하세요.';
   
   END IF;
END //

DELIMITER ;


-- 메뉴 사진 등록 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_menu_tb_image_file_insert
   BEFORE INSERT
   ON tb_image_file
   FOR EACH ROW
BEGIN 
   IF NEW.review_seq IS NULL AND NEW.restaurant_seq IS NULL AND NEW.menu_seq IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '어떤 것과 관련된 사진인지 입력하세요.';
	
   ELSEIF TRIM(NEW.picture_name) = '' OR NEW.picture_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진파일이름 등록은 필수입니다.';
	
   ELSEIF TRIM(NEW.picture_original_name) = '' OR NEW.picture_original_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진 이름 등록은 필수입니다.';
   
   ELSEIF TRIM(NEW.picture_url) = '' OR NEW.picture_url IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진url은 등록은 필수입니다.';
   
   ELSEIF TRIM(NEW.creator) = '' OR NEW.creator IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '등록한 사람ID 등록은 필수입니다.';
   
   END IF;
END //

DELIMITER ;


-- 메뉴 수정 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_tb_menu_update
   BEFORE UPDATE
   ON tb_menu
   FOR EACH ROW
BEGIN
   DECLARE default_menu_group_seq INT;

   IF NEW.menu_group_seq IS NULL OR NEW.menu_group_seq <= 0 THEN
   SELECT
          mg.menu_group_seq INTO default_menu_group_seq
     FROM tb_menu_group mg
    WHERE mg.menu_group_name = '기본메뉴'
      AND mg.restaurant_seq IS NULL;
      SET NEW.menu_group_seq = default_menu_group_seq;
   
   ELSEIF NEW.restaurant_seq <= 0 OR NEW.restaurant_seq IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '음식점 등록에 오류가 있습니다. 다시 입력하세요.';
   
   ELSEIF NEW.menu_name IS NULL OR TRIM(NEW.menu_name) = '' THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 이름을 입력하세요.';
   
   ELSEIF NEW.menu_price IS NULL OR NEW.menu_price < 0 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '메뉴 가격은 양수로 입력하세요.';
   
   END IF;
END //

DELIMITER ;


-- 메뉴 사진 수정 전 조건 확인 트리거
-- by changyoun
DELIMITER //

CREATE TRIGGER before_menu_tb_image_file_update
   BEFORE UPDATE
   ON tb_image_file
   FOR EACH ROW
BEGIN
   IF NEW.review_seq IS NULL AND NEW.restaurant_seq IS NULL AND NEW.menu_seq IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '어떤 것과 관련된 사진인지 입력하세요.';
	
   ELSEIF TRIM(NEW.picture_name) = '' OR NEW.picture_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진파일이름 등록은 필수입니다.';
	
   ELSEIF TRIM(NEW.picture_original_name) = '' OR NEW.picture_original_name IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진 이름 등록은 필수입니다.';
   
   ELSEIF TRIM(NEW.picture_url) = '' OR NEW.picture_url IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '사진url은 등록은 필수입니다.';
   
   ELSEIF TRIM(NEW.creator) = '' OR NEW.creator IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '등록한 사람ID 등록은 필수입니다.';
   
   END IF;
END //

DELIMITER ;
