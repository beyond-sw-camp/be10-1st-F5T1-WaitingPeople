-- 작성자: 정의진
-- 웨이팅 입장 확정 트리거
delimiter //
CREATE TRIGGER after_update_arlam
	AFTER update
	ON tb_waiting_alarm
	FOR EACH row
BEGIN
	UPDATE tb_waiting
	   SET waiting_status = '입장', enter_date = NOW()
	 WHERE waiting_seq = NEW.waiting_seq AND NEW.accept_yn = 'Y';
END //
delimiter ;