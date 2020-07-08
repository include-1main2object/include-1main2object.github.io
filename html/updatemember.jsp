<!--删除用户成员：
    功能：输入用户类型和用户姓名，对表进行搜索，找出该用户并进行删除-->
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
					<button type="button" class="btn dropdown-toggle" id="dropdownMenu2" 
							data-toggle="dropdown">
						其他操作
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='add_Member.jsp'">增加用户</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='searchmember.jsp'">显示用户信息</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='deletemember.jsp'">删除用户</a>
						</li>
					</ul>
				</div>	
			</div>
		</div>	

	<!--查询信息模块-->
	<div class="col-md-9"> 			
		<h2><span class="label label-default">修改用户信息</span></h2>
		<br> <br>		
	<form role="form"  method="POST">
				<div class="form-group">
					<label for="USERType">用户类型</label>
					<input type="text" class="form-control" placeholder="请输入想修改用户的类型：教师、学生、管理员" name="USERType">
				</div>
				<div class="form-group">
					<label for="USERName">用户姓名</label>
					<input type="text" class="form-control" placeholder="请输入想修改用户的姓名"  name="USERName">
				</div>
				<div class="form-group">
				<select class="form-control" name="content">
					<option disabled="" selected="">- 查询内容 -</option>
					<option value="user_Password">用户密码</option>
					<option value="user_ID">学号/工号</option>
					<option value="ClientName">姓名</option>
				</select>
					<label for="updatecontent">修改为</label>
					<input type="text" class="form-control" placeholder="请输入修改后的内容"  name="updatecontent">
   				</div>
   				
				<input type="submit" value="提交" name="submit">
			</form>	
		
<%
	//查询需要删除的用户类型及姓名
	String tableName_x=request.getParameter("USERType");
	String userName_y=request.getParameter("USERName");
	String Content=request.getParameter("content");
	String UpdateContent=request.getParameter("updatecontent");
	//进行判断处理，写出sql语句
	if(userName_y!=null && tableName_x!=null)
	{
		String sql_x=null;
		if(Content.equals("user_ID") && tableName_x.equals("管理员"))
		{		
			sql_x="update tylll.admin set admin_pro='"+UpdateContent+"' where admin_name='"+userName_y+"'";

		}
		else if(Content.equals("user_ID") && tableName_x.equals("教师"))
		{		
			sql_x="update tylll.teacher set tea_pro='"+UpdateContent+"' where tea_name='"+userName_y+"'";

		}
		else if(Content.equals("user_ID") && tableName_x.equals("学生"))
		{		
			sql_x="update tylll.student set stu_pro='"+UpdateContent+"' where stu_name='"+userName_y+"'";

		}
		else if(Content.equals("user_Password") && tableName_x.equals("管理员"))
		{		
			sql_x="update tylll.admin set admin_password='"+UpdateContent+"' where admin_name='"+userName_y+"'";

		}
		else if(Content.equals("user_Password") && tableName_x.equals("教师"))
		{		
			sql_x="update tylll.teacher set tea_password='"+UpdateContent+"' where tea_name='"+userName_y+"'";

		}
		else if(Content.equals("user_Password") && tableName_x.equals("学生"))
		{		
			sql_x="update tylll.student set stu_password='"+UpdateContent+"' where stu_name='"+userName_y+"'";

		}
		else if(Content.equals("ClientName") && tableName_x.equals("管理员"))
		{		
			sql_x="update tylll.admin set admin_name='"+UpdateContent+"' where admin_name='"+userName_y+"'";

		}
		else if(Content.equals("ClientName") && tableName_x.equals("教师"))
		{		
			sql_x="update tylll.teacher set tea_name='"+UpdateContent+"' where tea_name='"+userName_y+"'";

		}
		else if(Content.equals("ClientName") && tableName_x.equals("学生"))
		{		
			sql_x="update tylll.student set stu_name='"+UpdateContent+"' where stu_name='"+userName_y+"'";

		}

		if(sql_x!=null)
		{	
		stmt.executeUpdate(sql_x); 
		out.println("<br><br>成功修改用户信息!<br>");
	}
}
						
	%>			
	<br><br>	
	</div>
	
	</div>
	
</div>	
</body>
</html>
