-- 작성자 : 정의진
-- 웨이팅 알림 생성 기능 트리거
delimiter //
CREATE TRIGGER after_wating_insert
   AFTER insert
   ON tb_waiting
   FOR EACH row
BEGIN
   INSERT
     INTO tb_waiting_alarm(alarm_seq, waiting_seq, alarm_content)
   VALUES (NEW.waiting_seq,NEW.waiting_seq, '고객님의 웨이팅이 등록되었습니다.');
END //
delimiter ;

-- 작성자 : 정의진
-- 웨이팅 등록 확정 트리거
delimiter //
CREATE TRIGGER after_update_arlam
   AFTER update
   ON tb_waiting_alarm
   FOR EACH row
BEGIN
   UPDATE tb_waiting
      SET waiting_status = '입장', enter_date = NOW()
    WHERE waiting_seq = NEW.waiting_seq AND NEW.accept_yn = 'Y' AND cancel_yn = 'N';
END //
delimiter ;


-- 작성자 : 정의진
-- 웨이팅 등록, 웨이팅 알림 등록 기능
INSERT
  INTO tb_waiting(waiting_seq, user_seq, restaurant_seq, headcount, phone_number)

-- 작성자 : 정의진
-- 웨이팅 등록 여부를 확인하기 위한 select절 서브쿼리
SELECT 100, 1,1,3,'01012345678'
  FROM tb_restaurant
 WHERE restaurant_seq = 1 && restaurant_enter_yn = 'N';

-- 작성자 : 정의진
-- 웨이팅 입장 완료
UPDATE tb_waiting_alarm
   SET accept_yn = 'Y'
 WHERE waiting_seq = 100;

-- 작성자 : 정의진
-- 웨이팅 취소 기능
UPDATE tb_waiting
   SET cancel_yn = 'Y'
 WHERE waiting_seq = 100;
