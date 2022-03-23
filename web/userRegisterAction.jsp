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
    String userEmail=null;
    if(request.getParameter("userId")!=null){
        userId=request.getParameter("userId");
    }
    if(request.getParameter("userPassword")!=null){
        userPassword=request.getParameter("userPassword");
    }
    if(request.getParameter("userEmail")!=null){
        userEmail=request.getParameter("userEmail");
    }
    if(userId==null ||userPassword==null||userEmail==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }
    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(new UserDTO(userId,userPassword,userEmail,SHA256.getSHA256(userEmail),false));
    if(result==-1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 존재하는 아이디입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else {
        session.setAttribute("userId", userId);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입에 성공하였습니다.');");
        script.println("location.href='emailSendAction.jsp';");
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
