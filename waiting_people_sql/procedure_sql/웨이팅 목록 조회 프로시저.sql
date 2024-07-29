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