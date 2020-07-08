<!--管理员登陆的jsp文件：
    查询数据库内admin表是否已有该用户信息，并判断用户输入信息是否完全正确;
    若存在且完全正确，则登陆成功，跳至功能主页MainPage_admin.jsp；否则返回该页面   -->
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding ("UTF-8");
	//获得表中传来的数据
	String fuserID=request.getParameter("form-userID");
	String fpassword=request.getParameter("form-password");
	String table_name="admin";
	if(fuserID!=null && fpassword!=null)
	{
		String sql="select * from tylll.admin where admin_pro='"+fuserID+"'";
		//String sql="select * from admin where admin_pro='"+fuserID+"'";
         	ResultSet IS=stmt.executeQuery(sql);
         if(!IS.next())//结果集为空 不在admin表中
         {
         		 out.print("无此用户");
         	 }
         else if(IS.getString("admin_password").equals(fpassword))//密码正确
         {
        		session.setAttribute("fuserID", fuserID); 
                 	session.setAttribute("ftype",table_name);
                 	response.sendRedirect("MainPage_admin.jsp"); 
        	 }
	 else
	{
		out.print("无此用户");
	}	
	}
	

%>
</body>
</html>