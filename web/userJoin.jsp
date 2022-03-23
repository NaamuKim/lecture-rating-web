<%--
  Created by IntelliJ IDEA.
  User: jiwonkim
  Date: 2022/03/17
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
  <meta name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">
  <title>강의평가 웹사이트</title>
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/custom.css">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp">강의평가 웹사이트</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">메인</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
            회원관리
          </a>
          <div class="dropdown-menu" aria-labelledby="dropdown">
            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
            <a class="dropdown-item active" href="userJoin.jsp">회원가입</a>
            <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요" aria-label="Search"/>
        <button class="btn btn-outline-success my-2 my-sm-2" type="submit">검색</button>
      </form>
    </div>
  </nav>
  <section class="container mt-3" style="max-width: 560px;">
    <form method="post" action="./userRegisterAction.jsp">
      <div class="form-group">
        <label>아이디</label>
        <input type="text" name="userId" class="form-control"/>
      </div>
      <div class="form-group">
        <label>비밀번호</label>
        <input type="password" name="userPassword" class="form-control">
      </div>
      <div class="form-group">
        <label>이메일</label>
        <input type="text" name="userEmail" class="form-control">
      </div>
      <button type="submit" class="btn btn-primary">회원가입</button>
    </form>
  </section>



  <footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
    Copyright &copy; cbnu 정보통신공학부 김지원 All Rights Reserved
  </footer>
  <script src="./js/jquery.min.js"></script>
  <script src="./js/popper.js"></script>
  <script src="./js/bootstrap.min.js"></script>
</body>
</html>
