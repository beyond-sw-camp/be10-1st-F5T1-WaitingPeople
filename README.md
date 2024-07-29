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

## 테스트게이스
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
            <img src="../img/test_img/customer_test_img/회원 관리 기능/deleteMyReview.gif" alt="리뷰삭제_gif">
        </details>
        <details>
            <summary>11. 회원 탈퇴</summary>
            <img src="../img/test_img/customer_test_img/회원 관리 기능/withdrawUser.gif" alt="회원탈퇴_gif">
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
        <img src="mg/test_img/customer_test_img/음식점 정렬 기능/고객_음식점별점순정렬.gif" alt="별점정렬_gif">
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

<details>
<summary>자영업자관련기능</summary>
    <details>
        <summary>음식점정보관리</summary>
        <details>
            <summary>1.사업자등록증등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/사업자 등록증 등록.gif" alt="사업자등록증_gif">
        </details>
        <details>
            <summary>2.음식점상세정보등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/음식점 상세등록.gif" alt="음식점상세등록_gif">
        </details>
        <details>
            <summary>3.음식점삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/음식점 삭제.gif" alt="음식점삭제_gif">
        </details>
        <details>
            <summary>4.공지사항등록</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 공지사항 등록.gif" alt="공지사항등록_gif">
        </details>
        <details>
            <summary>5.공지사항조회</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자신의 음식점 공지사항 조회.gif" alt="공지사항조회_gif">
        </details>
        <details>
            <summary>6.공지사항수정</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자신의 음식점 공지사항 수정.gif" alt="공지사항수정_gif">
        </details>
        <details>
            <summary>7.공지사항삭제</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 공지사항 삭제.gif" alt="사업자등록증_gif">
        </details>
        <details>
            <summary>8.자영업자회원가입</summary>
            <img src="img/test_img/restaurant_test_img/음식점 정보관리/자영업자 회원가입.gif" alt="자영업자회원가입_gif">
        </details>
    </details>
</details>

<details>
    <summary>관리자 관련 기능</summary>
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

