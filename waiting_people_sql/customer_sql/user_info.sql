-- 회원정보 조회 by ayeong
START TRANSACTION;
SELECT
    user_id
     , user_password
     , user_name
     , user_phone
     , user_type
     , reg_date
     , adult_verify_yn
FROM tb_user
 WHERE user_password = 'Ayeong54321';


-- 회원정보 수정 by ayeong
START TRANSACTION;

UPDATE tb_user
SET user_name = '아영'
  , user_phone = '01065439876'
  , user_password = 'Ayeong12345'
 WHERE user_id = 'Ayeong1';

COMMIT;

SELECT
    user_name
     , user_phone
     , user_password
FROM tb_user
 WHERE user_id = 'Ayeong1' AND user_password = 'Ayeong12345';


-- 내 웨이팅 내역 전체 조회 by ayeong
START TRANSACTION;
SELECT
    rt.restaurant_name
     , wt.waiting_status
     , wt.waiting_date
FROM tb_restaurant rt
         JOIN tb_waiting wt ON rt.restaurant_seq = wt.restaurant_seq
 WHERE wt.user_seq = '1';


-- 내가 쓴 리뷰 조회 by ayeong
START TRANSACTION;
SELECT
    review_seq
     , review_content
     , review_rating
     , reg_date
     , mod_date
     , delete_date
     , delete_yn
     , visible_yn
FROM tb_review
 WHERE user_id = 'test1';
--  3번 리뷰에 대한 이미지 파일들 조회
SELECT
    picture_name
     , picture_original_name
     , picture_url
FROM tb_image_file
 WHERE EXISTS ( SELECT
                   1
               FROM tb_review
               WHERE review_seq = '3' )
  AND review_seq = '3' AND creator = 'Ayeong1';

-- 내가 쓴 리뷰 수정 by ayeong
START TRANSACTION;
-- 리뷰 사진 추가
INSERT
INTO tb_image_file (
                     review_seq
                   , picture_name
                   , picture_original_name
                   , picture_url
                   , reg_date
                   , creator
)
VALUES (
       , '3'
       , 'sweetpotato_pizza.jpg'
       , 'sweetpotato_pizza_original.jpg'
       , 'http://example.com/images/sweetpotato_pizza.jpg'
       , CURRENT_TIMESTAMP()
       , 'Ayeong1'
       )
-- 리뷰 사진 삭제
DELETE
FROM tb_image_file
 WHERE review_seq = '3' AND picture_seq = '2';
-- 리뷰 내용 수정
UPDATE tb_review
SET review_content = "수정합니다"
  , review_rating = "5.0"
  , mod_date = CURRENT_TIMESTAMP()
 WHERE review_seq = '3';

COMMIT;

SELECT
    rv.review_content
     , rv.review_rating
     , rv.mod_date
     , imf.picture_name
     , imf.picture_original_name
     , imf.picture_url
FROM tb_review rv
         JOIN tb_image_file imf ON rv.review_seq = imf.review_seq
 WHERE rv.review_seq = '3';

-- 내가 쓴 리뷰 삭제 by ayeong
DELETE FROM tb_review
 WHERE review_seq = '3';

SELECT
    rv.review_content
     , rv.review_rating
     , rv.mod_date
     , imf.picture_name
     , imf.picture_original_name
     , imf.picture_url
     , rvc.comment_content
FROM  tb_image_file imf
          JOIN tb_review rv ON imf.review_seq = rv.review_seq
          JOIN tb_review_comment rvc ON rv.review_seq = rvc.review_seq
 WHERE rv.review_seq = '3';
