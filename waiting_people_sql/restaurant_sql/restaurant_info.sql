-- 자영업자 회원 가입 추가
INSERT 
  INTO tb_user(
                user_id
              , user_password
              , user_name
              , user_phone
              , user_type)
VALUES 
       ('hyun', '0519', '박상현', '01074741234', 'R') 
     , ('ram', '0929', '남가람', '01072661234', 'R')
     , ('yun', '0220', '이창윤', '01050402215', 'R'); -- user_type C

-- 사업자 등록증 등록   
INSERT 
  INTO tb_business_license(
                            business_number
                          , user_seq
                          , certification_yn
)
VALUES
       ('1528742267',12,'Y')
     , ('1623844525',12,'Y') 
     , ('4523351120',13,'Y')
     , ('1824235542',14,'Y');

-- 자영업자 음식점 등록
-- 자영업자가 자신의 음식점 상세정보(음식점 이름, 주소, 전화번호, 영업시간,사진)을 등록할 수 있다.
-- 자영업자 음식점 등록
INSERT 
  INTO tb_restaurant(
                      user_seq
                    , business_number
                    , category_seq
                    , restaurant_name
                    , restaurant_phone
                    , restaurant_address
                    , open_hour
                    , close_hour
                    , approve_yn
)
VALUES 
       (10, '1623844525', 4, '우리동네스시신조', '01074741234', '수원시 장안구화서동', '09:00:00', '21:30:00','Y')
     , (12, '1623844525', 1, '엄마손칼국수', '0215244742', '서울시 동작구 신림동', '09:00:00', '15:00:00','Y')
     , (13, '4523351120', 2, '우리엄마김치찌개', '0247894542', '서울시 마포구 대흥동', '09:00:00', '20:00:00','Y')
     , (14, '1824235542', 4, '우동카덴', '0234530042', '서울시 강남구 역삼동', '12:00:00', '22:00:00','Y'); 
         

-- 음식점 사진을 등록 할 수 있다.
DELIMITER //

CREATE PROCEDURE tb_image_file_update(
   IN ms INT,
   IN pn VARCHAR(500),
   IN pon VARCHAR(100),
   IN pu VARCHAR(500),
   IN c INT
)
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      -- 오류 발생 시 롤백
      ROLLBACK;
      -- 오류 메시지 반환
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, transaction rolled back';
   END;
   
   START TRANSACTION;

   UPDATE
          tb_image_file
      SET delete_yn = 'Y',
          menu_seq = NULL
    WHERE menu_seq = ms;

   INSERT
     INTO tb_image_file(menu_seq
                        , picture_name
                      , picture_original_name
                      , picture_url
                      , creator)
   VALUES(
          ms
        , pn
        , pon
        , pu
        , c);
        
   COMMIT;
                          
END //

DELIMITER ;  

INSERT 
  INTO tb_image_file (
                       picture_name
                     , picture_original_name
                     , picture_url, reg_date
                     , creator
                     , delete_yn
                     , restaurant_seq
)
VALUES
       ('칼국수.jpg', '칼국수_original.jpg', 'http://example.com/images/칼국수.jpg', '2024-07-24 12:00:00', 'hyun', 7)
     , ('김치찌개.jpg', '김치찌개_original.jpg', 'http://example.com/images/김치찌개.jpg', '2024-07-24 12:00:00', 'ram', 8)
     , ('냉우동.jpg', '냉우동_original.jpg', 'http://example.com/images/냉우동.jpg', '2024-07-24 12:00:00', 'yun', 9);


-- 자영업자는 자신의 음식점에 맞는 태그를 지정할 수 있다
-- 태그 추가
INSERT INTO tb_restaurant_tag (
                                restaurant_seq, tag_seq
)
VALUES (5, 3), (4, 3), (4, 6);   
 

-- 자영업자는 알림을 등록할 수 있다.
-- 알림 추가
INSERT INTO tb_notice(
                       notice_title
                     , notice_content
                     , restaurant_seq
)
VALUES ('리뷰이벤트', '11시 이전 방문 5프로 할인.', 4);
   
-- 한명의 자영업자가 여러개의 음식점을 가지고 있을 때 자신이 등록한 음식점을 조회할 수 있다.
SELECT
       u.user_name 
     , r.restaurant_name 
     , r.restaurant_phone 
     , r.restaurant_address 
  FROM tb_user u
  JOIN tb_restaurant r ON u.user_seq = r.user_seq
 WHERE r.user_seq = 8;

-- 자영업자가 자신이 등록한 자신의 음식점 태그를 조회할 수 있다. 
SELECT
       r.restaurant_name
     , t.tag_title
  FROM tb_restaurant r
  -- JOIN tb_user u ON u.user_seq = r.user_seq
  JOIN tb_restaurant_tag rt ON r.restaurant_seq = rt.restaurant_seq
  JOIN tb_tag t ON t.tag_seq = rt.tag_seq
 WHERE r.restaurant_seq = 4;
 
-- 자영업자가 자신의 음식점 사진을 조회할 수 있다
SELECT
       r.restaurant_name
     , r.restaurant_address
     , r.restaurant_phone
     , r.open_hour
     , imf.picture_url
  FROM tb_image_file imf
  JOIN tb_restaurant r ON r.restaurant_seq = imf.restaurant_seq   
 WHERE r.restaurant_name = '한식집';
 
-- 자영업자가 자신의 음식점 상세정보(음식점 이름, 주소 등)을 수정할 수 있다

UPDATE tb_restaurant
   SET restaurant_phone = '01074745101'
     , restaurant_address = '수원시 장안구 정자로'
 WHERE restaurant_seq = 6;
 
-- 자영업자는 자신의 음식점과 같은 업종의 음식점을 카테고리를 통해 검색해볼 수 있다.
WITH targetcategory AS (
                        SELECT category_title
                          FROM tb_restaurant_category rc
                          JOIN tb_restaurant r ON rc.category_seq = r.category_seq
                         WHERE restaurant_name = '우리동네스시신조'
)

SELECT DISTINCT 
                r.restaurant_name
              , rc.category_title
              , r.restaurant_address
           FROM tb_restaurant r
           JOIN tb_restaurant_category rc ON r.category_seq = rc.category_seq
          WHERE rc.category_title IN (SELECT category_title FROM targetcategory)
            AND r.restaurant_name <> '우리동네스시신조';

-- 자영업자가 자신이 등록한 음식점을 삭제할 수 있다.
UPDATE tb_restaurant
   SET delete_yn = 'Y'
 WHERE restaurant_name = '국밥집';

-- 자영업자가 음식점의 공지사항을 조회할 수 있다.
SELECT
       u. user_name
     , r. restaurant_name
     , n. notice_title
     , n. notice_content
  FROM tb_restaurant r
  JOIN tb_user u ON r.user_seq = u.user_seq
  JOIN tb_notice n ON n.restaurant_seq = r.restaurant_seq
 WHERE restaurant_name = '일식당';

-- 자영업자가 공지사항을 수정할 수 있다.
UPDATE tb_notice
   SET notice_title = '여름휴가'
     , notice_content = ' 8월5일~8월7일'
 WHERE restaurant_seq = 3;

SELECT
       user_name
     , restaurant_name
     , notice_title
     , notice_content
  FROM tb_restaurant r
  JOIN tb_user u ON r.user_seq = u.user_seq
  JOIN tb_notice n ON n.restaurant_seq = r.restaurant_seq
 WHERE r.restaurant_seq = 3;

-- 자영업자가 공지사항을 삭제할 수 있다.
UPDATE tb_notice n
  JOIN tb_restaurant t ON n.restaurant_seq = t.restaurant_seq
   SET n.delete_yn = 'Y'
 WHERE t.restaurant_name = '중식당';


-- 자영업자가 음식점의 오픈시간 조회
SELECT 
       r.restaurant_seq
     , r.restaurant_name
     , r.restaurant_address
     , r.restaurant_phone
     , r.open_hour
     , r.close_hour
  FROM tb_restaurant r
  JOIN tb_notice n ON r.restaurant_seq = n.restaurant_seq
-- WHERE r.restaurant_name = '한식집';
 WHERE r.restaurant_seq = 1;  
 
 
 
        