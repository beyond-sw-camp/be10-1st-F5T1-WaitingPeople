-- 웨이팅 팀수 조회 by garam
-- 웨이팅 중인 팀 수와 총 대기인원수를 조회할 수 있다.
SELECT
       COUNT(*) AS '대기팀수'
     , SUM(headcount) '대기인원'
  FROM tb_waiting
 WHERE restaurant_seq = 2
   AND waiting_status = '대기'
   AND cancel_yn = 'N'
   AND DATE(waiting_date) = DATE(NOW());

-- 웨이팅 목록 조회 by garam
-- 실시간 웨이팅 목록과 웨이팅을 등록한 고객의 웨이팅 정보
-- (인원수, 전화번호, 대기시작시간, 현재 대기시간, 방문횟수)를 조회할 수 있다.

  -- 프로시저를 통해 위 팀수와 같이 조회 가능하게 구현
DELIMITER $$

CREATE OR REPLACE PROCEDURE get_waiting_info(
   IN restaurant_id INT
)
BEGIN
    -- 대기 중인 팀 수 조회
    SELECT
           COUNT(*) AS '대기팀수'
         , SUM(headcount) '총대기인원수'
      FROM tb_waiting
     WHERE restaurant_seq = restaurant_id
       AND waiting_status = '대기'
       AND cancel_yn = 'N'
       AND DATE(waiting_date) = DATE(NOW());

    -- 대기 중인 사람들의 목록 조회
    SELECT
           w.user_seq AS '고객번호',
           COALESCE(vc.visit_count, 0) AS '방문횟수',
           w.headcount AS '인원수',
           w.waiting_date AS '대기시작일시',
           w.phone_number AS '전화번호',
           TIMESTAMPDIFF(MINUTE, w.waiting_date, NOW()) AS '대기 시간(분)'
      FROM tb_waiting w
      LEFT JOIN tb_user u ON w.user_seq = u.user_seq
      LEFT JOIN (SELECT
       	  		        user_seq
       		          , COUNT(*) AS visit_count
 		           FROM tb_waiting
    		      WHERE waiting_status = '입장'
    		      GROUP BY user_seq
                ) vc ON w.user_seq = vc.user_seq
     WHERE w.restaurant_seq = restaurant_id
       AND w.waiting_status = '대기'
       AND cancel_yn = 'N'
       AND DATE(waiting_date) = DATE(NOW())
     ORDER BY w.waiting_date;
     
END $$

DELIMITER ;

 -- 음식점 번호를 통한 프로시저 호출
CALL get_waiting_info(2);


-- 오늘의 웨이팅 평균, 최대, 최소 대기시간 분석 by garam
SELECT 
	   AVG(TIMESTAMPDIFF(MINUTE, w.waiting_date, w.enter_date)) '평균대기시간'
	 , MAX(TIMESTAMPDIFF(MINUTE, w.waiting_date, w.enter_date)) '최대대기시간'
	 , MIN(TIMESTAMPDIFF(MINUTE, w.waiting_date, w.enter_date)) '최소대기시간'
  FROM tb_waiting w 
 WHERE restaurant_seq = 5
   AND waiting_status = '입장'
   AND DATE(waiting_date) = CURDATE();


-- 웨이팅 대기시간 예상(시간대별) by garam
  -- 입장확정했던 고객이 없으면 통계가 조회되지 않는다
SELECT  
       HOUR(w.waiting_date) AS '시간대'
     , AVG(TIMESTAMPDIFF(MINUTE, w.waiting_date, w.enter_date)) AS '평균대기시간'
  FROM tb_waiting w
 WHERE restaurant_seq = 2
   AND waiting_status = '입장'
   AND cancel_yn = 'N'
 GROUP BY HOUR(waiting_date);

-- 웨이팅 대기시간 예상(요일, 시간대별) by garam
 -- 프로시저 구현
DELIMITER $$

CREATE OR REPLACE PROCEDURE get_avg_waiting_time(
    IN restaurant_id INT
)
BEGIN
    SELECT
           CASE DAYOFWEEK(w.waiting_date)
           WHEN 1 THEN '일요일'
           WHEN 2 THEN '월요일'
           WHEN 3 THEN '화요일'
           WHEN 4 THEN '수요일'
           WHEN 5 THEN '목요일'
           WHEN 6 THEN '금요일'
           WHEN 7 THEN '토요일'
            END AS 요일 
         , HOUR(w.waiting_date) AS 시간대
         , AVG(TIMESTAMPDIFF(MINUTE, w.waiting_date, w.enter_date)) AS 평균대기시간
      FROM tb_waiting w
     WHERE restaurant_seq = restaurant_id 
       AND waiting_status = '입장'
     GROUP BY 요일, 시간대
     ORDER BY FIELD(요일
                  , '일요일'
                  , '월요일'
                  , '화요일'
                  , '수요일'
                  , '목요일'
                  , '금요일'
                  , '토요일'
                 ), 시간대;
END $$

DELIMITER ;

 -- 프로시저 호출(음식점 번호)
CALL get_avg_waiting_time(2);

 -- 함수 구현(요일,시간대별 예상대기시간)
DELIMITER $$

CREATE OR REPLACE FUNCTION fn_get_avg_waiting_time(
    restaurant_id INT
  , day_of_week_param VARCHAR(10)
  , hour_of_day_param INT
)
RETURNS DECIMAL(10, 0)
DETERMINISTIC
BEGIN
    DECLARE avg_wait_time DECIMAL(10, 1);

    SELECT AVG(TIMESTAMPDIFF(MINUTE, waiting_date, enter_date))
      INTO avg_wait_time
      FROM tb_waiting
     WHERE restaurant_seq = restaurant_id
       AND waiting_status = '입장'
       AND CASE DAYOFWEEK(waiting_date)
           WHEN 1 THEN '일요일'
           WHEN 2 THEN '월요일'
           WHEN 3 THEN '화요일'
           WHEN 4 THEN '수요일'
           WHEN 5 THEN '목요일'
           WHEN 6 THEN '금요일'
           WHEN 7 THEN '토요일'
          END = day_of_week_param
       AND HOUR(waiting_date) = hour_of_day_param;

    RETURN avg_wait_time;
END $$

DELIMITER ;

 -- 함수 활용(음식점 번호, 요일, 시간대)
SELECT fn_get_avg_waiting_time(2, '일요일', 1);

