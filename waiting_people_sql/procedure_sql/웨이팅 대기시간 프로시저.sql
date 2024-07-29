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