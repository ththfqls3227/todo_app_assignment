# flutter_todo_app

Flutter로 만든 Todo 앱.  
할 일 추가, 완료 여부랑 즐겨찾기 관리 가능.


## 프로젝트 정보

- 사용 기술: Flutter
- 주요 화면
  - HomePage
  - ToDoDetailPage
  - 

## 구현한 기능

### 1. 할 일 추가

- 하단 + 버튼 누르면 BottomSheet 올라옵니다
- 제목 입력용 TextField 있습니다
- BottomSheet 열리면 키보드 자동으로 올라오게 처리
- 제목 안 쓰면 저장 X
- 즐겨찾기 여부 선택 가능
- 필요하면 세부 설명도 추가 가능
- 저장 누르면 할 일 객체 생성되고 창 닫힘


### 2. 할 일 목록

- 할 일 없을 때는 안내 화면 따로 보여줍니다
- 할 일 있으면 리스트 형태로 화면에 표시됩니다
- 각 할 일에서
  - 완료 / 미완료 상태 변경 가능
  - 즐겨찾기 가능
- 완료된 할 일은 취소선으로 표시


### 3. 할 일 상세 화면

- 할 일 하나 누르면 상세 화면으로 이동
- AppBar에 뒤로가기 버튼 있습니다
- 상세 화면에서 즐겨찾기 상태 변경 가능
- 뒤로가기 누르면 변경된 상태가 이전 화면에도 반영


## 프로젝트 구조

- lib/pages
  - home_page.dart : 메인 화면, 할 일 목록 관리
  - todo_detail_page.dart : 할 일 상세 화면
- lib/widgets
  - todo_view.dart : 할 일 한 줄 UI 위젯
  - add_todo_bottom_sheet.dart : 할 일 추가용 BottomSheet
  - no_todo_view.dart : 할 일 없을 때 화면
- lib/models
  - todo_entity.dart : 할 일 데이터 모델

