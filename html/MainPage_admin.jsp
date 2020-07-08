<!--管理员主页：
    三个界面：首页、个人中心和注销
    首页：展示管理员的功能——增加用户、删除用户、修改用户信息、查看用户信息和删除评论；
    个人中心：显示该管理员信息；
    注销：退出登录，返回登录界面   -->

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="description" content="">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>TYLLL-管理员系统</title>
<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/prettify.css">
</head>
<body >
  <%  
        request.setCharacterEncoding("UTF-8");
              response.setCharacterEncoding ("UTF-8");
               //获得session登录信息，对任何未从登录界面进入（直接网址进入）的用户，都跳转到登录界面
              String fuserID=(String)session.getAttribute("fuserID");
              if(fuserID==null)
              {
                response.sendRedirect("SignIn_admin.html");
              } 
       %>
<nav>
  <div class="container">
    <h1>TYLLL</h1>
    <div id="menu">
      <ul class="toplinks">
        <li><a href="#">首页 </a></li>
        <li><a href="PageCenter.jsp">个人中心</a></li><!--查看个人信息-->
        <li><a href="SignIn_admin.html">注销</a></li><!--用户注销，退回登录界面-->
      </ul>
    </div>
    </div>
</nav>

<header>
<div class="row">
  <div class="container">
    <h2 class="docs-header"> TYLLL </h2>
    <h2 class="docs-header"> 管理员界面 </h2>
  </div>
</header>
<section>
  <div class="container" align="center">
<u1 align="center">
      <li><a href="add_Member.jsp">增加用户</a></li>
      <li><a href="deletemember.jsp">删除用户</a></li>
      <li><a href="updatemember.jsp">修改用户信息</a></li>
      <li><a href="searchmember.jsp">查看用户信息</a></li>
     <!-- <li><a href="deletecomment.jsp">删除评论</a></li>-->
</u1>
<br><br>
</section>
<footer>
  <div class="container">
    <p> 如果出现问题，请联系我们 tel-XXXXXXXXXXXX</p>
    <p> &copy; 2018 软件工程作业 - Collected from Team 1 </p>
  </div>
</footer>
</div>

<script src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/prettify/prettify.js"></script> 
<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&skin=sunburst"></script>
<script src="js/layout.js"></script>
<script src="js/jquery.localscroll-1.2.7.js" type="text/javascript"></script>
<script src="js/jquery.scrollTo-1.4.3.1.js" type="text/javascript"></script>
</body>
</html>
