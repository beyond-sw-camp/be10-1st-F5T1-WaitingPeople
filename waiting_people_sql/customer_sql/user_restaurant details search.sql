-- 음식점 상세 조회 --
-- 음식점 상세 정보 조회 -작성: 이성민
SELECT 
       r.restaurant_name
	  , r.restaurant_phone
	  , r.restaurant_address
	  , CONCAT(r.open_hour, ' ~ ', r.close_hour) AS restaurant_hours
	  , r.restaurant_state
	  , r.restaurant_enter_yn,
     GROUP_CONCAT(CONCAT(m.menu_name, '가격:', m.menu_price) SEPARATOR ', ') AS menu_details
  FROM tb_restaurant r
  LEFT JOIN tb_menu m ON r.restaurant_seq = m.restaurant_seq
 WHERE r.restaurant_seq =1
 GROUP BY r.restaurant_seq;

START TRANSACTION;

UPDATE tb_restaurant
   SET 
	    open_hour = '09:00:00'
	  , close_hour = ADDTIME('09:00:00', '12:00:00')
 WHERE restaurant_seq =1;

UPDATE tb_restaurant
	SET 
       restaurant_state = CASE
       WHEN CURRENT_TIME BETWEEN open_hour AND close_hour THEN 'open'
         ELSE 'close'
      END
 WHERE restaurant_seq =1;

COMMIT;

-- 음식점 메뉴 상세 정보 조회 -작성: 이성민
SELECT 
       m.menu_name
	  , m.menu_price
	  , i.picture_url
	  , m.menu_detail
	  , m.menu_ingredient
	  , mg.menu_group_name
  FROM tb_restaurant r
  JOIN tb_menu m ON r.restaurant_seq = m.restaurant_seq
  LEFT JOIN tb_image_file i ON m.menu_seq = i.menu_seq
  LEFT JOIN tb_menu_group mg ON m.menu_group_seq = mg.menu_group_seq
 WHERE 
    r.restaurant_seq = 1;
        
-- 음식점 전체 리뷰 조회 -작성: 이성민
SELECT 
       user_id
	  , rv.review_rating
     , rvc.reg_date
	  , i.picture_url
	  , rv.review_seq
	  , rv.review_content
     , COALESCE(rv.mod_date, rv.reg_date) as mod_date
	  , rv.delete_yn
	  , rvc.comment_content
	  , rvc.review_seq
  FROM tb_restaurant r
  JOIN tb_review rv ON r.restaurant_seq = rv.restaurant_seq
  LEFT JOIN tb_review_comment rvc ON rv.review_seq = rvc.review_seq 
  LEFT JOIN tb_image_file i ON rv.review_seq = i.review_seq   
 WHERE 
    r.restaurant_seq = 1;

-- 음식점 사진 포함 리뷰 조회 -작성: 이성민
SELECT 
       rv.user_id
	  , rv.review_rating
	  , rvc.reg_date AS comment_reg_date
	  , i.picture_url
	  , rv.review_seq
	  , rv.review_content
	  , COALESCE(rv.mod_date, rv.reg_date) as mod_date
	  , rv.delete_yn
	  , rvc.comment_content
	  , rvc.review_seq AS comment_review_seq
  FROM tb_restaurant r
  JOIN tb_review rv ON r.restaurant_seq = rv.restaurant_seq
  LEFT JOIN tb_review_comment rvc ON rv.review_seq = rvc.review_seq
  LEFT JOIN tb_image_file i ON rv.review_seq = i.review_seq
 WHERE r.restaurant_seq = 1
 AND i.picture_url IS NOT NULL;

-- 음식점 전체 리뷰 시간순 정렬 -작성: 이성민
SELECT 
       r.restaurant_name
	  , rv.review_seq
	  , rv.user_seq
	  , rv.review_content AS review_content
	  , rv.review_rating
	  , rv.reg_date AS review_reg_date
	  , rv.delete_yn
	  , i.picture_url
	  , rvc.comment_content 
  FROM tb_restaurant r
  JOIN tb_review rv ON r.restaurant_seq = rv.restaurant_seq
  LEFT JOIN tb_review_comment rvc ON rv.review_seq = rvc.review_seq  
  LEFT JOIN tb_image_file i ON rv.review_seq = i.review_seq  
 WHERE r.restaurant_seq = 1  
 ORDER BY 
    rv.reg_date DESC;

-- 음식점 전체 리뷰 별점 순 정렬 -작성: 이성민
SELECT 
       r.restaurant_name
	  , rv.review_seq
	  , rv.user_seq
	  , rv.review_content AS review_content
	  , rv.review_rating
	  , rv.reg_date AS review_reg_date
	  , rv.delete_yn
	  , i.picture_name
	  , i.picture_original_name
	  , i.picture_url
	  , rvc.comment_content 
  FROM tb_restaurant r
  JOIN tb_review rv ON r.restaurant_seq = rv.restaurant_seq
  LEFT JOIN tb_review_comment rvc ON rv.review_seq = rvc.review_seq 
  LEFT JOIN tb_image_file i ON rv.review_seq = i.review_seq 
 WHERE r.restaurant_seq = 1  
ORDER BY 
    rv.review_rating DESC;