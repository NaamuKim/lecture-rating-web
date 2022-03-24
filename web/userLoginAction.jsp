<%--
  Created by IntelliJ IDEA.
  User: jiwonkim
  Date: 2022/03/22
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
  request.setCharacterEncoding("UTF-8");
  String userId=null;
  String userPassword=null;
  if(request.getParameter("userId")!=null){
    userId=request.getParameter("userId");
  }
  if(request.getParameter("userPassword")!=null){
    userPassword=request.getParameter("userPassword");
  }

  if(userId==null ||userPassword==null){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('입력이 안 된 사항이 있습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
  }
  UserDAO userDAO = new UserDAO();
  int result = userDAO.login(userId,userPassword);
  if(result==1){
    session.setAttribute("userId", userId);
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href='index.jsp'");
    script.println("</script>");
    script.close();
  } else if(result==0){
    session.setAttribute("userId", userId);
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비밀번호가 틀립니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
  } else if(result==-1){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('존재하지 않는 아이디입니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
  }else if(result==-2){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('데이터베이스 오류가 발생했습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
  }
%>


<html>
<head>
  <title>Title</title>
</head>
<body>

</body>
</html>
