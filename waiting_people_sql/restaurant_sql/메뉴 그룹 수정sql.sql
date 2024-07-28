--  메뉴 그룹 수정
UPDATE tb_menu_group
	SET menu_group_name = '피자는 성민이얼굴피자~'
	  , menu_group_detail = '얼굴폈니?'
 WHERE restaurant_seq = 1
   AND menu_group_seq = 1;