<%--
  Created by IntelliJ IDEA.
  User: jiwonkim
  Date: 2022/03/22
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter" %>

<%
    UserDAO userDAO = new UserDAO();
    String userId=null;
    if(session.getAttribute("userId")!=null){
        userId= (String) session.getAttribute("userId");
    }
    if(userId==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요.');");
        script.println("location.href='userLogin.jsp'");
        script.println("</script>");
        script.close();
        return;
    }

    request.setCharacterEncoding("UTF-8");
    String evaluationId=null;
    if(request.getParameter("evaluationId")!=null){
        evaluationId=request.getParameter("evaluationId");
    }
    EvaluationDAO evaluationDAO = new EvaluationDAO();
    if(userId.equals(evaluationDAO.getUserId(evaluationId))) {
        int result = new EvaluationDAO().delete(evaluationId);
        if(result ==1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('삭제가 완료됐습니다.');");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
            script.close();
        }else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.');");
            script.println("history.back();");
            script.println("</script>");
            script.close();
        }
    } else{
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('자신이 쓴 글만 삭제 가능합니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
%>
