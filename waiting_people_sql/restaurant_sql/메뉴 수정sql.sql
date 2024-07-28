-- 1. 음식점 메뉴 수정(사진 수정 제외) by changyoun
UPDATE
		 tb_menu
   SET menu_name = '수정 메뉴 이름'
 	  , menu_price = 3000
	  , menu_ingredient = '수정된 메뉴의 재료'
	  , menu_detail = '수정된 메뉴의 설명'
	  , menu_recommend_yn = 'N'
	  , reg_date = CURRENT_TIMESTAMP	
 WHERE menu_seq = 1;
 
 
 
 
 
 
-- 2. 음식점 메뉴 수정(사진 수정 포함) by changyoun
CALL tb_image_file_update(
								  1                             -- 메뉴 고유번호
								, '수정 메뉴 이름'              -- 메뉴 이름
								, 3000                          -- 메뉴 가격
								, '수정된 메뉴의 재료'          -- 메뉴 재료
								, '수정된 메뉴의 설명'          -- 메뉴 재료
								, 'N', '사진 수정 파일 이름 1'  -- 사진 파일 이름
								, '사진 수정 이름 1'            -- 사진 이름
								, '사진 수정 url 1'             -- 사진 url
								, 8);                           -- 등록한 사람 고유번호