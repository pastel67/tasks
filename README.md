# Flutter ToDo App

간단하게 할일과 세부사항을 추가하고 삭제할 수 있는 app

## 주요 기능

- 할 일 추가/수정/삭제
- 중요한 할 일 즐겨찾기
- 완료된 할 일 체크
- 반응형 디자인


## 프로젝트 구조

lib/
├── main.dart            # 앱의 진입점
├── themeData.dart       # 앱 테마 설정
├── to_do_entity.dart    # ToDo 모델
└── pages/
|   ├── add_todo_page.dart      # 할 일 추가 페이지
|    ├── home_page.dart          # 메인 홈 페이지
|    └── to_do_detail_page.dart  # 할 일 상세 페이지
├── main.dart            # 앱의 진입점과 기본 설정
├── themeData.dart       # 앱의 디자인 시스템과 테마 정의
└── to_do_entity.dart    # ToDo 데이터 모델


## 시작하기
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 35 31" src="https://github.com/user-attachments/assets/64635eb4-7ff5-472f-ab78-ca9d44dabc5e" />

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 35 38" src="https://github.com/user-attachments/assets/a4c01a29-21af-4775-9fc9-93d24dd93421" />


### 홈페이지
1. 상단 앱바의 오른쪽 버튼으로 테마 모드 변경
2. 할일을 추가하지 않았을 때 나오는 카드
3. 새 할일 추가 버튼



### 새 할일 추가
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 10 14 26" src="https://github.com/user-attachments/assets/53cd8356-3343-4fa3-8762-89c9aa544336" />
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 10 14 32" src="https://github.com/user-attachments/assets/636091a4-bdd5-4fd5-982c-d4776f38bb63" />
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 10 14 36" src="https://github.com/user-attachments/assets/047058b2-53cd-47db-b64b-894b52bc0be4" />
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 10 14 51" src="https://github.com/user-attachments/assets/19f56e53-91dd-47c6-a07f-198ed37514a6" />

1. 새 할일 입력
2. 상세 내용 입력창 활성화
3. 즐겨찾기 설정
4. 입력 내용 저장
5. 상세 내용 입력
6. 상세내용 입력 취소
7. 입력 취소 선택 다이얼로그



### 할일 추가된 화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 36 31" src="https://github.com/user-attachments/assets/511c845e-43e1-4e9c-9686-d58a03b1aba8" />
<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 36 35" src="https://github.com/user-attachments/assets/fa638e73-391a-4141-8117-da9654f3ff02" />

1. 추가된 할일 카드
   - onTap => 상세 페이지 이동
   - longPress => 삭제
2. 할일 완료 체크 버튼
3. 할일 내용
4. 즐겨찾기 토글 버튼
5. 할일 삭제 수행 확인 다이얼로그


### 상세 페이지

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 36 49" src="https://github.com/user-attachments/assets/98a85be8-9f83-4ec3-ad64-e0e1e4666fa1" />

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-23 at 08 36 56" src="https://github.com/user-attachments/assets/ae848a8f-7164-4cf6-84e8-c8219979007d" />

1. 홈페이지로 돌아가기
2. 변경사항 저장버튼
3. 할일 완료 체크 버튼
4. 즐겨찾기 토글 버튼
5. 할일 타이틀 표시 및 수정 텍스트 필드
6. 상세내용 표시 및 수정 텍스트 필드
7. 수정 사항 저장 확인 다이얼로그






