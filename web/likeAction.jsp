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
<%@ page import="likey.LikeyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%!
    public static String getClientIp(HttpServletRequest request){
        String ip = request.getHeader("X-FORWARDED-FOR");
        if(ip==null || ip.length()==0){
            ip= request.getHeader("Proxy-Client-IP");
        }
        if(ip==null || ip.length()==0){
            ip= request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip==null || ip.length()==0){
            ip= request.getRemoteAddr();
        }
        return  ip;
    }
%>

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
    LikeyDAO likeyDAO =new LikeyDAO();
    int result = likeyDAO.like(userId,evaluationId,getClientIp(request));
        if(result ==1){
            result = evaluationDAO.like(evaluationId);
            if(result==1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('추천이 완료됐습니다.');");
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
        script.println("alert('이미 추천하신 글입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
%>
