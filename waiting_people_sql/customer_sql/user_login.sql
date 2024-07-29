-- 회원가입 by ayeong
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Ayeong1'
     , 'Test0000'
     , '전아영'
     , '01062116935'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
               (SELECT
                     1
                  FROM tb_user
               WHERE user_id = 'Ayeong1' OR user_phone = '01062116935'); 
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Uijin1'
     , 'Test0000'
     , '정의진'
     , '01012349876'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
               (SELECT
                     1
                  FROM tb_user
               WHERE user_id = 'Uijin1' OR user_phone = '01012349876');
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Chanyoun1'
     , 'Test0000'
     , '이창윤'
     , '01065328795'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
               (SELECT
                     1
                  FROM tb_user
               WHERE user_id = 'Chanyoun1' OR user_phone = '01065328795');
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Sungmin1'
     , 'Test0000'
     , '이성민'
     , '01055552222'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
               (SELECT
                     1
                  FROM tb_user
               WHERE user_id = 'Sungmin1' OR user_phone = '01055552222');
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Garam1'
     , 'Test0000'
     , '남가람'
     , '01066668888'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
               (SELECT
                     1
                  FROM tb_user
               WHERE user_id = 'Garam1' OR user_phone = '01066668888');
INSERT
INTO tb_user(
              user_id
            , user_password
            , user_name
            , user_phone
            , user_type
            , adult_verify_yn
)
SELECT
    'Sanghyun1'
     , 'Test0000'
     , '박상현'
     , '01077771111'
     , 'C'
     , 'Y'
    WHERE NOT EXISTS
                  (SELECT
                        1
                     FROM tb_user
                    WHERE user_id = 'Sanghyun1' OR user_phone = '01077771111');
COMMIT;
SELECT * FROM tb_user;


-- 로그인 by ayeong
START TRANSACTION;
SELECT
    user_name
FROM tb_user
WHERE user_id = 'Ayeong1' AND user_password = 'Ayeong12345';


-- 아이디 찾기 by ayeong
START TRANSACTION;
SELECT
    user_id
FROM tb_user
WHERE user_name = '전아영' AND user_phone = '01062116935';


-- 임시 비밀번호 발급 및 로그인 by ayeong
START TRANSACTION;

SELECT
    user_name
     , user_password
FROM tb_user
WHERE user_id = 'Ayeong1';

UPDATE tb_user
SET user_password = 'Ayeong54321'
WHERE user_name = '전아영'
  AND user_id = 'Ayeong1'
  AND user_phone = '01062116935';

COMMIT;

SELECT
    user_name
     , user_password
FROM tb_user
WHERE user_id = 'Ayeong1' AND user_password = 'Ayeong54321';

-- 회원 탈퇴 by ayeong
UPDATE tb_user
SET withdraw_yn = 'Y'
  , mod_date = SYSDATE()
WHERE user_id = 'Ayeong1' AND user_password = 'Ayeong12345';

SELECT
    user_name
     , mod_date
     , withdraw_yn
FROM tb_user
WHERE user_id = 'Ayeong1' AND user_password = 'Ayeong12345';