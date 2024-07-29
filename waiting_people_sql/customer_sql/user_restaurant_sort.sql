-- 작성자 : 정의진
-- 총 웨이팅 수 추출 함수
DELIMITER $$

CREATE FUNCTION get_total_waiting(
	re_seq INT
)
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE total_waiting INT;
	
   SELECT ifnull(COUNT(*),0) INTO total_waiting
     FROM tb_waiting
    WHERE restaurant_seq=re_seq && waiting_status = '대기';
	
   RETURN total_waiting;
END $$
DELIMITER ;

-- 작성자 : 정의진
-- 메뉴가격 평균 추출 함수
DELIMITER $$

CREATE FUNCTION get_avg_menu(
   re_seq INT
)
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE menu_avg INT;
	
   SELECT IFNULL(AVG(menu_price),0) INTO menu_avg
     FROM tb_menu
    WHERE menu_group_seq NOT IN(4,5,6) && restaurant_seq = re_seq;
	
   RETURN menu_avg;
END $$
DELIMITER ;

-- 작성자 : 정의진
-- 별점 순
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 GROUP BY res.restaurant_name
 ORDER BY AVG(ifnull(rev.review_rating,0)) desc;

-- 작성자 : 정의진
-- 음식점 최신 등록순
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , res.reg_date '등록날짜'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 GROUP BY res.restaurant_name
 ORDER BY res.reg_date desc;

-- 작성자 : 정의진
-- 웨이팅 순
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , get_total_waiting(res.restaurant_seq)'웨이팅수'	
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 GROUP BY res.restaurant_name
 ORDER BY get_total_waiting(res.restaurant_seq) desc;

-- 작성자 : 정의진
-- 리뷰순 
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 GROUP BY res.restaurant_name
 ORDER BY COUNT(rev.review_seq) desc;


-- 작성자 : 정의진
-- 메뉴 가격 평균 순
SELECT 
       res.restaurant_name '음식점이름'
     , TRUNCATE(AVG(ifnull(rev.review_rating,0)), 1) '별점평균'
     , COUNT(rev.review_seq) '리뷰수'
     , get_avg_menu(res.restaurant_seq) '평균가격'
  FROM tb_restaurant res
  LEFT JOIN tb_review rev ON res.restaurant_seq = rev.restaurant_seq
 GROUP BY res.restaurant_name
 ORDER BY get_avg_menu(res.restaurant_seq) desc;
