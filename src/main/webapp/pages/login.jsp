<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Login</title>
		<link href="../css/Login.css" rel="stylesheet" type="text/css"/>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id="div1">
		<div id="div2">
		<h2>登录</h2>
		<form id="logform" onsubmit="return false">
			<table>
				<tr>
					<td class="td1">账号</td>
					<td><input type="text" name="luaccount" placeholder="请输入账号"/></td>
				</tr>
				<tr>
					<td class="td1">密码</td>
					<td><input type="password" name="lpwd" placeholder="请输入密码" /></td>
			 	</tr>
			</table>
		</form>
		</div>
			<div id="div3"><button class="logbuttons" id="logbutton" >go</button></div>
			<script type="text/javascript">
				var sub =document.getElementById("logbutton");
				sub.onclick=function (){
					$.ajax(
							{
								url: "/users/check",
								type: "POST",
								dataType: "json",
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								data : 	$("#logform").serialize(),

								success: function (data) {
									console.log(data);
									if (data.code == 10051){
										alert(data.msg);
									window.open("/pages/index.jsp", "_self");}
									else {
										alert(data.msg);
										window.open("/pages/index.jsp", "_self");}
								},
								error: function (error, date) {
									alert(data.msg)
								}
							})
				}
			</script>
			<div id="div4">
				<table>
					<tr>
						<td class="td2"><a href="zhuche.jsp">注册</a></td>
						<td>|</td>
						<td class="td2"><a href="find_pwd.jsp">忘记密码</a></td>
					</tr>
				</table>
			</div>	
		</form>
		</div>
	</body>
</html>
