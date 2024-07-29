-- 평균 별점 조회 by garam
 -- 노출되지않는 리뷰는 제외하고 평균을 계산함. 
SELECT 
       ROUND(AVG(rv.review_rating), 1) '평균별점'
  FROM tb_review rv 
  JOIN tb_restaurant rs ON rv.restaurant_seq  = rs.restaurant_seq 
 WHERE rv.restaurant_seq = 2
   AND rv.visible_yn = 'Y';

-- 리뷰 별점별 조회 by garam
 -- 별점(리뷰가)이 없는 음식점은 고객수가 0으로 표시된다
 -- 노출되지 않는 리뷰는 조회되지 않는다
WITH rating AS(
    SELECT 1.0 AS review_rating UNION ALL
    SELECT 2.0 UNION ALL
    SELECT 3.0 UNION ALL
    SELECT 4.0 UNION ALL
    SELECT 5.0
)
SELECT 
       r.review_rating AS '별점'
     , COALESCE(COUNT(rv.user_id), 0) AS '고객수'
  FROM rating r
  LEFT JOIN tb_review rv 
    ON rv.review_rating = r.review_rating
   AND rv.restaurant_seq = 3
   AND rv.visible_yn = 'Y'
  LEFT JOIN tb_restaurant rs ON rv.restaurant_seq = rs.restaurant_seq
 GROUP BY r.review_rating;

