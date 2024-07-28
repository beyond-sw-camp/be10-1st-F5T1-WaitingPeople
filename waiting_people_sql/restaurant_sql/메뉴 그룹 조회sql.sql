-- 1. 메뉴 그룹 최조 조회 모습 ( 최초 등록 시간 기준 오래된 순)
SELECT
		 menu_group_name
  FROM tb_menu_group
 ORDER BY FIELD(
 					 menu_group_name
 				  , '메인메뉴'
				  , '애피타이저'
				  , '디저트'
				  , '기본메뉴');
  
-- 2. 메뉴 그룹 이름 순으로 조회 (오름차순)
SELECT
		 menu_group_name
  FROM tb_menu_group
 ORDER BY FIELD(
 					 menu_group_name
 				  , '메인메뉴'
				  , '애피타이저'
				  , '디저트'
				  , '기본메뉴'),
 		 menu_group_name;
 		 
-- 3. 메뉴 그룹 이름 순으로 조회 (내림차순)
SELECT
		 menu_group_name
  FROM tb_menu_group
 ORDER BY FIELD(
 					 menu_group_name
 				  , '메인메뉴'
				  , '애피타이저'
				  , '디저트'
				  , '기본메뉴');
 		 menu_group_name DESC;