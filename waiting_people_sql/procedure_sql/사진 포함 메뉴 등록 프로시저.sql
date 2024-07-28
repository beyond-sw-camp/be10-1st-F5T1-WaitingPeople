DELIMITER //

CREATE PROCEDURE tb_menu_and_img_insert(
	IN mgs INT, -- menu_group_seq
	IN rs INT, -- restaurant_seq
	IN mn VARCHAR(100), -- menu_name
	IN mp INT, -- menu_price
	IN mi VARCHAR(500), -- menu_ingredient
	IN md VARCHAR(150), -- menu_detail
	IN mryn CHAR(1), -- menu_recommend_yn
	IN pn VARCHAR(500), -- picture_name
	IN pon VARCHAR(100), -- picture_original_name
	IN pu VARCHAR(500), -- picture_url
	IN c INT -- creator
)
BEGIN
	DECLARE ms INT;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      -- 오류 발생 시 롤백
      ROLLBACK;
      -- 오류 메시지 반환
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, transaction rolled back';
   END;
   
   START TRANSACTION;
	
	IF mryn IS NULL then
		SET mryn = 'N';
	END IF;
	
	INSERT
	  INTO tb_menu(
	  		         menu_group_seq
					 , restaurant_seq
					 , menu_name
					 , menu_price
					 , menu_ingredient
					 , menu_detail
					 , menu_recommend_yn)
	VALUES(
			 mgs
		  , rs
		  , mn
		  , mp
		  , mi
		  , md
		  , mryn);
	
	
	SELECT
			 MAX(menu_seq) INTO ms
	  FROM tb_menu;

	INSERT
	  INTO tb_image_file(
								menu_seq
							 , picture_name
							 , picture_original_name
							 , picture_url
							 , creator)
	VALUES(
			 ms
		  , pn
		  , pon
		  , pu
		  , c);
		
	COMMIT;
	
END //

DELIMITER ;
