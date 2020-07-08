<!--搜索用户成员：
    功能：输入用户类型和用户姓名，对表进行搜索，找出该用户的所有信息-->
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>

<html>

<head>
	
	<!--CSS样式-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
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
	<div class="roe" style="background-color: #999999;color:#FFFFFF">
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
							<a role="menuitem" tabindex="-1" onclick="window.location.href='deletemember.jsp'">删除用户</a>
						</li>
						<li role="presentation">
							<a role="menuitem" tabindex="-1" onclick="window.location.href='showmember.jsp'">修改用户信息</a>
						</li>
					</ul>
				</div>	
			</div>
		</div>	

	<!--查询信息模块-->
	<div class="col-md-9"> 			
		<h2><span class="label label-default">查询用户信息</span></h2>		
		<br> <br>		
	<form role="form"  method="POST">
				<div class="form-group">
					<label for="user_Type">用户类型</label>
					<input type="text" class="form-control" placeholder="请输入想查询人的类型：教师、学生、管理员" name="user_Type">
				</div>
				<div class="form-group">
					<label for="user_Name">用户姓名</label>
					<input type="text" class="form-control" placeholder="请输入想查询人的姓名"  name="user_Name">
				</div>
				<input type="submit" value="查询" name="submit">
			</form>	
		
<%
	//得到需要查询的用户类型及姓名
	String tableName_a=request.getParameter("user_Type");
	String userName_a=request.getParameter("user_Name");
	//out.println(tableName);
	//out.println("<br>");
	//out.println(userName);
	if(userName_a!=null && tableName_a!=null)
	{
		String sql_b=null;
		if(tableName_a.equals("管理员"))
		{		
			sql_b="select * from tylll.admin where admin_name='"+userName_a+"'";

		}
		else if(tableName_a.equals("教师"))
		{		
			sql_b="select * from tylll.teacher where tea_name='"+userName_a+"'";

		}
		else if(tableName_a.equals("学生"))
		{		
			sql_b="select * from tylll.student where stu_name='"+userName_a+"'";
		}
		if(sql_b!=null)
		{	
		ResultSet Is=stmt.executeQuery(sql_b); 
						
	%>			
	<!--用表格显示数据库查询所得的信息-->
	<br><br>
	<h2><span class="label label-default">查询结果</span></h2>
	<br><br>
 	<table class="table table-condensed" align="center">  
	<tbody>
        <%	
             while(Is.next())//遍历所有作业，查找符合要求的
             {
              %>
                <tr>
                  <td>学号/工号</td>
                  <td><%=Is.getString(1)%></td>
                <tr>
                  <td>姓名</td>
                  <td><%=Is.getString(2)%></td>
                <tr>
                  <td>密码</td>
                  <td><%=Is.getString(3)%></td>
                <tr>
              <%
             }
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
