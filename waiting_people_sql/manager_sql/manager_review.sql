-- 작성자: 정의진
-- 리뷰 삭제 요청 거부
UPDATE tb_review
	SET visible_yn = 'Y'
 WHERE review_seq = 8 &&
 		 visible_yn = 'N';

-- 작성자: 정의진
-- 삭제 요청 들어온 리뷰 조회
SELECT review_seq
	  , user_seq
	  , restaurant_seq
	  , waiting_seq
	  , u.user_id
	  , review_content
	  , review_rating
	  , reg_date
	  , mod_date
	  , delete_date
	  , delete_yn
	  , visible_yn
  FROM tb_review r
  LEFT JOIN tb_user u ON r.user_seq = u.user_seq
 WHERE visible_yn = 'N' && delete_yn='Y';
