# ⏱프로젝트 개요
### 😃팀원소개
| 정의진 | 전아영 | 이성민 | 이창윤 | 박상현 | 남가람 |
| --- | --- | --- | --- | --- | --- |
| [깃 링크](https://github.com/JungUiJin) | [깃 링크](https://github.com/AYeong-Jeon) | [깃 링크](https://github.com/sungmini9755) | [깃 링크](https://github.com/leebackcoding) | [깃 링크](https://github.com/SANGHYUN0519) | [깃 링크](https://github.com/catnine11) |

![title](./img/readme_img/title_img.JPG)

## 📽프로젝트 소개

‘웨이팅의 민족’은 사용자가 어플을 통해 ‘원격 줄서기’를 가능하게 도와주는 애플리케이션입니다. 사용자는 원하는 식당을 검색하고, 실시간으로 손쉽게 ‘원격줄서기(웨이팅)’을 할 수 있으며, 실시간으로 자신의 순번을 확인하고 자신의 차례가 되었을 시 식당에 들어갈 수 있습니다. 또한 가게에서 식사를 마친 후 가게에 대한 평점과 리뷰를 남길 수 있습니다. 이를 통해 사용자는 시간을 아끼고 간편하게 예약 후 식사를 즐길 수 있습니다.

## 📰프로젝트 필요성

코로나19 종식 이후 여행객이 나날이 증가함에 따라,  주요 관광지에 있는 ‘맛집’에 들르는 손님들이 많아지고 있습니다. 또한 ‘미식 문화’가 발전하며 사람들은 특정 맛집을 방문하기 위해 장시간 대기하는 것을 마다하지 않습니다.  이러한 현상 속에서 여행객은 맛집 방문 시 편리하게 대기할 수 있음을 원하고, 자영업자들은 보다 효율적으로 웨이팅을 관리할 방법을 찾고 있습니다. 
![news1](./img/readme_img/news1.jpg)
![news2](./img/readme_img/news2.png)
‘웨이팅의 민족’은 고객에게는 편리함을, 자영업자에게는 운영 효율성을 높여주며 여행 인구와 맛집 탐방 인구의 증가로 인해 높아진 수요를 충족시켜주는 데에 중요한 역할을 할 것입니다.

## 💻주요기능

- 맛집 검색하기
    - 태그(가게 특징)을 활용해서 맛집을 검색할 수 있습니다.
    - 웨이팅 수, 별점 수, 방문자 수, 가격대, 리뷰를 기준으로 맛집을 검색할 수 있습니다.
    - 맛집의 메뉴, 매장 정보를 확인할 수 있습니다.
- 웨이팅 등록하기
    - 예약자는 가게의 웨이팅 현황과 예상 대기시간을 확인할 수 있습니다.
    - 예약자는 인원수, 개인정보 등을 활용하여 웨이팅을 등록할 수 있습니다.
    - 예약자는 원하는 때에 예약을 취소할 수 있습니다.
    - 예약자는 예약이 등록되고, 가게 입장이 확정될 때 알림을 받을 수 있습니다.
- 웨이팅 관리하기
    - 자영업자는 현재 가게의 웨이팅 현황을 확인하고 상세 조회 할 수 있습니다.
    - 자영업자는 가게의 상태와 등록된 웨이팅을 고려하여 웨이팅 순번을 수정할 수 있습니다.

## 💬요구사항 명세
➡[요구사항명세 바로가기](https://drive.google.com/file/d/1GMWnQc-rdHaP2VyZJ57iuRzzB0-1z4wF/view?usp=drive_link)
## 📅WBS
➡[WBS 바로가기](https://drive.google.com/file/d/1YshgVSAn2EP7PxG_mM6aGX_Rn0CZDHiQ/view?usp=drive_link)
## 논리모델
- 초기
![replication](./img/readme_img/논리ERD_초기본(회고용).png)
- 최종
![replication](./img/readme_img/논리ERD_Wating_People(최종본).png)
## 물리모델 
![replication](./img/readme_img/물리ERD_Wating_People(최종본).png)

## 테이블 정의서
➡[테이블정의서 바로가기](https://drive.google.com/file/d/1lxyl6VMtoPj4RXdAzY3h8CcjOe12qXSO/view?usp=drive_link)
## 🔗Replication
### Master-Slave Architecher
![replication](./img/readme_img/db_replication.png)

Master-Slave구조는 고가용성과 확장성을 위해 자주 사용되는 DB복제 메커니즘입니다. 하나의 데이터베이스 서버가 “Master” 역할을 하고, 하나 이상의 데이터베이스가 “Slave”역할을 합니다.  

- Master는 쓰기 작업(INSERT, UPDATE, DELETE)를 처리하며 모든 데이터 변경 사항이 Slave에게 전달됩니다.
- Slave는 Master로부터 데이터 변경 사항을 복제(Replication)받아 동일한 데이터 상태를 유지하며  읽기 작업(SELECT)를 처리하여 Master의 부하를 줄여줍니다.

### 연동 확인
![replication](./img/readme_img/replication1.JPG)
### 외부 PC 접속
![replication](./img/readme_img/replication2.JPG)
### Slave read-only 옵션 확인
![replication](./img/readme_img/replication3.JPG)


## ✅테스트케이스 문서

## 테스트케이스
➡[테스트케이스 바로가기](https://drive.google.com/file/d/1ZKG5vFPU19yQFKOOYlr_OJLSqKaby2-I/view?usp=drive_link)
## 테스트케이스 코드 및 실행
<details>
<summary>고객관련기능</summary>
    <details>
    <summary>고객 회원 정보 관련 기능</summary>
        <details>
        <summary>1. 회원가입</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/joinUser.gif" alt="회원가입_gif">
        </details>
        <details>
            <summary>2. 로그인</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/login.gif" alt="로그인_gif">
        </details>
        <details>
            <summary>3. 아이디 찾기</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/findId.gif" alt="아이디찾기_gif">
        </details>
        <details>
            <summary>4. 임시 비밀번호 발급 및 재로그인</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/findPassword.gif" alt="임시비밀번호발급_gif">
        </details>
        <details>
            <summary>5. 회원정보 조회</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getUserInfo.gif" alt="회원정보조회_gif">
        </details>
        <details>
            <summary>6. 회원정보 수정</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/modifyUserInfo.gif" alt="회원정보수정_gif">
        </details>
        <details>
            <summary>7. 내 웨이팅 내역 전체 조회</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getMyWaitingList.gif" alt="전체조회_gif">
        </details>
        <details>
            <summary>8. 내가 쓴 리뷰 조회</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getMyReviewList.gif" alt="리뷰조회_gif">
        </details>
        <details>
            <summary>9. 내가 쓴 리뷰 수정</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/modifyMyReview.gif" alt="리뷰수정_gif">
        </details>
        <details>
            <summary>10. 내가 쓴 리뷰 삭제</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/deleteMyReview.gif" alt="리뷰삭제_gif">
        </details>
        <details>
            <summary>11. 회원 탈퇴</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/withdrawUser.gif" alt="회원탈퇴_gif">
        </details>
    </details>
    <details>
    <summary>웨이팅 등록 관련 기능</summary>
        <details><summary>1.웨이팅,알람 등록</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅,웨이팅알림등록.gif" alt="웨이팅,알람등록_gif">
        </details>
            <details><summary>2.웨이팅확정</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장확정.gif" alt="입장확정_gif">
        </details>
            <details><summary>3.웨이팅취소</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장취소.gif" alt="입장취소_gif">
        </details>
    </details>
    <details>
    <summary>음식점 정보 조회 관련 기능</summary>
    <div markdown="1">
        <details><summary>1.음식점이름검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점이름검색.gif" alt="이름검색_gif">
        </details>
        <details><summary>2.음식점메뉴검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점메뉴검색.gif" alt="메뉴검색_gif">
        </details>
        <details><summary>3.음식점주소검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점주소검색.gif" alt="주소검색_gif">
        </details>
        <details><summary>4.음식점태그검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점태그검색.gif" alt="태그검색_gif">
        </details>
        <details><summary>5.음식점카테고리검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점카테고리검색.gif" alt="카테고리검색_gif">
        </details>
            <details><summary>6.음식점별점순정렬</summary>
        <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점별점순정렬.gif" alt="별점정렬_gif">
        </details>
        <details><summary>7.음식점리뷰순정렬</summary>
            <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점리뷰순정렬.gif" alt="리뷰정렬_gif">
        </details>
        <details><summary>8.음식점웨이팅순정렬</summary>
            <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점웨이팅순정렬.gif" alt="웨이팅정렬_gif">
        </details>
        <details><summary>9.음식점평균가격순정렬</summary>
            <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점평균가격순정렬.gif" alt="평균가격정렬_gif">
        </details>
        <details><summary>10.음식점신규등록순정렬</summary>
            <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점등록순정렬.gif" alt="평균가격정렬_gif">
        </details>
    </div>
    </details>
    <details>
    <summary>음식점 상세 정보 조회 관련 기능</summary>
        <details><summary>1.음식점상세정보조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 상세 정보 조회.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.음식점메뉴상세정보조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 메뉴 상세 정보 조회.gif" alt="메뉴상세정보조회_gif">
        </details>
        <details><summary>3.음식점전체리뷰조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 전체 리뷰 조회.gif" alt="전체리뷰조회_gif">
        </details>
        <details><summary>4.음식점사진포함리뷰조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 사진 포함 리뷰 조회.gif" alt="사진포함리뷰조회_gif">
        </details>
        <details><summary>5.음식점리뷰별점순조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 전체 리뷰 별점 순 정렬.gif" alt="리뷰별점순조회_gif">
        </details>
        <details><summary>6.음식점리뷰시간순조회</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 전체 리뷰 시간순 정렬.gif" alt="리뷰별점순조회_gif">
        </details>
    </details>
    <details>
    <summary>음식점리뷰작성기능</summary>
        <details><summary>1.리뷰별점체크</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/리뷰 별점 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.음식점입장유무체크</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 입장 유무 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>3.음식점리뷰작성</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 리뷰 작성.gif" alt="음식점상세정보조회_gif">
        </details>   
    </details>
</details>
<hr>
<details>
<summary>자영업자관련기능</summary>
    <details>
    <summary>음식점 메뉴 관련 기능</summary>
        <details>
            <summary>1. 음식점 메뉴 그룹 등록</summary>
            <details>
                <summary>1. 음식점 메뉴 그룹 이름 중복 등록</summary>
                <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/기본 메뉴 그룹 이름 중복 등록 테스트.gif" alt="메뉴그룹중복등록테스트_gif">
            </details>
            <details>
                <summary>2. 음식점 메뉴 그룹 이름 필수 테스트</summary>
                <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/기본 메뉴 그룹 등록시 이름 필수인지 테스트.gif" alt="메뉴그룹이름필수테스트_gif">
            </details>
            <details>
                <summary>3. 음식점 메뉴 그룹 설명 NULL 테스트</summary>
                <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/기본 메뉴 그룹 등록시 설명NULL 테스트.gif" alt="메뉴그룹설명NULL테스트_gif">
            </details>
        </details>
        <details>
            <summary>2. 음식점 메뉴 그룹 목록 초기 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹 최초 조회 테스트.gif" alt="메뉴그룹목록초기조회_gif">
        </details>
        <details>
            <summary>3. 음식점 메뉴 그룹 목록 이름순 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹 조회 이름 순 정렬 테스트.gif" alt="메뉴그룹목록이름순정렬조회_gif">
        </details>
        <details>
            <summary>4. 음식점 메뉴 그룹 목록 이름순 반대 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹 이름반대순 정렬 조회.gif" alt="메뉴그룹목록이름반대순정렬조회_gif">
        </details>
        <details>
            <summary>5. 음식점 메뉴 그룹 수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹 수정 메뉴 그룹 이름 NULL 테스트.gif" alt="메뉴그룹수정테스트_gif">
        </details>
        <details>
            <summary>6. 음식점 메뉴 그룹 삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹 삭제시 관련 메뉴 변화 테스트.gif" alt="메뉴그룹삭제테스트_gif">
        </details>
        <details>
            <summary>7. 음식점 사진 미포함 메뉴 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/사진 제외 메뉴 등록 테스트.gif" alt="사진미포함메뉴등록테스트_gif">
        </details>
        <details>
            <summary>8. 음식점 사진 포함 메뉴 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/사진 포함 메뉴 등록 테스트.gif" alt="사진포함메뉴등록테스트_gif">
        </details>
        <details>
            <summary>9. 음식 메뉴 전체 최초 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 전체 최초 조회.gif" alt="메뉴전체최초조회테스트_gif">
        </details>
        <details>
            <summary>10. 메뉴 그룹 이름으로 메뉴 목록 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹을 기준으로 정렬 조회 테스트.gif" alt="메뉴그룹이름으로 메뉴목록정렬조회테스트_gif">
        </details>
        <details>
            <summary>11. 메뉴 그룹 이름으로 메뉴 목록 반대 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 그룹을 기준으로 반대 정렬 조회 테스트.gif" alt="메뉴그룹이름으로 메뉴목록반대정렬조회테스트_gif">
        </details>
        <details>
            <summary>12. 메뉴 이름으로 메뉴 목록 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 이름을 기준으로 메뉴 정렬 테스트.gif" alt="메뉴이름으로 메뉴목록정렬조회테스트_gif">
        </details>
        <details>
            <summary>13. 메뉴 이름으로 메뉴 목록 반대 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 이름을 기준으로 메뉴 반대 정렬 테스트.gif" alt="메뉴이름으로 메뉴목록반대정렬조회테스트_gif">
        </details>
        <details>
            <summary>14. 오래된 순으로 메뉴 목록 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 목록 오래된 순으로 조회 테스트.gif" alt="오래된 순으로 메뉴목록정렬조회테스트_gif">
        </details>
        <details>
            <summary>15. 최신 순으로 메뉴 목록 정렬 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/메뉴 목록 최신 순으로 조회 테스트.gif" alt="최신 순으로 메뉴목록정렬조회테스트_gif">
        </details>
        <details>
            <summary>16. 음식점 메뉴 상세 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/음식점 메뉴 상세 조회 테스트.gif" alt="메뉴상세조회테스트_gif">
        </details>
        <details>
            <summary>17. 사진 수정 미포함 메뉴 수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/음식점 메뉴 수정(사진 수정 제외) 테스트.gif" alt="사진수정미포함메뉴수정_gif">
        </details>
        <details>
            <summary>18. 사진 수정 포함 메뉴 수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/음식점 메뉴 수정(사진 수정 포함) 테스트.gif" alt="사진수정포함메뉴수정_gif">
        </details>
        <details>
            <summary>19. 음식점 메뉴 삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 메뉴 관리/음식점 메뉴 삭제 테스트.gif" alt="음식점메뉴삭제테스트_gif">
        </details>
    </details>
    <details>
        <summary>음식점 정보 관리 기능</summary>
        <details>
        <summary>1. 같은 업종의 음식점 찾기</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/같은 업종의 음식점 찾기.gif" alt="같은 업종의 음식점 찾기_gif">
        </details>
        <details>
            <summary>2. 다른 가게 오픈시간 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/다른 가게 오픈시간 조회.gif" alt="다른 가게 오픈시간 조회_gif">
        </details>
        <details>
            <summary>3. 등록된 자신의 음식점 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/다른 가게 오픈시간 조회.gif" alt="다른 가게 오픈시간 조회_gif">
        </details>
        <details>
            <summary>4. 사업자 등록증 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/사업자 등록증 등록.gif" alt="사업자 등록증 등록_gif">
        </details>
        <details>
            <summary>5. 사진 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/사진 조회.gif" alt="사진 조회_gif">
        </details>
        <details>
            <summary>6. 음식점 삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/음식점 삭제.gif" alt="음식점 삭제_gif">
        </details>
        <details>
            <summary>7. 음식점 상세등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/음식점 상세등록.gif" alt="음식점 상세등록_gif">
        </details>
        <details>
            <summary>8. 자신의 음식점 공지사항 수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자신의 음식점 공지사항 수정.gif" alt="자신의 음식점 공지사항 수정_gif">
        </details>
        <details>
            <summary>9. 자신의 음식점 공지사항 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자신의 음식점 공지사항 조회.gif" alt="자신의 음식점 공지사항 조회_gif">
        </details>
        <details>
            <summary>10. 자신의 태그 조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자신의 음식점 태그 조회.gif" alt="자신의 태그 조회_gif">
        </details>
        <details>
            <summary>11. 자영업자 공지사항 삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 공지사항 삭제.gif" alt="자영업자 공지사항 삭제_gif">
        </details>
        <details>
            <summary>12. 자영업자 사진 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 사진 등록.gif" alt="자영업자 사진 등록_gif">
        </details>
        <details>
            <summary>13. 자영업자 알림 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 공지사항 등록.gif" alt="자영업자 알림 등록_gif">
        </details>
        <details>
            <summary>14. 자영업자 정보 수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 정보 수정.gif" alt="자영업자 정보 수정_gif">
        </details>
        <details>
            <summary>15. 자영업자 태그 등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 태그등록.gif" alt="자영업자 태그 등록_gif">
        </details>
        <details>
            <summary>16. 자영업자 회원가입</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 회원가입.gif" alt="자영업자 회원가입_gif">
        </details>
    </details>
    <details>
        <summary>웨이팅 예상 대기시간 기능</summary>
        <details>
            <summary>1. 오늘의 대기시간 분석</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 예상대기시간/오늘의 웨이팅 대기시간 분석.gif" alt="오늘의 웨이팅 대기시간 분석.gif">
        </details>
        <details>
            <summary>2. 시간대별 예상대기시간</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 예상대기시간/시간대별 예상대기시간.gif" alt="시간대별 예상대기시간.gif">
        </details>
        <details>
            <summary>3. 요일, 시간대별 예상대기시간-프로시저</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 예상대기시간/요일,시간대별 예상대기시간.gif" alt="요일,시간대별 예상대기시간.gif">
        </details>
        <details>
            <summary>4. 요일, 시간대별 예상대기시간-함수</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 예상대기시간/요일,시간대별 예상대기시간_함수.gif" alt="요일,시간대별 예상대기시간_함수.gif">
        </details>
    </details>
    <details>
        <summary>웨이팅 목록 조회</summary>
        <details>
            <summary>1. 웨이팅 목록 조회</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 목록 조회/웨이팅 목록 조회.gif" alt="웨이팅 목록 조회.gif">
        </details>
        <details>
            <summary>2. 웨이팅 인원 조회</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 목록 조회/웨이팅 인원 조회.gif" alt="웨이팅 인원 조회.gif">
        </details>
    </details>
    <details>
        <summary>웨이팅 목록 조회</summary>
        <details>
            <summary>1. 웨이팅 목록 조회</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 목록 조회/웨이팅 목록 조회.gif" alt="웨이팅 목록 조회.gif">
        </details>
        <details>
            <summary>2. 웨이팅 인원 조회</summary>
            <img src="img/test_img/restaurant_test_img/웨이팅 목록 조회/웨이팅 인원 조회.gif" alt="웨이팅 인원 조회.gif">
        </details>
    </details>
    <details>
        <summary>음식점 전체 리뷰 조회, 정렬</summary>
        <details>
            <summary>1. 최신순-기본- 조회</summary>
            <img src="img/test_img/restaurant_test_img/리뷰 정렬/전체리뷰조회(최신순)(1).gif" alt="전체리뷰조회(최신순).gif">
        </details>
        <details>
            <summary>2. 별점순 조회</summary>
            <img src="img/test_img/restaurant_test_img/리뷰 정렬/전체리뷰조회(별점순)(1).gif" alt="전체리뷰조회(별점순).gif">
        </details>
    </details>
    <details>
        <summary>리뷰 별점 조회</summary>
        <details>
            <summary>1. 평균 별점 조회</summary>
            <img src="img/test_img/restaurant_test_img/리뷰 조회/평균 별점 조회.gif" alt="평균 별점 조회.gif">
        </details>
        <details>
            <summary>2. 별점 별 리뷰수 조회</summary>
            <img src="img/test_img/restaurant_test_img/리뷰 조회/별점 별 리뷰수 조회.gif" alt="별점 별 리뷰수 조회.gif">
        </details>
    </details>
</details>
<hr>
<details>
    <summary>관리자 관련 기능</summary>
    <details>
        <summary>관리자 로그인 체크 </summary>
        <img src="img/test_img/manager_test_img/로그인/관리자 로그인 체크.gif" alt="관리자 로그인 체크_gif">
    </details>
    <details>  
        <summary>회원정보관리</summary>
        <details><summary>1.고객정보조회</summary>
            <img src="img/test_img/manager_test_img/회원관리기능/관리자_회원조회.gif" alt="고객조회_gif">
            </details>
        <details><summary>2.탈퇴한고객정보조회</summary>
            <img src="img/test_img/manager_test_img/회원관리기능/관리자_탈퇴한회원조회.gif" alt="탈퇴한고객조회_gif">
        </details>
        <details><summary>3.자영업자정보조회</summary>
            <img src="img/test_img/manager_test_img/회원관리기능/관리자_자영업자정보조회.gif" alt="자영업자조회_gif">
        </details>
        <details><summary>4.탈퇴한자영업자조회</summary>
            <img src="img/test_img/manager_test_img/회원관리기능/관리자_탈퇴한자영업자정보조회.gif" alt="탈퇴한자영업자조회_gif">
        </details>
    </details>
    <details>  
        <summary>태그관리</summary>
        <details>
            <summary>1. 음식점 태그 조회</summary>
            <img src="img/test_img/manager_test_img/태그/음식점 태그 조회.gif" alt="음식점 태그 조회_gif">
        </details>
        <details>
            <summary>2. 음식점 태그 이름 등록</summary>
            <img src="img/test_img/manager_test_img/태그/음식점 태그 이름 등록.gif" alt="음식점 태그 이름 등록_gif">
        </details>
        <details>
            <summary>3. 음식점 태그 삭제</summary>
            <img src="img/test_img/manager_test_img/태그/음식점 태그 삭제.gif" alt="음식점 태그 삭제_gif">
        </details>
    </details>
    <details>  
        <summary>카테고리관리</summary>
        <details>
            <summary>1. 모든 음식점 카테고리 조회</summary>
            <img src="img/test_img/manager_test_img/카테고리/모든 음식점 카테고리 조회.gif" alt="음식점 입장 유무 체크_gif">
        </details>
        <details>
            <summary>2. 음식점 카테고리 등록</summary>
            <img src="img/test_img/manager_test_img/카테고리/음식점 카테고리 등록.gif" alt="음식점 카테고리 등록_gif">
        </details>
        <details>
            <summary>3. 음식점 카테고리 노출 여부</summary>
            <img src="img/test_img/manager_test_img/카테고리/음식점 카테고리 노출 여부 체크.gif" alt="음식점 카테고리 노출 여부_gif">
        </details>
    </details>
    <details>  
        <summary>음식점등록관리</summary>
        <details>
            <summary>1. 음식점 등록 승인</summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_음식점등록승인.gif" alt="음식점 등록_gif">
        </details>
        <details>
            <summary>2. 등록 승인 음식점 조회</summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_등록승인음식점조회.gif" alt="음식점 조회_gif">
        </details>
        <details>
            <summary>3. 등록 미승인 음식점 조회</summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_등록미승인음식점조회.gif" alt="음식점 조회_gif">
        </details>
        <details>
            <summary>4.폐업처리 음식점 조회 </summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_폐업처리,조회.gif" alt="음식점 조회_gif">
        </details>
    </details>
    <details>  
        <summary>음식점리뷰관리</summary>
        <details>
            <summary>1. 삭제 요청 리뷰 조회</summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_삭제요청리뷰조회.gif" alt="리뷰조회_gif">
        </details>
        <details>
            <summary>2. 리뷰 삭제 요청 거부</summary>
            <img src="img/test_img/manager_test_img/음식점관리기능/관리자_리뷰삭제요청거부.gif" alt="리뷰조회_gif">
        </details>
    </details>
</details>

## 주요 쿼리

<details><summary>1.고객_웨이팅,웨이팅 알림 등록</summary>
    <img src="img/주요쿼리/C_웨이팅,알림등록.gif" alt="웨이팅등록_gif">
</details>
<details><summary>2.고객_실시간 웨이팅순 가게조회</summary>
    <img src="img/주요쿼리/C_실시간웨이팅순정렬.gif" alt="음식점검색정렬_gif">
</details>
<details><summary>3.고객_웨이팅 확정 확인 후 리뷰작성</summary>
    <img src="img/주요쿼리/C_입장확정확인후 리뷰작성.gif" alt="리뷰작성_gif">
</details>
<details><summary>4.자영업자_웨이팅 예상 대기시간 확인</summary>
    <img src="img/주요쿼리/R_웨이팅예상대기시간.gif" alt="대기시간확인_gif">
</details>
<details><summary>5.자영업자_웨이팅 목록 조회</summary>
    <img src="img/주요쿼리/R_웨이팅목록조회.gif" alt="웨이팅목록조회_gif">
</details>
<details><summary>6.자영업자_메뉴등록</summary>
    <img src="img/주요쿼리/R_사진포함메뉴등록.gif" alt="메뉴등록_gif">
</details>

## 🏁회고록


| 팀 원 | 회고록                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| --- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 정의진 | 프로젝트의 기획 단계부터 DB구현, 서버 구축, 백업 관리 까지 진행하며 팀 프로젝트의 기반을 다질 수 있었습니다. 처음에는 다소 복잡한 주제 선정으로 인해 기획 단계부터 어려움이 있었지만, 팀원들의 꼼꼼한 확인과 수정 덕분에 무사히 프로젝트를 완성할 수 있습니다. 다만 DB구현만으로 모든 요구 사항을 충족시키기에는 한계가 있기에 다들 고민이 많았습니다. DB로 구현할 수 있는 기능의 한계를 극복하기 위해 다들 노력을 많이 했고 이에 따라 좋은 결과가 나온 것 같습니다. 이번 프로젝트를 통해 SQL작성 능력을 키우고 프로젝트 기획 단계의 역량을 기를 수 있었습니다. |
| 전아영 | 이번 프로젝트를 진행하면서 데이터베이스만 사용해 쿼리를 짜고 테스트를 하며, 쿼리에서의 예외 처리에 대해 깊게 고민할 수 있었던 점이 좋았습니다. <br>하지만, 쿼리만으로 예외를 처리하는 것에 한계가 있어 테이블의 수정이 잦았습니다. 또, 테스트 케이스에서 누락된 부분도 많고 특히 회원 탈퇴 기능에 대해 아쉬운 점이 많았습니다. <br>이번 프로젝트를 기반으로 다음 프로젝트에서는 처음 기능을 만들 때 기능의 역할이나 필요성에 대해 꼼꼼히 분석하고 구조화해서 문서보다는 쿼리의 성능에 대해 고민할 수 있는 시간을 늘리고 싶다는 생각을 했습니다. |
| 이성민 | 이번 기반기술 프로젝트를 진행하면서 특히 외래키 제약 조건에 대해 깊이 이해할 수 있는 기회를 가졌습니다. <br>초기에는 이러한 제약 조건을 설계하고 구현하는 과정이 복잡하고 까다롭게 느껴졌지만, 프로젝트를 진행하며 점점 익숙해졌습니다. <br>또한, 이번 프로젝트는 UI 없이 백엔드와 데이터베이스만으로 시스템을 구현하는 작업이라 UI가 없는 상태에서의 데이터 처리와 시스템 동작을 이해하고 검증하는 것이 생각보다 훨씬 어려웠습니다.하지만 이러한 어려움에도 불구하고, 팀원들과 함께 프로젝트를 진행한 덕분에 포기하지 않고 끝까지 해결할 수 있었습니다. <br>이 과정에서 팀워크의 중요성을 다시 한 번 느꼈고, 서로의 강점을 활용하여 프로젝트를 성공적 완성 했습니다.                                                                                                                                                              |
| 이창윤 | 이번 프로젝트를 통해 프로젝트의 진행에 있어 문서화가 매우 중요한 부분을 차지한다는 것을 깨달았습니다. 계획을 세우는 단계에서부터 많은 고민과 대화가 이루어져야 한다는 것을 배웠고, 프로젝트를 진행하는 과정 속에서 서로의 역할을 인지하고 병합하는 과정이 생각보다 더 많이 이루어져야 했다는 것도 느꼈습니다. SQL 문법을 익히는 것과 문법을 활용하여 프로젝트에 대입하는 것은 전혀 다른 분야의 공부였으며, 이 프로젝트를 통해 서로의 부족함을 채워가며 다양한 고민과 방법을 찾는 과정이 저에게 소중한 경험이었습니다. 팀원의 출중한 실력보다 서로간의 배려와 인정하는 자세에서 팀프로젝트의 깊은 의미를 배웠습니다. 다양한 사람들과 함께 배운 내용을 토대로 서로 알려주고 배우는 과정에서 저는 한 층도 성장하였고 다음 프로젝트에서 부족함을 채워서 더 자신감있게 임할 수 있을 것입니다. 모두의 역할이 중요했으며, 서로의 이해심이 지금의 프로젝트를 완성시켰다고 생각합니다. 이번 프로젝트는 잊지 못할 경험이었고 늘 상시시키며 성장하는 백엔드 개발자가 되도록 하겠습니다. |
| 박상현 | 이론에서 이해하지 못한 부분이나 '왜 이런식으로 하지' 라는 의문이 있던 부분들, 연습 문제를 풀 때 주어진 데이터에서 select 문으로 정보만 가져오는 연습만 하다가 실제로 DB로 구현해보니 더 많은 도움이 되었고, DB 설계를 하면서 처음에 모델링 하는게 얼마나 중요한지 알 수 있는 계기가 되었다. <br>처음에 완벽하게 모델링 하지 못해서 컬럼을 설정하거나 데이터를 추가할 때, 다시 처음으로 돌아와서 모델링을 수정하는 과정에서 시간을 많이 쓰게 된 것 같아서 모델링이 얼마나 중요하고 서로의 상간 관계를 꼼꼼하게 해야 된다는 것을 배울 수 있었다. 개발자는 개발만 잘해야 하는 것이 아니라 문서화 작업까지도 잘하면 더 큰 도움이 될 수 있다는 걸 느낄 수 있었다. 또한 팀으로 프로젝트를 진행하면서 모르는 부분이나 부족한 부분을 채워 줄 수 있어서 좋았다. 팀원이 6명으로 여러가지 의견 충돌이 있을 줄 알았으나, 문제 없이 금방 의견을 추합 할 수 있었다. <br>아직 내 역량이 부족하고 어려운 부분이 있었지만 앞으로 더 발전하도록 노력해야겠다. |
| 남가람 | 여러 어려움에도 불구하고 이번 프로젝트를 통해 많은 것을 배울 수 있었습니다. 특히 쿼리를 작성할때 프로시저 구현으로 경험을 쌓으며 기술적으로 성장할 수 있었습니다. 비록 처음 요구사항과 모델링이 완벽하지 못해서 프로젝트 후반까지 테이블 구조를 여러 차례 수정해야 했지만, 이를 통해 모델링의 중요성을 깊이 깨닫게 되었습니다. 또한, 화면 구현이 없었기 때문에 처음 요구사항을 화면 단위로 생각하고 쿼리 구현을 사용자 단위로 나누면서, 비슷한 기능을 여러 팀원이 나누게 되어 수정이 발생할 때마다 다른 팀원들에게 영향이 미친 점은 아쉬웠습니다. 다음 프로젝트에서는 이러한 점을 개선하여 더 완벽한 요구사항과 모델링을 구현하고 싶습니다. 사실 처음의 주제를 변경하게 되면서 많은 고민이 있었지만, 다행히도 좋은 팀원들을 만나 부족한 부분을 서로 보완하며 프로젝트를 성공적으로 마칠 수 있었습니다. 이번 프로젝트를 통해 느낀 점과 배운 점을 바탕으로 앞으로 더 나은 성과를 낼 수 있을 것 같습니다. 팀워크의 중요성을 다시 한번 깨달을 수 있었고, 함께 노력하며 성장할 수 있었던 팀원들에게 감사드립니다. |

