
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加</title>
    <link href="../css/zhuche.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!--这里最好放入本地文件-->
</head>
<body onload="upselectfunction()">
<p>修改</p>
<hr />
<div>
    <form id="insform" onsubmit="return false">
        <table>
            <tr>
                <td>
                    nid：
                </td>
                <td>
                    <input id="inid" name="nid" type="text"  readonly="readonly"  required />
                </td>
            </tr>
            <tr>
                <td>
                    uid：
                </td>
                <td>
                    <input id="iuid" name="uid" type="text"  readonly="readonly" value=${sessionScope.loguid} required />
                </td>
            </tr>
            <tr>
                <td>
                    事件：
                </td>
                <td>
                    <input id="ievent" name="nevent" type="text" required value=""/>
                </td>
            </tr>
            <tr>
                <td>
                    紧急程度：
                </td>
                <td class='tdleft'>
                    <input  type="radio" value=1 name="nlevel"  />重要且紧急
                    <input  type="radio" value=2 name="nlevel"  />重要但不紧急
                    <input  type="radio" value=3 name="nlevel" />不重要但紧急
                    <input  type="radio" value=4 name="nlevel"  />不重要且不紧急
                </td>
            </tr>
            <tr>
                <td>
                    天数：
                </td>
                <td>
                    <input id="iday" name="nday" type="text" />
                </td>
            </tr>
            <tr>
                <td>
                    小时：
                </td>
                <td>
                    <input id="ihour" name="nhour" type="text" />
                </td>
            </tr>
        </table>
        <input type="submit" class="subbotton" id="sbu" value="提交" >
        <input  class="subbotton" id="s2" type="reset" value="清空"/>
    </form>
    <script type="text/javascript">
        var onid = document.cookie;
        console.log(onid);
       function upselectfunction(){
           $.ajax(
               {
                   url:"/notes/getone/"+onid,
                   type:"GET",
                   dataType:"json",
                   contentType: "application/json;charset=utf-8",
                   async:false,
                   success:
                   function (result){
                       alert(result.msg)
                       console.log(result)
                       if(result.code == 10041){
                       $("#inid").val(result.data.nid);
                       $("#ievent").val(result.data.nevent);
                       $("#iday").val(result.data.nday);
                       $("#ihour").val(result.data.nhour);}
                       else{
                           history.go(-1);
                       }

                   },
                   error(erro,result){
                       alert(result.msg);
                   }
       })}
        $("#sbu").click(function (){
            var data= $("#insform").serializeArray();
            var postdata={};  //空数组
            $(data).each(function(i){
                postdata[this.name]=this.value     //遍历
            });
            $.ajax(
                {
                    url:"/notes/update",
                    type:"PUT",
                    dataType:"json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(postdata),
                    async:false,
                    success:
                        function (result) {
                            console.log(result);
                            if (result.code == 10021){
                                alert(result.msg);
                                window.open("/pages/index.jsp","_self");}
                            else
                                alert(result.msg);
                        },
                    error:
                        function (error, data) {
                            alert(data.msg)
                        }
                })
        })
    </script>
</div>
</body>
</html>