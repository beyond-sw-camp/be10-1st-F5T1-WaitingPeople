-- 음식점 메뉴 상세 조회 by changyoun
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