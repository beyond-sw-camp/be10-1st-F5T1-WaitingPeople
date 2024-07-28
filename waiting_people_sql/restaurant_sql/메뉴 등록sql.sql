-- 1. 사진 제외 메뉴 등록 by changyoun
INSERT
  INTO tb_menu(
  					menu_group_seq  	 -- '메뉴 그룹 고유번호'
				 , restaurant_seq  	 -- '음식점 고유번호'
				 , menu_name 		 	 -- '메뉴 이름'
				 , menu_price      	 -- '메뉴 가격'
				 , menu_ingredient 	 -- '메뉴 재료'
				 , menu_detail     	 -- '메뉴 설명'
				 , menu_recommend_yn) -- '메뉴 추천 여부'
VALUES(
		 3
	  , 1
	  , '등록한메뉴1'
	  , 15000
	  , '등록한메뉴의 재료1'
	  , '등록한메뉴설명1'
	  , 'Y');



-- 2. 사진 포함 메뉴 등록 by changyoun
CALL tb_menu_and_img_insert(
									 3 						 -- 메뉴 그룹 고유번호
								  , 1 						 -- 음식점 고유번호
								  , '등록한메뉴2'        -- 메뉴 이름
								  , 15000                -- 메뉴 가격
								  , '등록한메뉴의 재료2' -- 메뉴 재료
								  , '등록한메뉴설명2'    -- 메뉴 설명
								  , 'Y'                  -- 메뉴 추천 여부
								  , '등록사진파일이름1'  -- 사진 파일 이름
								  , '등록사진이름1'      -- 사진 이름
								  , '등록사진url1'       -- 사진 url
								  , 1);                  -- 등록한 사람 고유번호