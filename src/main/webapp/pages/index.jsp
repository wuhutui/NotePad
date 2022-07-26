<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>记事簿</title>
		<link href="../css/index.css" rel="stylesheet" type="text/css"/>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	 
	<body>
		<div class="header w">
			<ul>
				<li><a href="login.jsp">登录</a></li>
			</ul>
		</div>
		<div class="banner w"><img src="../img/bannertext.png"/></div>
		<div class="main w">
			<h2 color="white">MyNote</h2>
			<div id="div-for-note">
				<button  id="s"  class="savebutton">Select</button>
				<button  id="i"  class="savebutton">Insert</button>
				<button id="d" class="savebutton">Delete</button>
				<button id="u" class="savebutton">Update</button>
				<table class="table-central" id="table-d">
					<thead>
					<tr>
						<td>编号</td>
						<td>事件</td>
						<td>紧急程度</td>
						<td>天数</td>
						<td>时间</td>
					</tr>
					</thead>
					<tbody id="tb">

					    </tbody>
				</table>
			</div>
			</div>
		</div>
		<script type="text/javascript">

			var bnt = document.getElementById("s");
			var bnt1 = document.getElementById("i");
			var bnt2 = document.getElementById("d");
			var bnt3 = document.getElementById("u");
			var uid = ${sessionScope.loguid};
			bnt.onmouseover=function(){
				bnt.style.backgroundColor="#9aa0dc";
			}

			bnt.onmouseout=function(){
				bnt.style.backgroundColor="#b1dcdb";
			}
			bnt1.onmouseover=function(){
				bnt1.style.backgroundColor="#9aa0dc";
			}

			bnt1.onmouseout=function(){
				bnt1.style.backgroundColor="#b1dcdb";
			}
			bnt2.onmouseover=function(){
				bnt2.style.backgroundColor="#9aa0dc";
			}

			bnt2.onmouseout=function(){
				bnt2.style.backgroundColor="#b1dcdb";
			}
			bnt3.onmouseover=function(){
				bnt3.style.backgroundColor="#9aa0dc";
			}

			bnt3.onmouseout=function(){
				bnt3.style.backgroundColor="#b1dcdb";
			}

			bnt1.onclick=function(){
				window.open("insert.jsp",'_self');
			}
			bnt2.onclick=function() {
				var nid = prompt("请输入一个编号进行永久删除？");
                if (nid != null){
                    $.ajax({
					url: "/notes/del/"+nid,
					type: "DELETE",
					dataType: "json",
					success:
							function (data){
								console.log(data);
								alert(data.msg);
								window.location.reload();
							},
					error: function (error,date) {
						alert(date.msg);
					}

				})
			}
            else
                {
                    alert("取消删除");
                }
            }
			bnt3.onclick=function() {
				var nid = prompt("输入需要修改的项目编号：")
                document.cookie=nid;
				if(nid != null)
				window.open("update.jsp","_self");
				else
					parent.location.reload();
			}
			bnt.onclick=function() {
				$.ajax(
						{
							url: "/notes/"+uid,
							type: "get",
							dataType: "json",
							success:
									function (data){
										console.log(data);
										var html='';
										$.each(data.data,function (i,result) {
											 iddate=JSON.stringify(data.data[i].nid);
											html += "<tr>" +
													"<td>" + result['nid'] + "</td>" +
													"<td>" + result['nevent'] + "</td>" +
													"<td>" + result['nlevel'] + "</td>" +
													"<td>" + result['nday'] + "</td>" +
													"<td>" + result['nhour'] + "</td>" +
													"</tr>";
										})
										$('#tb').html(html);
									},
							error: function (error,date) {
								alert(date.msg);
							}
						}
				)
			}

		</script>

			</body>
</html>