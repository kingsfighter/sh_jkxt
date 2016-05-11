<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/demo/demo.css">
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../js/main.js"></script>
<script type="text/javascript" src="../../../js/user/user.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	用户页面！
	
	<table id="tt" class="easyui-datagrid" style="width:80%;height:auto;" url="/user/list" toolbar="#tb" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="id" width="50">用户ID</th>
				<th field="userName" width="100">用户名</th>
				<th field="name" width="100">真实姓名</th>
				<th field="sex" width="50">性别</th>
				<th field="email" width="100">电子邮箱</th>
				<th field="content" width="200">备注</th>
			</tr>                          
		</thead>                           
		<tbody>                            
		</tbody>                           
	</table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:showFormPage('新增用户','add','/user/showAddView')">增加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:showFormPage('修改用户','edit','/user/showEditView')">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:deleteRecord('/user/delete')">删除</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons"></div>
</body>
</html>