<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<!--CSS样式-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<meta name="description" content="">
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
	<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/prettify.css">
	<title>功能</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--<script src="./addmember.jsp" language="JavaScript" type="text/javascript"></script>-->
	<style type="text/css">
	.html,body{height:100%;
		   margin:0;
		   padding:0;
				  }
      	.container{min-height:100%;}
     	
      	.footer{height:100px;
      			margin-top:-100px;
      			background-color: #999999;
      			}/* margin-top（负值的）高度等于footer的height值 */
	</style>
	<div class="row" style="background-color: #999999;color:#FFFFFF">
 	<div class="" align="center" >
	<h2 class="docs-header"> TYLLL 管理员界面</h2>
	</div>
</div>
</head>
<body>
<br><br><br>
<div class="container">
	<div class="row" >
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
			<div class="col-md-3">
			<div class="dropdown">
				<br><br>
				<div class="row">
					<button type="button" class="btn dropdown-toggle" id="dropdownMenu2" 
							data-toggle="dropdown">
						首页
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='MainPage_admin.jsp'">返回首页</a>
						</li>

					</ul>
				</div>	
				<br>
				<div class="row">
					<button type="button" class="btn dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown">
						其他操作
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='deletemember.jsp'">删除用户</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='updatemember.jsp'">修改用户信息</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='searchmember.jsp'">查询用户信息</a>
						</li>
					</ul>
				</div>	
			</div>
		</div>
		
		 <!--添加信息模块-->
		<div class="col-md-9">
			<h2><span class="label label-default">新建用户</span></h2>
			<br> <br>
			<form role="form"  method="POST">
				<div class="form-group">
					<label for="memberType">用户类型</label>
					<input type="text" class="form-control" placeholder="例：teacher/admin/student" name="memberType">
				</div>
				<div class="form-group">
					<label for="Member_id">用户工号/学号</label>
					<input type="text" class="form-control" placeholder="例：2015XXX...或1001XXX..."  name="Member_id">
				</div>
				<div class="form-group">
					<label for="NewName">用户姓名</label>
					<input type="text" class="form-control" name="NewName">
				</div>
				<div class="form-group">
					<label for="Password" class="control-label">用户登陆密码</label>
					<input type="password" class="form-control" placeholder="请输入密码" name="Password" >
				</div>
				<input type="submit" value="提交" name="submit">
			</form>	

			<%	
				//操作的表名
			    String tableName=request.getParameter("memberType");
				//获取加入成员的信息
				String newname=request.getParameter("NewName");
				String member_id=request.getParameter("Member_id");
				String pass_word=request.getParameter("Password");
				
				String memberType=request.getParameter("MemberType");
				 if(tableName==null||newname==null || member_id==null ||pass_word==null)
				{
			        String errmsg="内容不可为空";
				    out.print("<font color=red>"+errmsg+"</font><hr>");
			    }
			    else
			    {
					String sql="insert into tylll."+tableName+" values('"+member_id+"','"+newname+"','"+pass_word+"')";
					//out.print("<br>sql="+sql);
					stmt.executeUpdate(sql);
					//stmt.commit();
					//stmt.setAutoCommit(true);
					out.print("<br>");
					out.print("用户 "+member_id+" 添加成功!");
					//stmt.close();
				}
				
			 %>
			<br><br>	
		</div>
	</div>
</div>
</body>
</html>



