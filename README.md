# Flutter ToDo App

간단하게 할일과 세부사항을 추가하고 삭제할 수 있는 app

## 주요 기능

- 할 일 추가/수정/삭제
- 중요한 할 일 즐겨찾기
- 완료된 할 일 체크
- 반응형 디자인

## 시작하기

### 사전 요구사항

- Flutter SDK
- iOS 시뮬레이터 또는 Android 에뮬레이터
- VS Code 또는 Android Studio


## 프로젝트 구조

```
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

