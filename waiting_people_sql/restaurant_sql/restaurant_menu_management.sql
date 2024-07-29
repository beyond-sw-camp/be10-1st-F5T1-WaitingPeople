-- 사진 제외 메뉴 등록 by changyoun
INSERT
  INTO tb_menu(
  				menu_group_seq      -- 메뉴 그룹 고유번호
			  , restaurant_seq      -- 음식점 고유번호
			  , menu_name           -- 메뉴 이름
			  , menu_price          -- 메뉴 가격
			  , menu_ingredient     -- 메뉴 재료
			  , menu_detail         -- 메뉴 설명
			  , menu_recommend_yn)  -- 메뉴 추천 여부
VALUES(
	    3
	  , 1
	  , '등록메뉴이름'
	  , 15000
      , '등록한메뉴의 재료1'
	  , '등록한메뉴설명1'
	  , 'Y');
	  
	  
-- 사진 포함 메뉴 등록 by changyoun

INSERT
  INTO tb_image_file(
                      menu_seq               -- 메뉴 고유번호
                    , picture_name           -- 사진 파일 이름
                    , picture_original_name  -- 사진 이름
                    , picture_url            -- 사진 url
                    , creator)               -- 등록한 사람ID
VALUES(
        1
      , '사진파일이름'
      , '사진이름'
      , '사진url'
      , 'test8');




-- 메뉴 그룹 최초 조회
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
     , img.picture_original_name AS '메뉴 사진 이름'
	 , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 3 
 ORDER BY FIELD(
 				 mg.menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴');
				  



-- 메뉴 그룹 별로 조회(그룹별 오름차순)
-- by changyoun
SELECT
		 m.menu_name AS '메뉴 이름'
	  , m.menu_price AS '메뉴 가격'
	  , mg.menu_group_name AS '메뉴 그룹 이름'
	  , m.reg_date AS '메뉴 등록일'
	  , img.picture_name AS '메뉴 사진 파일 이름'
	  , img.picture_original_name AS '메뉴 사진 이름'
	  , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 3 
 ORDER BY FIELD(
 				 mg.menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴'),
 		  mg.menu_group_name;
 
-- 메뉴 그룹별 조회(그룹별 내림차순)
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
	 , img.picture_original_name AS '메뉴 사진 이름'
	 , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 3 
 ORDER BY FIELD(
 				 mg.menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴'),
 		  mg.menu_group_name DESC;

-- 메뉴 이름순으로 조회(오름차순)
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
	 , img.picture_original_nameas AS '메뉴 사진 이름'
	 , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 3 
 ORDER BY FIELD(
 			     mg.menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴'),
		  m.menu_name, 
		  mg.menu_group_name;

-- 메뉴 이름순으로 조회(내림차순)
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
	 , img.picture_original_name AS '메뉴 사진 이름'
	 , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 3 
 ORDER BY FIELD(
 				 mg.menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴'),
 		  m.menu_name DESC,
		  mg.menu_group_name;
 
-- 메뉴 등록일 순으로 조회(오래된 순)
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
	 , img.picture_original_name AS '메뉴 사진 이름'
     , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 1 
 ORDER BY m.reg_date;

-- 메뉴 등록일 순으로 조회(최신 순)
-- by changyoun
SELECT
	   m.menu_name AS '메뉴 이름'
	 , m.menu_price AS '메뉴 가격'
	 , mg.menu_group_name AS '메뉴 그룹 이름'
	 , m.reg_date AS '메뉴 등록일'
	 , img.picture_name AS '메뉴 사진 파일 이름'
	 , img.picture_original_name AS '메뉴 사진 이름'
	 , img.picture_url AS '메뉴 사진 url'
  FROM tb_menu m
  LEFT JOIN tb_image_file img ON (m.menu_seq = img.menu_seq)
  LEFT JOIN tb_menu_group mg ON (m.menu_group_seq = mg.menu_group_seq)
 WHERE m.restaurant_seq = 1 
 ORDER BY m.reg_date DESC;




--	음식점 메뉴 상세 조회 by changyoun
SELECT 
	   m.menu_name AS '메뉴 이름'
     , m.menu_price AS '메뉴 가격'
     , m.menu_ingredient AS '메뉴 재료'
     , m.menu_detail AS '메뉴 설명'
     , m.menu_recommend_yn AS '메뉴 추천 여부'
     , mg.menu_group_name AS '메뉴 그룹 이름'
     , img.picture_name AS '사진 파일 이름'
     , img.picture_original_name AS '사진 이름'
     , img.picture_url AS '사진 url' 
  FROM tb_menu m
  JOIN tb_image_file img ON(m.menu_seq = img.menu_seq)
  JOIN tb_menu_group mg ON(m.menu_group_seq = mg.menu_group_seq)
 WHERE m.menu_seq = 1;
 
 
-- 음식점 메뉴 수정 (사진 수정 제외) 
-- by changyoun
UPDATE
	   tb_menu
   SET menu_name = '수정 메뉴 이름'
 	 , menu_price = 3000
	 , menu_ingredient = '수정된 메뉴의 재료'
	 , menu_detail = '수정된 메뉴의 설명'
	 , menu_recommend_yn = 'N'
	 , reg_date = CURRENT_TIMESTAMP	
 WHERE menu_seq = 1;

-- 음식점 메뉴 수정 (사진 수정 포함) 
-- by changyoun
UPDATE
	   tb_menu
   SET menu_name = '수정 메뉴 이름'
 	 , menu_price = 3000
	 , menu_ingredient = '수정된 메뉴의 재료'
	 , menu_detail = '수정된 메뉴의 설명'
	 , menu_recommend_yn = 'N'
	 , reg_date = CURRENT_TIMESTAMP	
 WHERE menu_seq = 1;

UPDATE tb_image_file
   SET picture_name = '수정된사진파일이름'
     , picture_original_name = '수정된사진이름'
     , picture_url = ''
     , reg_date = CURRENT_TIMESTAMP
     , creator = 'test8'
 WHERE picture_seq = 7;
 

-- 사진 삭제 by changyoun
DELETE
  FROM tb_image_file
 WHERE picture_seq = 1;
 
 

--	음식점 메뉴 삭제 by changyoun
DELETE
  FROM tb_menu
 WHERE menu_seq = 1;

