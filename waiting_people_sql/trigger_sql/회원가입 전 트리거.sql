DROP TRIGGER IF EXISTS before_insert_user;

DELIMITER //

CREATE TRIGGER before_insert_user
    BEFORE INSERT
    ON tb_user
    FOR EACH ROW
BEGIN
    IF new.user_id = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '아이디를 입력해주세요.';

    ELSE IF new.user_password = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '비밀번호를 입력해주세요.';

    ELSE IF new.user_name = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이름을 입력해주세요.';

    ELSE IF new.user_phone = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '전화번호를 입력해주세요.';

    ELSE IF new.user_type = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '회원 타입을 선택해주세요.';
    END IF;

    END //

DELIMITER ;