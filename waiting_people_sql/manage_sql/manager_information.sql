--------- 관리자 기능

-- 작성자: 정의진
-- 고객 정보 조회
SELECT
		 user_seq
	  , user_id
	  , user_password
	  , user_name
	  , user_phone
	  , user_type
	  , reg_date
	  , mod_date
	  , adult_verify_yn
	  , withdraw_yn
  FROM tb_user
 WHERE withdraw_yn = 'N' && user_type = 'C';

-- 작성자: 정의진
-- 테스트를 위한 탈퇴한 회원, 자영업자 고객 정보 등록 >> 인덱스 안 곂치도록 200,300번부터 작성
INSERT
  INTO tb_user(user_seq, user_id, user_password, user_name, user_phone, user_type, withdraw_yn)
VALUES 
(201, 'test201', 'testpw', 'kim', '01011111123','C','Y'),
(202, 'test202', 'testpw', 'lee', '01022224123','C','Y'),
(203, 'test203', 'testpw', 'park', '01033331233','C','Y'),
(204, 'test204', 'testpw', 'lee', '01077123777','C','Y'),
(301, 'test301', 'testpw', 'kim', '01013211123','R','Y'),
(302, 'test302', 'testpw', 'lee', '01023214123','R','Y'),
(303, 'test303', 'testpw', 'park', '01032131233','R','Y'),
(304, 'test304', 'testpw', 'lee', '01022323777','R','Y');

-- 작성자: 정의진
-- 회원 탈퇴한 고객 정보 조회
SELECT
		 user_seq
	  , user_id
	  , user_password
	  , user_name
	  , user_phone
	  , user_type
	  , reg_date
	  , mod_date
	  , adult_verify_yn
	  , withdraw_yn
  FROM tb_user
 WHERE withdraw_yn = 'Y' && user_type = 'C';

-- 작성자: 정의진
-- 자영업자 정보 조회
SELECT
		 user_seq
	  , user_id
	  , user_password
	  , user_name
	  , user_phone
	  , user_type
	  , reg_date
	  , mod_date
	  , adult_verify_yn
	  , withdraw_yn
  FROM tb_user
 WHERE withdraw_yn = 'N' && user_type = 'R';

-- 작성자: 정의진
-- 회원 탈퇴한 자영업자 정보 조회
SELECT
		 user_seq
	  , user_id
	  , user_password
	  , user_name
	  , user_phone
	  , user_type
	  , reg_date
	  , mod_date
	  , adult_verify_yn
	  , withdraw_yn
  FROM tb_user
 WHERE withdraw_yn = 'Y' && user_type = 'R';

-- 작성자: 정의진
-- 음식점 등록 승인
UPDATE tb_restaurant
	SET approve_yn = 'Y'
 WHERE restaurant_seq = 5;

-- 작성자: 정의진
-- 등록 허용 음식점 조회
SELECT restaurant_seq '음식점 고유번호'
	  , category_seq '음식점 카테고리'
	  , user_seq '유저 고유번호'
	  , business_number '사업자번호'
	  , restaurant_phone '음식점 전화번호'
	  , restaurant_name '음식점 이름'
	  , open_hour '오픈시간'
	  , close_hour '마감시간'
	  , restaurant_state '영업상태'
	  , restaurant_address '음식점 주소'
	  , restaurant_enter_yn '입장가능여부'
	  , reg_date '등록일'
	  , mod_date '수정일'
	  , delete_yn '삭제여부'
	  , approve_yn '가게등록허용여부'
  FROM tb_restaurant
 WHERE approve_yn = 'Y';

-- 작성자: 정의진
-- 등록 미허용 음식점 조회
SELECT restaurant_seq '음식점 고유번호'
	  , category_seq '음식점 카테고리'
	  , user_seq '유저 고유번호'
	  , business_number '사업자번호'
	  , restaurant_phone '음식점 전화번호'
	  , restaurant_name '음식점 이름'
	  , open_hour '오픈시간'
	  , close_hour '마감시간'
	  , restaurant_state '영업상태'
	  , restaurant_address '음식점 주소'
	  , restaurant_enter_yn '입장가능여부'
	  , reg_date '등록일'
	  , mod_date '수정일'
	  , delete_yn '삭제여부'
	  , approve_yn '가게등록허용여부'
  FROM tb_restaurant
 WHERE approve_yn = 'N';

-- 작성자: 정의진
-- 음식점 폐업 처리
UPDATE tb_restaurant
	SET delete_yn = 'Y', mod_date = CURRENT_TIMESTAMP()
 WHERE get_total_waiting(restaurant_seq) = 0 &&
 		 restaurant_state ='CLOSE' &&
 		 restaurant_seq = 5;
 		 
-- 작성자: 정의진
-- 폐업 상태 음식점 조회
SELECT restaurant_seq '음식점 고유번호'
	  , category_seq '음식점 카테고리'
	  , user_seq '유저 고유번호'
	  , business_number '사업자번호'
	  , restaurant_phone '음식점 전화번호'
	  , restaurant_name '음식점 이름'
	  , reg_date '등록일'
	  , mod_date '수정일'
	  , delete_yn '폐업여부'
	  , approve_yn '가게등록허용여부'
  FROM tb_restaurant
 WHERE delete_yn = 'Y';		 

-- 작성자: 정의진
-- 폐업 상태 음식점 조회
SELECT restaurant_seq '음식점 고유번호'
	  , category_seq '음식점 카테고리'
	  , user_seq '유저 고유번호'
	  , business_number '사업자번호'
	  , restaurant_phone '음식점 전화번호'
	  , restaurant_name '음식점 이름'
	  , open_hour '오픈시간'
	  , close_hour '마감시간'
	  , restaurant_state '영업상태'
	  , restaurant_address '음식점 주소'
	  , restaurant_enter_yn '입장가능여부'
	  , reg_date '등록일'
	  , mod_date '수정일'
	  , delete_yn '삭제여부'
	  , approve_yn '가게등록허용여부'
  FROM tb_restaurant
 WHERE delete_yn = 'Y';
 
-- 작성자: 정의진
-- 삭제를 위한 데이터 삽입
INSERT
  INTO tb_restaurant(restaurant_seq
  							, user_seq
							, business_number
							, category_seq, restaurant_name
							, restaurant_phone
							, restaurant_address
							, open_hour
							, close_hour
							, approve_yn
							, delete_yn
							, mod_date)
VALUES(100
		, 9
		, '9999999999'
		, 1
		, '삭제할 식당'
		, '03111111111'
		, '용인시 기흥구 구갈동'
		, '10:00:00'
		, '22:00:00'
		, 'Y'
		, 'Y'
		, '20:01:01 09:00:00');

-- 작성자: 정의진
-- 폐업 후 1년 지난 가게 삭제
DELETE
  FROM tb_restaurant
 WHERE restaurant_seq = 100 && 
 		 delete_yn = 'Y' &&
		 TIMESTAMPDIFF(YEAR,mod_date,NOW()) >= 1;
