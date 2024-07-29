-- 메뉴 그룹 등록 by changyoun
INSERT
  INTO tb_menu_group(
  					  restaurant_seq     
					, menu_group_name
					, menu_group_detail)
VALUES(
		1
	, '둘이 먹기 딱 좋은!'
	, '둘이 먹기 좋은 양으로 푸짐하게 제공합니다.');
	 
	 
-- 메뉴 그룹 최조 조회 모습 (최초 등록 시간 기준 오래된 순)
-- by changyoun
SELECT
	   menu_group_name
  FROM tb_menu_group
 ORDER BY FIELD(
 				 menu_group_name
 			   , '메인메뉴'
			   , '애피타이저'
			   , '디저트'
			   , '기본메뉴');
  
-- 메뉴 그룹 이름 순으로 조회 (오름차순)
-- by changyoun
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
 		 
-- 메뉴 그룹 이름 순으로 조회 (내림차순)
-- by changyoun
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
 		 
 		 
-- 메뉴 그룹 수정 by changyoun
UPDATE tb_menu_group
   SET menu_group_name = '피자는 성민이얼굴피자~'
	 , menu_group_detail = '얼굴폈니?'
 WHERE restaurant_seq = 1
   AND menu_group_seq = 1;
   
   
   
   
-- 메뉴 그룹 행 삭제 by changyoun
DELETE 
  FROM tb_menu_group
 WHERE menu_group_seq = 1;