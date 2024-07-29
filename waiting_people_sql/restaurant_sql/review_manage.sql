-- 리뷰 댓글 작성 by garam
INSERT 
  INTO tb_review_comment
(
  review_seq
, comment_content
)
VALUES
(
  8
, '감사합니다! 다음에 또 와주세요'
);

SELECT * 
  FROM tb_review_comment rvc
 ORDER BY comment_seq DESC;

-- 리뷰 댓글 여러 개 작성 by garam
INSERT 
  INTO tb_review_comment
(
  review_seq
, comment_content
)
VALUES
  (3, '감사합니다! 보다 더 맛있는 맛을 위해 노력하겠습니다~')
, (4, '감사합니다! 보다 더 맛있는 맛을 위해 노력하겠습니다~')
;

-- 리뷰 댓글 수정 by garam
UPDATE tb_review_comment
   SET comment_content = '항상 많이 드리려고 하고 있어요 다음에 또 주문해주세요~'
     , mod_date = CURRENT_TIMESTAMP() 
 WHERE comment_seq = 15;

-- 리뷰 댓글 삭제 by garam
DELETE 
  FROM tb_review_comment
 WHERE comment_seq = 14;

-- 리뷰 삭제 요청 by garam
UPDATE tb_review
   SET delete_date = CURRENT_TIMESTAMP() 
     , delete_yn='Y'
     , visible_yn='N'
 WHERE review_seq = 14
   AND delete_yn = 'N';

SELECT * 
  FROM tb_review rv
 ORDER BY review_seq DESC;

