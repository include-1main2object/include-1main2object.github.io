<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<body>
<%
	String driver="com.mysql.jdbc.Driver";
	// URL指向要访问的数据库名tylll
	String url= "jdbc:mysql://localhost:3306/tylll";
	//MySQL配置时的用户名
	String user="root";
	//密码
	String password="tls2379335";
	//数据库名
	String dbName="tylll";	
	// 1 加载驱动程序
	Class.forName(driver);
	// 2 连接数据库
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	PreparedStatement ps=null;
	%>
</body>
