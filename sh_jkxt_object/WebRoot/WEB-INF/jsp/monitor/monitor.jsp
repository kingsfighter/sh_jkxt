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
<script type="text/javascript">
	function loadForm(){
		var row = $("#tt").datagrid('getSelected');
		$("#id").val(row.id);
		$("#appName").textbox('setValue',row.appName);
		$("#appName").textbox('setText',row.appName);
		$("#appStatus").val(row.appStatus);
		$("#accessCountMin").textbox('setText',row.accessCountMin);
		$("#accessCountMin").textbox('setValue',row.accessCountMin);
		$("#accessCountMax").textbox('setText',row.accessCountMax);
		$("#accessCountMax").textbox('setValue',row.accessCountMax);
		$("#appUrl").textbox('setText',row.appUrl);
		$("#appUrl").textbox('setValue',row.appUrl);
		$("#appDesc").val(row.appDesc);
	}
	
	$(document).ready(function(){  
		
		
	$("#tt").datagrid({
			columns : [ [ {
				field : 'id',
				width : 50,
				title : '网站ID'
			}, {
				field : 'appName',
				width : 100,
				title : '网站名称'
			}, {
				field : 'appStatus',
				width : 100,
				title : '网站状态',
				formatter : function(val, rec) {
					if (val == 1) {
						return '<span style="color:green;font-weight:bold;">运行</span>';
					} else {
						return '<span style="color:red;font-weight:bold;">关闭</span>';
					}
				}
			}, {
				field : 'accessCountMin',
				width : 100,
				title : '最小访问量'
			}, {
				field : 'accessCountMax',
				width : 100,
				title : '最大访问量'
			}, {
				field : 'appUrl',
				width : 200,
				title : '网站URL'
			}, {
				field : 'appDesc',
				width : 400,
				title : '网站描述'
			} ] ]
		});

	});
</script>
</head>
<body>
	<table id="tt" class="easyui-datagrid" style="width:80%;height:auto;" url="/monitor/list" toolbar="#tb" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="id" width="50">网站ID</th>
				<th field="appName" width="100">网站名称</th>
				<th field="appStatus" width="100">网站状态</th>
				<th field="accessCountMin" width="100">最小并发访问量</th>
				<th field="accessCountMax" width="100">最大并发访问量</th>
				<th field="appUrl" width="200">网站URL</th>
				<th field="appDesc" width="400">网站描述</th>
			</tr>                          
		</thead>                           
		<tbody>                            
		</tbody>                           
	</table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:showForm('新增监控对象','add')">增加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:showForm('修改监控对象','edit')">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:deleteRecord('/monitor/delete')">删除</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" name="fm" action="monitor/edit">
			<table cellpadding="5">
				<tr>
	    			<td>网站名称:</td>
	    			<td>
	    			<input type="hidden" id="id" name="monitorObjectConfig.id">
	    			<input class="easyui-textbox" type="text" id="appName" name="monitorObjectConfig.appName" data-options="required:true"></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>网站状态:</td>
	    			<td><select name="monitorObjectConfig.appStatus" id="appStatus">
						<option value=1>运行</option>
						<option value=0>关闭</option>
					</select></td>
	    		</tr>
	    		<tr>
	    			<td>最小访问量:</td>
	    			<td><input class="easyui-numberbox" precision="0" min="0" max="999999" type="text" id="accessCountMin" name="monitorObjectConfig.accessCountMin" data-options="required:true,validType:'number'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>最大访问量:</td>
	    			<td><input class="easyui-numberbox" precision="0" min="0" max="999999" type="text"  id="accessCountMax" name="monitorObjectConfig.accessCountMax" data-options="required:true,validType:'number'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>网站URL:</td>
	    			<td><input class="easyui-textbox" type="text" id="appUrl" name="monitorObjectConfig.appUrl" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>描述:</td>
	    			<td><textarea rows="10" cols="50" id="appDesc"  name="monitorObjectConfig.appDesc"></textarea></td>
	    		</tr>
	    		
	    	</table>
		</form>
		<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div>
</body>
</html>