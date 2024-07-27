DELIMITER //

CREATE PROCEDURE tb_image_file_update(
	IN ms INT,           -- 메뉴 고유번호
	IN mn VARCHAR(100),  -- 메뉴 이름
	IN mp INT,           -- 메뉴 가격
	IN mi VARCHAR(500),  -- 메뉴 재료
	IN md VARCHAR(500),  -- 메뉴 설명
	IN mryn CHAR(1),     -- 메뉴 추천 여부
	IN pn VARCHAR(500),  -- 사진 파일 이름
	IN pon VARCHAR(100), -- 사진 이름
	IN pu VARCHAR(500),  -- 사진 url
	IN c INT             -- 등록한 사람 고유번호
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      -- 오류 발생 시 롤백
      ROLLBACK;
      -- 오류 메시지 반환
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, transaction rolled back';
   END;
	START TRANSACTION;
	
	UPDATE
		 tb_menu
   SET menu_name = mn
 	  , menu_price = mp
	  , menu_ingredient = mi
	  , menu_detail = md
	  , menu_recommend_yn = mryn
	  , reg_date = CURRENT_TIMESTAMP	
 	WHERE menu_seq = ms;
	
	UPDATE
			 tb_image_file
		SET delete_yn = 'Y',
			 menu_seq = NULL
	 WHERE menu_seq = ms;

	INSERT
	  INTO tb_image_file(menu_seq
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
