<%@page import="java.util.List"%>
<%@page import="com.demo.common.model.MonitorObjectConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.monitor{
	font-size:12px;
	margin-left:10px;
}
</style>
<script type="text/javascript" src="../../../js/jquery-1.4.4.min.js"></script>
<script src="../../../js/highcharts/highcharts.js"></script>
<script src="../../../js/highcharts/exporting.js"></script>
<script type="text/javascript">
var autoReresh;
function showChart(arr,objectArr){
	if(!arr){
		return ;
	}
	if(autoReresh){
		clearTimeout(autoReresh);
	}
	var chart;
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
    
    var series = [];
    
    for(var i=0;i<arr.length;i++){
    	var serial = {
    			//objectId:arr[i].list[0].objectId,
    	        name: arr[i].list[0].appName,
    	        //生成x,y初始化数据
    	        data: (function () {
    	            // generate an array of random data
    	            var data = [],
    	                time = (new Date()).getTime(),
    	                j;
					
    	            for (j = 0; j < 20; j += 1) {
    	                data.push({
    	                    x: time + j * 1000,
    	                    y: (function(v){
    	                    	if(v == undefined ){
    	                    		return 0;
    	                    	}else{
    	                    		return v.accessCount;
    	                    	}
    	                    })(arr[i].list[j])
    	                });
    	            }
    	            return data;
    	        }())
    	    };
    	series.push(serial);
    }
    
    chart = $('#container').highcharts({
        chart: {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
            	// 动态刷新
                load: function () {
                	if(objectArr.length > 0){
                		var seriess = this.series;
                		autoReresh = setInterval(function () {
                       			// set up the updating of the chart each second
                       	        var x = (new Date()).getTime(); // current time
                       	     	var y = 0;
                	        	$.ajax({
                	    			url:'/monitor/lastLog?appIds='+objectArr.toString(),
                	    			dataType:'json',
                	    			success:function(msg){
                	    				for(var i=0;i<seriess.length;i++){
                	    					var series = seriess[i];
                	    					for(var j=0;j<msg.length;j++){
                	    						if(msg[j].appName == series.name){
                	    							y = msg[j].accessCount;
                	    							break;
                	    						}
                	    					}
                     	                    //更新x,y轴数据
                     	                    series.addPoint([x, y], true, true);
                	    				}
                	    			},
                	    			error:function(){
                	    				//alert("获取监控数据失败，请重试！");
                	    			}
                	    		});
               	        }, 2000);
                	}
                }
            }
        },
        title: {
            text: '系统状态及访问量实时监控'
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval:300
        },
        yAxis: {
            title: {
                text: '访问量'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: true
        },
        exporting: {
            enabled: false
        },
        series: series
    });
}

$(document).ready(function () {
	showChart();
	
});

function changeChart(checkbox){
	
	if($(checkbox).attr("checked")){
		if($(":checkbox:checked").length > 3){
			alert("最多同时监控3个系统");
			return false;
		}
	}else{
		if($(":checkbox:checked").length < 1){
			alert("请最少选择一个要监控的系统");
			return false;
		}
	}
	
	var arr = [];
	$(":checkbox").each(function(){
		if($(this).attr("checked")){
			arr.push($(this).val());
		}
	});
	if(arr.length > 0){
		$.ajax({
			url:'/monitor/chartData',
			data:{appIds:arr.toString()},
			dataType:'json',
			success:function(msg){
				if(msg.success){
					showChart(msg.data,arr);
				}else{
					alert("获取监控数据失败，请重试！");
				}
			},
			error:function(){
				alert("获取监控数据失败，请重试！");
			}
		});
	}else{
		showChart(null,arr);
	}
	
}

</script>
</head>
<body>
<div style="margin:0 auto;">
	<%
		List<MonitorObjectConfig> monitors = (List<MonitorObjectConfig>)request.getAttribute("monitors");
		for(MonitorObjectConfig monitor : monitors){
		    out.write("<span class='monitor'>"+ monitor.getAppName() +"<input type='checkbox' value='"+ monitor.getId() +"' name='monitors' onclick='return changeChart(this);'/></span>");
		}
	%>
</div>
<div id="container" style="min-width:310px;height:400px;margin:0 auto;"></div>
</body>
</html>