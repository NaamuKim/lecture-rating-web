<%--
  Created by IntelliJ IDEA.
  User: jiwonkim
  Date: 2022/03/22
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.*" %>
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
    String reportTitle=null;
    String reportContent=null;
    if(request.getParameter("reportTitle")!=null){
        reportTitle=request.getParameter("reportTitle");
    }
    if(request.getParameter("reportContent")!=null){
        reportContent=request.getParameter("reportContent");
    }
    if(reportTitle==null||reportContent==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }



    String host="http://localhost:8080/JSP_lecture_rate_war_exploded/";
    String from="just731731@gmail.com";
    String to= "lost731@naver.com";
    String subject ="강의평가를 사이트에서 접수된 신고 메일입니다..";
    String content="신고자: "+userId +
            "<br>제목: " + reportTitle +
            "<br>내용: " + reportContent;

    Properties p =  new Properties();
    p.put("mail.smtp.user", from );
    p.put("mail.smtp.host", "smtp.googlemail.com");
    p.put("mail.smtp.port", "465" );
    p.put("mail.smtp.starttls.enable", "true" );
    p.put("mail.smtp.auth", "true" );
    p.put("mail.smtp.debug", "true"  );
    p.put("mail.smtp.socketFactory.port", "465" );
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
    p.put("mail.smtp.socketFactory.fallback", "false" );


    try{
        Authenticator auth = new Gmail();
        Session ses = Session.getInstance(p,auth);
        ses.setDebug(true);
        MimeMessage msg= new MimeMessage(ses);
        msg.setSubject(subject);
        Address fromAddr = new InternetAddress(from);
        msg.setFrom(fromAddr);
        Address toAddr = new InternetAddress(to);
        msg.addRecipient(Message.RecipientType.TO, toAddr);
        msg.setContent(content, "text/html;charset=UTF-8");
        Transport.send(msg);
    }catch (Exception e){
        e.printStackTrace();
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('오류가 발생했습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('정상적으로 신고되었습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
%>

