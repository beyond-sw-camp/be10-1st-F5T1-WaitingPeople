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
