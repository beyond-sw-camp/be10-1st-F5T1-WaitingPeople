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
	 
-- 메뉴 그룹 등록시 메뉴 그룹 이름이 필수 인지 확인 by changyoun
INSERT
  INTO tb_menu_group(
  							restaurant_seq
						 , menu_group_name
						 , menu_group_detail)
VALUES(
		 2
	  , '사장님의 비밀 요리'
	  , NULL);