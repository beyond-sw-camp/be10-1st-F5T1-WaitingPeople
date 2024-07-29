
-- 작성자 : 정의진
-- 음식점 이름 검색
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 WHERE res.restaurant_name LIKE '%한식%'
 GROUP BY res.restaurant_seq;

-- 작성자 : 정의진
-- 음식점 태그 검색
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , t.tag_title
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
  LEFT JOIN tb_restaurant_tag rt ON res.restaurant_seq = rt.restaurant_seq
  LEFT JOIN tb_tag t ON rt.tag_seq = t.tag_seq
 WHERE rt.tag_seq = 1
 GROUP BY res.restaurant_name;

-- 작성자 : 정의진
-- 음식점 주소 검색
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , res.restaurant_address
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 WHERE res.restaurant_address LIKE '%강남구%'
 GROUP BY res.restaurant_name;

-- 작성자 : 정의진
-- 음식점 카테고리 검색
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , ifnull(COUNT(rev.review_seq),0) '리뷰수'
     , rc.category_title
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
  LEFT JOIN tb_restaurant_category rc ON rc.category_seq = res.category_seq
 WHERE rc.category_title LIKE '%중식%'
 GROUP BY res.restaurant_name;

-- 작성자 : 정의진
-- 음식점 메뉴 검색
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , ifnull(im.picture_url,'사진없음') '사진'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
  JOIN tb_menu m ON res.restaurant_seq = m.restaurant_seq
  LEFT JOIN tb_image_file im ON res.restaurant_seq = im.restaurant_seq
 WHERE m.menu_name LIKE '%짜장면%'
 GROUP BY res.restaurant_name;

