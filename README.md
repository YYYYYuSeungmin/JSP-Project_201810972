# 6주차 ~ 12주차
DB/ Screen/ User 3개의 폴더로 관련 소스코드를 따로 보관.  
기본적인 로그인. 회원가입 로그인 기능을 구현. 관리자 라는 특수한 직위도 만들어 관리자는 회원 정보를 조회, 수정, 탈퇴 할 수 있음.  
게시판은 회원과 관리자 모두 이용할 수 있으며,  
글을 작성하면 메인 화면에 게시한 글들이 나오게 되고,  
그 글의 수정과 삭제는 작성자와 관리자만이 할 수 있도록 하였습니다.


***
# 4주차 & 5주차 코드
입력받은 값들을 전송하고 request를 이용하여 값을 받고, 변수에 저장하는 코드를 구현하였습니다.  
Login.jsp에서 받아서 그 값을 MainScreen.jsp로 전달합니다.  
회원가입시 정보를 저장하는 부분은 구현하지 못하였고, 전송 후 잘 가입되었다는 alert를 주었습니다.  
회원가입시 id와 pw는 영어와 숫자로만 가능하도록 유효성검사를 하였습니다.
***
# 3주차 코드
기본적인 로그인 형식의 폼을 사용하여 submit, button 사용시 페이지 이동 까지 구현하였습니다.

소스파일은 Main.jsp, MainScreen.jsp, Register.jsp 네 개가 있습니다.
***

# JSP-Project_201810972 
서원대학교 컴퓨터공학과 201810972 유승민, 3학년 1학기 JSP 프로젝트
## 게시판 프로젝트
JSP를 처음 접하며 어떤 프로젝트를 해볼까 많은 고민이 있었는데,  
제가 살아오면서 웹 사이트로 어떤 활동들을 해왔나 생각을 해봤습니다  
각종 검색 엔진들과, 네이버 카페나 다른 커뮤니티 등 많은 게시판들을 이용했었습니다.  
그래서 게시판을 만들어보는건 어떨까 하여 자그마한 게시판을 만들어보려 합니다.

### 기능
+ 회원가입  
	+ 가입, 수정, 삭제, 찾기  
+ 로그인  
    + 로그인 성공, 실패  
+ 게시글  
    + 작성, 수정, 조회, 삭제
