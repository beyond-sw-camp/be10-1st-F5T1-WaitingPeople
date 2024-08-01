-- CREATE DATABASE waiting5;
-- USE waiting5;
-- 유저 테이블
CREATE TABLE `tb_user` (
   `user_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '회원고유번호',
   `user_id` VARCHAR(30) NOT NULL COMMENT '아이디' COLLATE 'utf8mb4_general_ci',
   `user_password` VARCHAR(500) NOT NULL COMMENT '비밀번호' COLLATE 'utf8mb4_general_ci',
   `user_name` VARCHAR(15) NOT NULL COMMENT '회원명' COLLATE 'utf8mb4_general_ci',
   `user_phone` CHAR(11) NOT NULL COMMENT '전화번호' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `mod_date` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
   `user_type` CHAR(1) NOT NULL DEFAULT 'C' COMMENT '회원타입' COLLATE 'utf8mb4_general_ci',
   `adult_verify_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '성인 인증여부' COLLATE 'utf8mb4_general_ci',
   `withdraw_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '탈퇴여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`user_seq`) USING BTREE,
   UNIQUE INDEX `user_id` (`user_id`) USING BTREE,
   UNIQUE INDEX `user_phone` (`user_phone`) USING BTREE,
   CONSTRAINT `USER_TYPE_CHECK` CHECK (`user_type` in ('C','R','M')),
   CONSTRAINT `ADULT_VERIFY_CHECK` CHECK (`adult_verify_yn` in ('Y','N')),
   CONSTRAINT `WITHDRAW_CHECK` CHECK (`withdraw_yn` in ('Y','N'))
)
COMMENT='회원'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- 사업자 등록증 테이블
CREATE TABLE `tb_business_license` (
   `business_number` CHAR(10) NOT NULL COMMENT '사업자등록번호' COLLATE 'utf8mb4_general_ci',
   `user_seq` INT(11) NOT NULL COMMENT '회원고유번호',
   `certification_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '인증여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`business_number`) USING BTREE,
   CONSTRAINT `tb_business_license_FK` FOREIGN KEY (`user_seq`) REFERENCES `tb_user` (`user_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `certification_yn_check` CHECK (`certification_yn` in ('Y','N'))
)
COMMENT='사업자등록증'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- 음식점 카테고리 테이블
CREATE TABLE `tb_restaurant_category` (
   `category_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리고유번호',
   `category_title` VARCHAR(15) NOT NULL COMMENT '카테고리이름' COLLATE 'utf8mb4_general_ci',
   `visible_yn` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT '카테고리노출여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`category_seq`) USING BTREE,
   CONSTRAINT `visible_yn_check` CHECK (`visible_yn` in ('Y','N'))
)
COMMENT='음식카테고리'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- 음식점 테이블
CREATE TABLE `tb_restaurant` (
   `restaurant_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '음식점고유번호',
   `category_seq` INT(11) NOT NULL COMMENT '카테고리고유번호',
   `user_seq` INT(11) NOT NULL COMMENT '회원고유번호',
   `business_number` CHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
   `restaurant_phone` CHAR(11) NOT NULL COMMENT '음식점전화번호' COLLATE 'utf8mb4_general_ci',
   `restaurant_name` VARCHAR(100) NOT NULL COMMENT '음식점이름' COLLATE 'utf8mb4_general_ci',
   `open_hour` TIME NULL DEFAULT NULL COMMENT '음식점영업시작시간',
   `close_hour` TIME NULL DEFAULT NULL COMMENT '음식점영업종료시간',
   `restaurant_state` CHAR(5) NOT NULL DEFAULT 'CLOSE' COMMENT '음식점영업상태' COLLATE 'utf8mb4_general_ci',
   `restaurant_address` VARCHAR(100) NOT NULL COMMENT '음식점주소' COLLATE 'utf8mb4_general_ci',
   `restaurant_enter_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '음식점입장가능유무' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `mod_date` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
   `delete_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부' COLLATE 'utf8mb4_general_ci',
   `approve_yn` CHAR(1) NULL DEFAULT 'N' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`restaurant_seq`) USING BTREE,
   INDEX `tb_restaurant_FK1` (`category_seq`) USING BTREE,
   INDEX `tb_restuarant_FK2` (`user_seq`) USING BTREE,
   INDEX `tb_restaurant_FK3` (`business_number`) USING BTREE,
   CONSTRAINT `tb_restaurant_FK1` FOREIGN KEY (`category_seq`) REFERENCES `tb_restaurant_category` (`category_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_restaurant_FK3` FOREIGN KEY (`business_number`) REFERENCES `tb_business_license` (`business_number`) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT `tb_restuarant_FK2` FOREIGN KEY (`user_seq`) REFERENCES `tb_business_license` (`user_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `restaurant_state_check` CHECK (`restaurant_state` in ('OPEN','CLOSE')),
   CONSTRAINT `restaurant_enter_yn_check` CHECK (`restaurant_enter_yn` in ('Y','N')),
   CONSTRAINT `delete_yn_check` CHECK (`delete_yn` in ('Y','N')),
   CONSTRAINT `approve_yn_check` CHECK (`approve_yn` in ('Y','N'))
)
COMMENT='음식점'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- 음식점 공지사항 테이블
CREATE TABLE `tb_notice` (
   `notice_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항고유번호',
   `restaurant_seq` INT(11) NOT NULL COMMENT '음식점고유번호',
   `notice_title` VARCHAR(100) NOT NULL COMMENT '공지사항제목' COLLATE 'utf8mb4_general_ci',
   `notice_content` VARCHAR(500) NOT NULL COMMENT '공지사항내용' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `mod_date` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
   `delete_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`notice_seq`) USING BTREE,
   INDEX `tb_notice_FK` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_notice_FK` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `delete_yn_check` CHECK (`delete_yn` in ('Y','N'))
)
COMMENT='공지사항'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



-- 웨이팅 테이블
CREATE TABLE `tb_waiting` (
   `waiting_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '웨이팅고유번호',
   `user_seq` INT(11) NOT NULL COMMENT '회원고유번호',
   `restaurant_seq` INT(11) NOT NULL COMMENT '음식점고유번호',
   `headcount` INT(11) NOT NULL COMMENT '인원수',
   `cancel_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '취소여부' COLLATE 'utf8mb4_general_ci',
   `waiting_status` VARCHAR(10) NOT NULL DEFAULT '대기' COMMENT '웨이팅상태' COLLATE 'utf8mb4_general_ci',
   `waiting_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '웨이팅등록시간',
   `phone_number` CHAR(11) NOT NULL COMMENT '전화번호' COLLATE 'utf8mb4_general_ci',
   `enter_date` TIMESTAMP NULL DEFAULT NULL COMMENT '입장시간',
   PRIMARY KEY (`waiting_seq`) USING BTREE,
   INDEX `tb_waiting_FK` (`user_seq`) USING BTREE,
   INDEX `tb_waiting_FK1` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_waiting_FK` FOREIGN KEY (`user_seq`) REFERENCES `tb_user` (`user_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_waiting_FK1` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `waiting_status_check` CHECK (`waiting_status` in ('대기','입장')),
   CONSTRAINT `cancel_yn_check` CHECK (`cancel_yn` in ('Y','N'))
)
COMMENT='웨이팅'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- 웨이팅 알람 테이블
CREATE TABLE `tb_waiting_alarm` (
   `alarm_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '알림고유번호',
   `waiting_seq` INT(11) NOT NULL COMMENT '웨이팅고유번호',
   `alarm_content` VARCHAR(500) NULL DEFAULT NULL COMMENT '알림내용' COLLATE 'utf8mb4_general_ci',
   `alarm_time` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '알림시간',
   `accept_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '수락여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`alarm_seq`) USING BTREE,
   INDEX `tb_waiting_alarm_FK` (`waiting_seq`) USING BTREE,
   CONSTRAINT `tb_waiting_alarm_FK` FOREIGN KEY (`waiting_seq`) REFERENCES `tb_waiting` (`waiting_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `accept_yn_check` CHECK (`accept_yn` in ('Y','N'))
)
COMMENT='웨이팅알림'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



-- 태그 테이블
CREATE TABLE `tb_tag` (
   `tag_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '태그고유번호',
   `tag_title` VARCHAR(30) NOT NULL COMMENT '태그이름' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`tag_seq`) USING BTREE
)
COMMENT='태그'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



-- 태그현황 테이블
CREATE TABLE `tb_restaurant_tag` (
   `restaurant_tag_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '음식점별태그고유번호',
   `restaurant_seq` INT(11) NOT NULL COMMENT '음식점고유번호',
   `tag_seq` INT(11) NOT NULL COMMENT '태그고유번호',
   PRIMARY KEY (`restaurant_tag_seq`) USING BTREE,
   INDEX `tb_restaurant_tag_FK` (`tag_seq`) USING BTREE,
   INDEX `tb_restaurant_tag_FK1` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_restaurant_tag_FK` FOREIGN KEY (`tag_seq`) REFERENCES `tb_tag` (`tag_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_restaurant_tag_FK1` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='음식점별태그현황'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- 메뉴그룹 테이블
CREATE TABLE `tb_menu_group` (
   `menu_group_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴그룹고유번호',
   `restaurant_seq` INT(11) COMMENT '음식점고유번호',
   `menu_group_name` VARCHAR(100) NOT NULL COMMENT '메뉴그룹이름' COLLATE 'utf8mb4_general_ci',
   `menu_group_detail` VARCHAR(150) NULL DEFAULT NULL COMMENT '메뉴그룹설명' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`menu_group_seq`) USING BTREE,
   INDEX `tb_menu_group_FK` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_menu_group_FK` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='메뉴그룹'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- 메뉴 테이블
CREATE TABLE `tb_menu` (
   `menu_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴고유번호',
   `menu_group_seq` INT(11) NOT NULL COMMENT '메뉴그룹고유번호',
   `restaurant_seq` INT(11) NOT NULL COMMENT '음식점고유번호',
   `menu_name` VARCHAR(100) NOT NULL COMMENT '메뉴이름' COLLATE 'utf8mb4_general_ci',
   `menu_price` INT(11) NOT NULL COMMENT '메뉴가격',
   `menu_ingredient` VARCHAR(500) NULL DEFAULT NULL COMMENT '메뉴재료' COLLATE 'utf8mb4_general_ci',
   `menu_detail` VARCHAR(150) NULL DEFAULT NULL COMMENT '메뉴상세설명' COLLATE 'utf8mb4_general_ci',
   `menu_recommend_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '메뉴추천여부' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   PRIMARY KEY (`menu_seq`) USING BTREE,
   INDEX `tb_menu_FK` (`menu_group_seq`) USING BTREE,
   INDEX `tb_menu_FK1` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_menu_FK` FOREIGN KEY (`menu_group_seq`) REFERENCES `tb_menu_group` (`menu_group_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_menu_FK1` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `menu_recommend_yn_check` CHECK (`menu_recommend_yn` in ('Y','N'))
)
COMMENT='음식메뉴'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



-- 리뷰 테이블
CREATE TABLE `tb_review` (
   `review_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰고유번호',
   `user_seq` INT(11) NOT NULL COMMENT '리뷰작성자고유번호',
   `restaurant_seq` INT(11) NOT NULL COMMENT '음식점고유번호',
   `waiting_seq` INT(11) NOT NULL COMMENT '웨이팅고유번호',
   `review_content` VARCHAR(1500) NULL DEFAULT NULL COMMENT '리뷰내용' COLLATE 'utf8mb4_general_ci',
   `review_rating` DOUBLE NOT NULL COMMENT '별점',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `mod_date` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
   `delete_date` TIMESTAMP NULL DEFAULT NULL COMMENT '삭제요청일',
   `delete_yn` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부' COLLATE 'utf8mb4_general_ci',
   `visible_yn` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT '노출여부' COLLATE 'utf8mb4_general_ci',
   PRIMARY KEY (`review_seq`) USING BTREE,
   INDEX `tb_review_FK` (`user_seq`) USING BTREE,
   INDEX `tb_review_FK1` (`restaurant_seq`) USING BTREE,
   INDEX `tb_review_FK2` (`waiting_seq`) USING BTREE,
   CONSTRAINT `tb_review_FK` FOREIGN KEY (`user_seq`) REFERENCES `tb_user` (`user_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_review_FK1` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `tb_review_FK2` FOREIGN KEY (`waiting_seq`) REFERENCES `tb_waiting` (`waiting_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `delete_yn_check` CHECK (`delete_yn` in ('Y','N')),
   CONSTRAINT `visible_yn_check` CHECK (`visible_yn` in ('Y','N'))
)
COMMENT='리뷰'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;



-- 리뷰 댓글 테이블
CREATE TABLE `tb_review_comment` (
   `comment_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '댓글고유번호',
   `review_seq` INT(11) NOT NULL COMMENT '리뷰고유번호',
   `comment_content` VARCHAR(1500) NULL DEFAULT NULL COMMENT '댓글내용' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `mod_date` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
   PRIMARY KEY (`comment_seq`) USING BTREE,
   INDEX `tb_review_comment_FK` (`review_seq`) USING BTREE,
   CONSTRAINT `tb_review_comment_FK` FOREIGN KEY (`review_seq`) REFERENCES `tb_review` (`review_seq`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COMMENT='리뷰댓글'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- 사진 테이블
CREATE TABLE `tb_image_file` (
   `picture_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '사진고유번호',
   `menu_seq` INT(11) NULL DEFAULT NULL COMMENT '메뉴고유번호',
   `review_seq` INT(11) NULL DEFAULT NULL COMMENT '리뷰고유번호',
   `restaurant_seq` INT(11) NULL DEFAULT NULL COMMENT '음식점고유번호',
   `picture_name` VARCHAR(500) NOT NULL COMMENT '사진파일이름' COLLATE 'utf8mb4_general_ci',
   `picture_original_name` VARCHAR(100) NOT NULL COMMENT '사진이름' COLLATE 'utf8mb4_general_ci',
   `picture_url` VARCHAR(500) NOT NULL COMMENT '사진url' COLLATE 'utf8mb4_general_ci',
   `reg_date` TIMESTAMP NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
   `creator` VARCHAR(15) NOT NULL COMMENT '등록한사람ID',
   PRIMARY KEY (`picture_seq`) USING BTREE,
   INDEX `tb_image_file_FK` (`review_seq`) USING BTREE,
   INDEX `tb_image_file_FK1` (`menu_seq`) USING BTREE,
   INDEX `tb_image_file_FK2` (`restaurant_seq`) USING BTREE,
   CONSTRAINT `tb_image_file_FK` FOREIGN KEY (`review_seq`) REFERENCES `tb_review` (`review_seq`) ON UPDATE RESTRICT ON DELETE CASCADE,
   CONSTRAINT `tb_image_file_FK1` FOREIGN KEY (`menu_seq`) REFERENCES `tb_menu` (`menu_seq`) ON UPDATE RESTRICT ON DELETE CASCADE,
   CONSTRAINT `tb_image_file_FK2` FOREIGN KEY (`restaurant_seq`) REFERENCES `tb_restaurant` (`restaurant_seq`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COMMENT='사진'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;