<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Register</title>
		<link href="../css/zhuche.css" rel="stylesheet" type="text/css"/>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<p>注册</p>
		<hr />
		<div>
			<form id="regform" onsubmit="return false">
				<table>
					<tr>
						<td>
							账号：
						</td>
						<td>
							<input type="text" name="uaccount" required/>
						</td>
					</tr>
					<tr>
						<td>
							密码：
						</td>
						<td>
							<input  type="password" name="password" required/>
						</td>
					</tr>
				</table>
				<input type="button" id="regb" class="subbotton" value="注册">
			</form>
		</div>
	</body>
	<script type="text/javascript">
		var bnt = document.getElementById("regb");
		bnt.onmouseover=function(){
			bnt.style.backgroundColor="#9aa0dc";
		}
		bnt.onmouseout=function(){
			bnt.style.backgroundColor="#ffffff";
		}
		$("#regb").click(function (){
			var data= $("#regform").serializeArray();
			var postdata={};  //空数组
			$(data).each(function(i){
				postdata[this.name]=this.value     //遍历
			});
			console.log(data);
			$.ajax(
					{
						url:"/users",
						type:"POST",
						dataType:"json",
						data:JSON.stringify(postdata),
						contentType:"application/json;charset=UTF-8",
						//async:false,
						success: function (data) {
							console.log(data);
							if (data.code == 10011){
								alert(data.msg);
								window.open("/pages/login.jsp","_self");}
							else
								alert(data.msg);
						},
						error: function (error, data) {
							alert(data.msg)
						}
					})
		})
	</script>
</html>