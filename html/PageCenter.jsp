<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>TYLLL-管理员系统</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/prettify.css">
</head>
<body >
<%
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding ("UTF-8");
      //表名
        String ftype="admin";
        //获得登录信息
       String fuserID=(String)session.getAttribute("fuserID");
      if(fuserID==null)
      {
        response.sendRedirect("SignIn_admin.html");
      }
       String sql;
       sql="select * from tylll.admin where admin_pro='"+fuserID+"'";
      ResultSet rs=stmt.executeQuery(sql);
%>

<nav>
  <div class="container">
    <h1>TYLLL</h1>
    <div id="menu">
      <ul class="toplinks">
        <li><a href="MainPage_admin.jsp">首页 </a></li>
        <li><a href="#">个人中心</a></li><!--修改个人信息-->
        <li><a href="SignIn_admin.html">注销</a></li>
      </ul>
    </div>
    <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div>
</nav>
<header>
  <div class="container">
    <h2 class="docs-header"> TYLLL</h2>
    <h2 class="docs-header"> 管理员界面 </h2>
  </div>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>个人中心</strong></li>
    </ul>
    <div class="docs-content">
      <h2> 个人信息</h2>
      <h3 id="welcome"> Welcome</h3>
      <p> <%=ftype%></p>
      <table class="table table-condensed">
        <tbody>
        <%
           while(rs.next())
           {
            %>
              <tr>
                <td>工号</td>
                <td><%=rs.getString(1)%></td>
              <tr>
                <td>姓名</td>
                <td><%=rs.getString(2)%></td>
              <tr>
                <td>密码</td>
                <td><%=rs.getString(3)%></td>
              <tr>
            <%
           }
        %>

        </tbody>
      </table>
    </div>
  </div>
</section>
<section class="vibrant centered">
  <div class="container">
    <h4> 如果出现问题，请联系我们 tel-XXXXXXXXXXXX</h4>
  </div>
</section>
<footer>
  <div class="container">
    <p> &copy; 2018 软件工程作业 - Collected from Team 1 </p>
  </div>
</footer>

<script src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/prettify/prettify.js"></script> 
<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&skin=sunburst"></script>
<script src="js/layout.js"></script>
<script src="js/jquery.localscroll-1.2.7.js" type="text/javascript"></script>
<script src="js/jquery.scrollTo-1.4.3.1.js" type="text/javascript"></script>

</body>
</html>
