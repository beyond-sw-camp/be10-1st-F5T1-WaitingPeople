-- 전체 리뷰 조회(+댓글)(최신순-기본) by garam
-- 리뷰 또는 댓글이 수정됐다면 리뷰등록일, 댓글등록일이 수정일로 보인다.
SELECT
       u.user_id '고객 아이디'
     , COALESCE(vc.visit_count, 0) AS '방문 횟수'
     , rv.review_rating '별점'
     , COALESCE(rv.mod_date , rv.reg_date) '리뷰 등록일'
     , imf.picture_url '이미지 링크'
     , rv.review_content '리뷰 내용'
     , COALESCE(rvc.mod_date , rvc.reg_date) '댓글 등록일'
     , rvc.comment_content '댓글 내용'
  FROM tb_review rv
  LEFT JOIN tb_restaurant rs ON rv.restaurant_seq = rs.restaurant_seq 
  LEFT JOIN tb_review_comment rvc ON rv.review_seq= rvc.review_seq 
  LEFT JOIN tb_image_file imf ON rv.review_seq = imf.review_seq
  LEFT JOIN tb_user u ON u.user_seq = rv.user_seq
  LEFT JOIN (SELECT
       	  		    user_seq
       		      , COUNT(*) AS visit_count
 		       FROM tb_waiting
    		  WHERE waiting_status = '입장'
    		  GROUP BY user_seq
			) vc ON rv.user_seq = vc.user_seq
 WHERE rs.restaurant_seq = 1
   AND rv.visible_yn = 'Y'
 ORDER BY rv.reg_date DESC;

-- 리뷰 별점순 정렬(오름차순) by garam
-- 별점이 같다면 최신순 정렬
SELECT
       u.user_id '고객 아이디'
     , COALESCE(vc.visit_count, 0) AS '방문 횟수'
     , rv.review_rating '별점'
     , COALESCE(rv.mod_date , rv.reg_date) '리뷰 등록일'
     , imf.picture_url '이미지 링크'
     , rv.review_content '리뷰 내용'
     , COALESCE(rvc.mod_date , rvc.reg_date) '댓글 등록일'
     , rvc.comment_content '댓글 내용'
  FROM tb_review rv
  LEFT JOIN tb_restaurant rs ON rv.restaurant_seq = rs.restaurant_seq 
  LEFT JOIN tb_review_comment rvc ON rv.review_seq= rvc.review_seq 
  LEFT JOIN tb_image_file imf ON rv.review_seq = imf.review_seq
  LEFT JOIN tb_user u ON u.user_seq = rv.user_seq
  LEFT JOIN (SELECT
       	  		    user_seq
       		      , COUNT(*) AS visit_count
 		       FROM tb_waiting
    		  WHERE waiting_status = '입장'
    		  GROUP BY user_seq
			) vc ON rv.user_seq = vc.user_seq
 WHERE rs.restaurant_seq = 3
   AND rv.visible_yn = 'Y'
 ORDER BY rv.review_rating, rv.reg_date DESC;

-- 리뷰 별점순 정렬(내림차순) by garam
-- 별점이 같다면 최신순 정렬
SELECT
       u.user_id '고객 아이디'
     , COALESCE(vc.visit_count, 0) AS '방문 횟수'
     , rv.review_rating '별점'
     , COALESCE(rv.mod_date , rv.reg_date) '리뷰 등록일'
     , imf.picture_url '이미지 링크'
     , rv.review_content '리뷰 내용'
     , COALESCE(rvc.mod_date , rvc.reg_date) '댓글 등록일'
     , rvc.comment_content '댓글 내용'
  FROM tb_review rv
  LEFT JOIN tb_restaurant rs ON rv.restaurant_seq = rs.restaurant_seq 
  LEFT JOIN tb_review_comment rvc ON rv.review_seq= rvc.review_seq 
  LEFT JOIN tb_image_file imf ON rv.review_seq = imf.review_seq
  LEFT JOIN tb_user u ON u.user_seq = rv.user_seq
  LEFT JOIN (SELECT
       	  		    user_seq
       		      , COUNT(*) AS visit_count
 		       FROM tb_waiting
    		  WHERE waiting_status = '입장'
    		    AND restaurant_seq = 1
    		  GROUP BY user_seq
			) vc ON rv.user_seq = vc.user_seq
 WHERE rs.restaurant_seq = 3
   AND rv.visible_yn = 'Y'
 ORDER BY rv.review_rating DESC, rv.reg_date DESC;