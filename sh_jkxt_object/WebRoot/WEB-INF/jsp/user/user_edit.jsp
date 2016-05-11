<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/demo/demo.css">
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../js/main.js"></script>
<script type="text/javascript" src="../../../js/user/js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户</title>
</head>
<body>
	<div style="width:90%">
		<form id="fm" method="post" name="fm" action="user/edit">
			<table cellpadding="5">
				<tr>
	    			<td>用户名:</td>
	    			<td>
	    			<input type="hidden" name="user.id" value="${user.id }"></input>
	    			<input class="easyui-textbox" type="text" name="user.userName" value="${user.userName }"data-options="required:true"></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" type="text" name="user.name" value="${user.name }"data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td>
	    			<select name="user.sex" >
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>Email:</td>
	    			<td><input class="easyui-textbox" type="text" name="user.email" value="${user.email }" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>备注:</td>
	    			<td><textarea rows="10" cols="50" name="user.content">${user.content}</textarea></td>
	    		</tr>
	    		
	    	</table>
		</form>
		<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
	    </div>
	</div>
</body>
</html>