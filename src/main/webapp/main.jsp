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
        min-height: 700px;
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
              <a href="main.jsp" class="dropdown-toggle fui-user" data-toggle="dropdown">职位统计<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="jobsByRequirements.jsp">职位需求</a></li>
                <li><a href="jobsBySalaries.jsp">薪水情况</a></li>
                <li><a href="aluminees.jsp">校友人才分布</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle fui-gear" data-toggle="dropdown"> 个人设置<b class="caret"></b></a>
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
            <li href="main.jsp" class="active"><a class="fui-user">职位统计</a></li>
            	<li><a href="jobsByRequirements.jsp">职位需求</a></li>
                <li><a href="jobsBySalaries.jsp">薪水情况</a></li>
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
		        <h5 ><font color="#1abc9c">概览</font></h5>
		      </div>
		      <div id="graph" style="height:400px"></div>
           </div>
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
    var data1forGraph1 = []
    var data2forGraph1 = []
    
    $(document).ready(function(){
    	getDataforGraph4()
    	
    	var myChart = echarts.init(document.getElementById('graph'));
    	
    	var option = {
        	    title : {
        	        text: '全国主要城市互联网职位分布',
        	        subtext: '',
        	        sublink: '',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item'
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        x:'left',
        	        data:['职位需求']
        	    },
        	    dataRange: {
        	        min : 0,
        	        max : 500,
        	        calculable : true,
        	        color: ['maroon','purple','red','orange','yellow','lightgreen']
        	    },
        	    toolbox: {
        	        show : true,
        	        orient : 'vertical',
        	        x: 'right',
        	        y: 'center',
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    series : [
        	        {
        	            name: '职位需求',
        	            type: 'map',
        	            mapType: 'china',
        	            hoverable: false,
        	            roam:true,
        	            data : [],
        	            markPoint : {
        	                symbolSize: 5,       // 标注大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
        	                itemStyle: {
        	                    normal: {
        	                        borderColor: '#87cefa',
        	                        borderWidth: 1,            // 标注边线线宽，单位px，默认为1
        	                        label: {
        	                            show: false
        	                        }
        	                    },
        	                    emphasis: {
        	                        borderColor: '#1e90ff',
        	                        borderWidth: 5,
        	                        label: {
        	                            show: false
        	                        }
        	                    }
        	                },
        	                data : [
        	                    {name: "青岛", value: 9},
        	                    {name: "上海", value: 700},
        	                    {name: "威海", value: 5},
        	                    {name: "厦门", value: 5},
        	                    {name: "烟台", value: 1},
        	                    {name: "福州", value: 1},
        	                    {name: "宁波", value: 2},
        	                    {name: "东莞", value: 4},
        	                    {name: "惠州", value: 2},
        	                    {name: "广州", value: 171},
        	                    {name: "昆明", value: 1},
        	                    {name: "深圳", value: 337},
        	                    {name: "珠海", value: 38},
        	                    {name: "佛山", value: 1},
        	                    {name: "海口", value: 1},
        	                    {name: "大连", value: 24},
        	                    {name: "沈阳", value: 2},
        	                    {name: "苏州", value: 4},
        	                    {name: "南昌", value: 2},
        	                    {name: "吉林", value: 2},
        	                    {name: "呼和浩特", value: 2},
        	                    {name: "成都", value: 38},
        	                    {name: "西安", value: 10},
        	                    {name: "重庆", value: 24},
        	                    {name: "南京", value: 24},
        	                    {name: "北京", value: 2547},
        	                    {name: "杭州", value: 446},
        	                    {name: "济南", value: 1},
        	                    {name: "天津", value: 6},
        	                    {name: "哈尔滨", value: 1},
        	                    {name: "石家庄", value: 2},
        	                    {name: "长沙", value: 41},
        	                    {name: "合肥", value: 2},
        	                    {name: "武汉", value: 3}
        	                 
        	                ]
        	            },
        	            geoCoord: {
        	               
        	                
        	                "青岛":[120.33,36.07],
        	                
        	                
        	          
        	                "上海":[121.48,31.22],
        	                
        	                "威海":[122.1,37.5],
        
        	                "厦门":[118.1,24.46],
        	                
        	                "烟台":[121.39,37.52],
        	                "福州":[119.3,26.08],
        	                
        	                "宁波":[121.56,29.86],
        	                
        	                "东莞":[113.75,23.04],
        	                
        	                "惠州":[114.4,23.09],
        	                
        	                "广州":[113.23,23.16],
        	                
        	                "昆明":[102.73,25.04],
        	                
        	                "深圳":[114.07,22.62],
        	                "珠海":[113.52,22.3],
        	               
        	                "佛山":[113.11,23.05],
        	                "海口":[110.35,20.02],
        	                
        	                "大连":[121.62,38.92],
        	                
        	                "沈阳":[123.38,41.8],
        	                "苏州":[120.62,31.32],
        	                
        	                
        	                "南昌":[115.89,28.68],
        	                
        	                "吉林":[126.57,43.87],
        	                
        	                "呼和浩特":[111.65,40.82],
        	                "成都":[104.06,30.67],
        	                
        	                "西安":[108.95,34.27],
        	                
        	                "重庆":[106.54,29.59],
        	                
        	                "南京":[118.78,32.04],
        	                
        	                
        	                
        	                "北京":[116.46,39.92],
        	                
        	                
        	                "杭州":[120.19,30.26],
        	                
        	                "济南":[117,36.65],
        	                
        	                
        	                "天津":[117.2,39.13],
        	                
        	                "哈尔滨":[126.63,45.75],
        	                
        	                "秦皇岛":[119.57,39.95],
        	                
        	                "石家庄":[114.48,38.03],
        	                
        	                "长沙":[113,28.21],
        	                
        	                "合肥":[117.27,31.86],
        	                "武汉":[114.31,30.52],
        	                
        	            }
        	        },
        	        {
        	            name: 'Top12',
        	            type: 'map',
        	            mapType: 'china',
        	            data:[],
        	            markPoint : {
        	                symbol:'emptyCircle',
        	                symbolSize : function (v){
        	                    return 10 + v/100
        	                },
        	                effect : {
        	                    show: true,
        	                    shadowBlur : 0
        	                },
        	                itemStyle:{
        	                    normal:{
        	                        label:{show:false}
        	                    }
        	                },
        	                data : [
        	                	{name: "上海", value: 700},
        	                	{name: "广州", value: 171},
        	                	{name: "深圳", value: 337},
        	                    {name: "珠海", value: 38},
        	                    {name: "大连", value: 24},
        	                    {name: "成都", value: 38},
        	                    {name: "西安", value: 10},
        	                    {name: "重庆", value: 24},
        	                    {name: "南京", value: 24},
        	                    {name: "北京", value: 2547},
        	                    {name: "杭州", value: 446},
        	                    {name: "长沙", value: 41},
        	                ]
        	            }
        	        }
        	    ]
        	};
        	                    
        myChart.setOption(option); 	
    });
    
    function getDataforGraph4(){
    	$.ajax({
	   		  url: "http://localhost:8080/jobAnalysis/getPositionsBycity.action",
	   		  dataType: 'jsonp',
	   		  jsonp:'jsoncallback',
	   		  type: 'get',
	   		  async:false,
	   		  success:function(data){
	   			  
	   			  $.each(data,function(i,item){
	   				data1forGraph1.push(item.indices) 
	   				data2forGraph1.push(item.requirements)
	   			  });
	   		  },
	   		  error:function(XMLHttpRequest, textStatus, errorThrown){
	   			  alert(errorThrown)
	   		  }
	   	     });
    }
     
   
    
    </script>

  </body>
</html>