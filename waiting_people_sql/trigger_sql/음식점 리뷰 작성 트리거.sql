-- 음식점 리뷰 작성 --
-- 음식점 입장유무 체크 -작성: 이성민
DELIMITER //

CREATE TRIGGER check_user_status_before_insert
BEFORE INSERT ON tb_review
FOR EACH ROW
BEGIN
    DECLARE user_status VARCHAR(10);

    SELECT waiting_status INTO user_status
    FROM tb_waiting
    WHERE user_seq = NEW.user_id;

    IF user_status != '입장' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '리뷰 댓글 작성 불가: 입장이 아닙니다';
    END IF;
END//

DELIMITER ;

UPDATE tb_waiting
SET waiting_status = '입장'
WHERE user_seq = 1;

UPDATE tb_waiting
SET waiting_status = '대기'
WHERE user_seq = 2;

SHOW TRIGGERS LIKE 'tb_review';

INSERT INTO tb_review (user_id, review_content) VALUES (2, '테스트 리뷰');

-- 리뷰 별점 체크 -작성: 이성민
DELIMITER //

CREATE TRIGGER check_review_rating_before_insert
BEFORE INSERT ON tb_review
FOR EACH ROW
BEGIN
    IF NEW.review_rating NOT IN (1.0, 2.0, 3.0, 4.0, 5.0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '리뷰 별점은 1.0, 2.0, 3.0, 4.0, 5.0 중 하나여야 합니다';
    END IF;
END//

CREATE TRIGGER check_review_rating_before_update
BEFORE UPDATE ON tb_review
FOR EACH ROW
BEGIN
    IF NEW.review_rating NOT IN (1.0, 2.0, 3.0, 4.0, 5.0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '리뷰 별점은 1.0, 2.0, 3.0, 4.0, 5.0 중 하나여야 합니다';
    END IF;
END//

DELIMITER ;

INSERT INTO tb_review (review_rating) 
VALUES (3.5); 