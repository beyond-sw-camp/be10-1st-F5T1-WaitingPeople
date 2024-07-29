-- 모든 음식점 카테고리 조회 -작성:이성민
SELECT 
       menu_group_seq
     , restaurant_seq
     , menu_group_name
     , menu_group_detail
FROM tb_menu_group 

-- 음식점 카테고리 등록 -작성:이성민
INSERT
  INTO tb_restaurant_category(category_title)
VALUES 
('이탈리아 음식');

SELECT * FROM tb_restaurant_category;

-- 음식점 카테고리 노출 여부 체크 -작성:이성민
SELECT 
       rc.category_seq,
       rc.category_title,
       r.restaurant_name
  FROM tb_restaurant_category rc
  JOIN tb_restaurant r ON rc.category_seq = r.category_seq
 WHERE rc.visible_yn = 'y';
