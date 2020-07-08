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
							<a role="menuitem" tabindex="-1" onclick="window.location.href='updatemember.jsp'">修改用户信息</a>
						</li>
					</ul>
				</div>	
			</div>
		</div>	

	<!--查询信息模块-->
	<div class="col-md-9"> 			
		<h2><span class="label label-default">确定删除用户</span></h2>		
		<br> <br>		
	<form role="form"  method="POST">
				<div class="form-group">
					<label for="UserType">用户类型</label>
					<input type="text" class="form-control" placeholder="请输入想查询人的类型：教师、学生、管理员" name="UserType">
				</div>
				<div class="form-group">
					<label for="UserName">用户姓名</label>
					<input type="text" class="form-control" placeholder="请输入想查询人的姓名"  name="UserName">
				</div>
				<input type="submit" value="查询" name="submit">
			</form>	
		
<%
	//查询需要删除的用户类型及姓名
	String tableName_b=request.getParameter("UserType");
	String userName_b=request.getParameter("UserName");
	if(userName_b!=null && tableName_b!=null)
	{
		String sql_c=null,sql_d=null;
		if(tableName_b.equals("管理员"))
		{		
			sql_c="select * from tylll.admin where admin_name='"+userName_b+"'";
			sql_d="delete from tylll.admin where admin_name='"+userName_b+"'";

		}
		else if(tableName_b.equals("教师"))
		{		
			sql_c="select * from tylll.teacher where tea_name='"+userName_b+"'";
			sql_d="delete from tylll.teacher where tea_name='"+userName_b+"'";

		}
		else if(tableName_b.equals("学生"))
		{		
			sql_c="select * from tylll.student where stu_name='"+userName_b+"'";
			sql_d="delete from tylll.student where stu_name='"+userName_b+"'";
		}
		if(sql_c!=null)
		{	
		ResultSet IIs=stmt.executeQuery(sql_c); 
						
	%>			
	<!--用表格显示数据库查询所得的信息-->
	<br><br>
	<h2><span class="label label-default">查询结果</span></h2>
	<br><br>
 	<table class="table table-condensed" align="center">  
	<tbody>
        <%	
             while(IIs.next())//遍历所有作业，查找符合要求的
             {
              %>
                <tr>
                  <td>学号/工号</td>
                  <td><%=IIs.getString(1)%></td>
                <tr>
                  <td>姓名</td>
                  <td><%=IIs.getString(2)%></td>
                <tr>
                  <td>密码</td>
                  <td><%=IIs.getString(3)%></td>
                <tr>
              <%
             }
             stmt.executeUpdate(sql_d); 
             out.println("<br><br>成功删除用户!<br>");
         }

     }
        %>
        </tbody>
        </table>
	<br><br>	
	</div>
	
	</div>
	
</div>	
</body>
</html>
