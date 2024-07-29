-- 음식점 리뷰 작성 --
-- 음식점 리뷰 작성 -작성: 이성민
INSERT 
  INTO tb_review (
                   review_content
                 , review_rating
                 , reg_date
                 , user_id
                 , user_seq
                 , waiting_seq
                 , restaurant_seq)
VALUES (
         '김치찌개가 정말 매워요. 다음에는 안맵게 해주새요'
       , 1.0
       , '2024-07-28 19:28:00'
       , 'test1'
       , 1
       , 2
       , 3);   

SELECT * FROM tb_review

