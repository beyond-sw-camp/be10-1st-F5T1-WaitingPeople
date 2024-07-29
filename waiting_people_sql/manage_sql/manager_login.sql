-- 관리자 --
-- 관리자 로그인 체크 -작성:이성민
SELECT 
       user_seq
	  , user_id
     , user_password
     , user_name
     , user_phone
     , reg_date
     , mod_date
     , user_type
     , business_regist_yn
     , adult_verify_yn
     , withdraw_yn
  FROM tb_user
 WHERE user_type = 'M';
 