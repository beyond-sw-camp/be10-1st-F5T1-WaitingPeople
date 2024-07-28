-- 메뉴 전체 최초 조회
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


-- 1. 메뉴 그룹 별로 조회(그룹별 오름차순) 
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
 		
		 
		 	 
 			 
-- 1-1. 메뉴 그룹별 조회(그룹별 내림차순) 
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
 

 

-- 2. 메뉴 이름순으로 조회(오름차순) 
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
 ORDER BY m.menu_name;
			 
			 
			 
-- 2-1. 메뉴 이름순으로 조회(내림차순) 
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
 ORDER BY m.menu_name DESC;		 
			 


-- 3. 메뉴 등록일 순으로 조회(오래된 순)
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
 ORDER BY m.reg_date;
 
 
 
-- 3-1. 메뉴 등록일 순으로 조회(최신 순)
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
 ORDER BY m.reg_date DESC;