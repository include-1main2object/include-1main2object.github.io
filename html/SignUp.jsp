<!--管理员注册的jsp文件：
    获取注册界面输入的注册信息，若输入信息均不为空，则将该用户插入数据库admin表内;   -->
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<title>SignUp</title>
	<link rel="stylesheet" href="html/assets/css/bootstrap.min.css">  
	<script src="html/assets/js/jquery.min.js"></script>
	<script src="html/assets/js/bootstrap.min.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding ("UTF-8");
	//获得表中传来的数据
	String fuserID=request.getParameter("form-userID");
	String fpassword=request.getParameter("form-password");
	String fusername=request.getParameter("form-username");
	//String sql_a="select * from tylll.admin where admin_pro='"+fuserID+"'";
       // ResultSet rs=stmt.executeQuery(sql_a);
	//if(rs.next())
	//{
	//response.sendRedirect("SignUpFail.html");
	//}
	if(fuserID!=null && fpassword!=null && fusername!=null )
	{
		String sql="insert into tylll.admin"+" values('"+fuserID+"','"+fusername+"','"+fpassword+"')";
		stmt.executeUpdate(sql);
		//out.print("<br>");
		response.sendRedirect("SignUpForward.html");
	}
	

%>
</body>
</html>