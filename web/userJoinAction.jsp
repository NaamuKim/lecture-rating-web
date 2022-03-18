<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId=null;
    String userPassword=null;
    if(request.getParameter("userId")!=null){
        userId=(String) request.getParameter("userId");
        System.out.println(userId);
    }
    if(request.getParameter("userPassword")!=null){
        userPassword=(String) request.getParameter("userPassword");
    }
    if(userId==null || userPassword==null){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back()");
        script.println("</script>");
        script.close();
        return;
    }
    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(userId, userPassword);
    if(result==1){
        PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입에 성공했습니다.');");
        script.println("location.href='./index.jsp'");
        script.println("</script>");
        script.close();
        return;
    }
%>