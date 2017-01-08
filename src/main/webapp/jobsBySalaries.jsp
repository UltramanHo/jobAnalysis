<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>互联网行业分析系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="css/vendor/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
   
    <link rel="shortcut icon" href="../../dist/img/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="../../dist/js/vendor/html5shiv.js"></script>
      <script src="../../dist/js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <style>
      body {
        min-height: 2000px;
        padding-top: 53px;
      }
    </style>

    <!-- Static navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
          </button>
          <a class="navbar-brand" href="#">互联网行业分析系统</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#" class="fui-home"> 主页</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle fui-user" data-toggle="dropdown">职位统计<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="jobsByRequirements.jsp">职位需求</a></li>
                <li><a href="jobsBySalaries.jsp">薪水情况</a></li>
                <li><a href="aluminees.jsp">校友人才分布</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="main.jsp" class="dropdown-toggle fui-gear" data-toggle="dropdown"> 个人设置<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#" data-toggle="modal" >个人信息</a></li>
                <li><a href="findPass.html">修改密码</a></li>
                <li class="divider"></li>
                <li><a href="login.html">退出</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

 <div class="container-fluid">
      <div class="row">
        <div class="col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li ><a href="main.jsp" class="fui-user">职位统计</a></li>
            	<li><a href="jobsByRequirements.jsp">职位需求</a></li>
                <li class="active"><a href="jobsBySalaries.jsp">薪水情况</a></li>
                <li><a href="aluminees.jsp">校友人才分布</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a class="fui-gear"> 设置</a></li>
            <li><a href="#">个人信息</a></li>
            <li><a href="findPass.html">修改密码</a></li>
            <li><a href="login.html">退出</a></li>
          </ul>
        </div>
        
        <div class="main">
         <div class="jumbotron">
           <div class="row-fluid">
		      <div class="page-header">
		        <h5 ><font color="#1abc9c">按照领域统计薪水情况</font></h5>
		      </div>
		      <div id="graph1" style="height:300px"></div>
           </div>
          </div>
          
          <div class="jumbotron">
           <div class="row-fluid">
		      <div class="page-header">
		        <h5 ><font color="#1abc9c">按照职位类型统计薪水情况</font></h5>
		      </div>
		      <div id="graph2" style="height:300px"></div>
           </div>
          </div>
          
          <div class="jumbotron">
           <div class="row-fluid">
		      <div class="page-header">
		        <h5 ><font color="#1abc9c">按照资历统计薪水情况</font></h5>
		      </div>
		      <div id="graph3" style="height:300px"></div>
           </div>
        </div> 
        
        <div class="jumbotron">
	           <div class="row-fluid">
			      <div class="page-header">
			        <h5 ><font color="#1abc9c">按照工作城市统计薪水情况</font></h5>
			      </div>
			      <div id="graph4" style="height:300px"></div>
	           </div>
        </div>    
      </div>
  </div>
 <!-- /container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/vendor/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/flat-ui.min.js"></script>
    <script src="js/application.js"></script>
    <script src="js/echarts-all.js"></script>
    <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('graph1')); 
    var myChart2 = echarts.init(document.getElementById('graph2'));
    var myChart3 = echarts.init(document.getElementById('graph3'));
    var myChart4 = echarts.init(document.getElementById('graph4'));
    var option = {
            tooltip: {
                show: true
            },
            legend: {
                data:['销量']
            },
            xAxis : [
                {
                    type : 'category',
                    data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    "name":"销量",
                    "type":"bar",
                    "data":[5, 20, 40, 10, 10, 20]
                }
            ]
        };
    
    var option2 = {
    	    title : {
    	        text: '未来一周气温变化',
    	        subtext: '纯属虚构'
    	    },
    	    tooltip : {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data:['最高气温','最低气温']
    	    },
    	    toolbox: {
    	        show : true,
    	        feature : {
    	            mark : {show: true},
    	            dataView : {show: true, readOnly: false},
    	            magicType : {show: true, type: ['line', 'bar']},
    	            restore : {show: true},
    	            saveAsImage : {show: true}
    	        }
    	    },
    	    calculable : true,
    	    xAxis : [
    	        {
    	            type : 'category',
    	            boundaryGap : false,
    	            data : ['周一','周二','周三','周四','周五','周六','周日']
    	        }
    	    ],
    	    yAxis : [
    	        {
    	            type : 'value',
    	            axisLabel : {
    	                formatter: '{value} °C'
    	            }
    	        }
    	    ],
    	    series : [
    	        {
    	            name:'最高气温',
    	            type:'line',
    	            data:[11, 11, 15, 13, 12, 13, 10],
    	            markPoint : {
    	                data : [
    	                    {type : 'max', name: '最大值'},
    	                    {type : 'min', name: '最小值'}
    	                ]
    	            },
    	            markLine : {
    	                data : [
    	                    {type : 'average', name: '平均值'}
    	                ]
    	            }
    	        },
    	        {
    	            name:'最低气温',
    	            type:'line',
    	            data:[1, -2, 2, 5, 3, 2, 0],
    	            markPoint : {
    	                data : [
    	                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
    	                ]
    	            },
    	            markLine : {
    	                data : [
    	                    {type : 'average', name : '平均值'}
    	                ]
    	            }
    	        }
    	    ]
    	};
    
    myChart.setOption(option); 
    myChart2.setOption(option2);
    myChart3.setOption(option2);
    myChart4.setOption(option2);
    </script>
  </body>
</html>