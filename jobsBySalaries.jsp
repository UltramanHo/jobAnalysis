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
    //启动前获取所有的数据
    var data1forGraph1 = []
    var data2forGraph1 = []
    var data3forGraph1 = []
    var data1forGraph2 = []
    var data2forGraph2 = []
	var data3forGraph2 = []
    var data1forGraph3 = []
    var data2forGraph3 = []
    var data3forGraph3 = [] 
    var data1forGraph4 = []
    var data2forGraph4 = []
    var data3forGraph4 = [] 
    $(document).ready(function(){
      //初始化第一张表
	  getDataforGraph1()
	  var myChart = echarts.init(document.getElementById('graph1'));
	    var option = {
	    	    title : {
	    	        text: '薪水变化趋势图',
	    	    },
	    	    tooltip : {
	    	        trigger: 'axis'
	    	    },
	    	    legend: {
	    	        data:['薪水上限','薪水下限']
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
	    	            data : data1forGraph1
	    	        }
	    	    ],
	    	    yAxis : [
	    	        {
	    	            type : 'value',
	    	            axisLabel : {
	    	                formatter: '{value} K'
	    	            }
	    	        }
	    	    ],
	    	    series : [
	    	        {
	    	            name:'薪水上限',
	    	            type:'line',
	    	            data:data2forGraph1,
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
	    	            name:'薪水下限',
	    	            type:'line',
	    	            data:data3forGraph1,
	    	            markPoint : {
	    	                data : [
		    	                    {type : 'max', name: '最大值'},
		    	                    {type : 'min', name: '最小值'}
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
	  //初始化第二张表
	  getDataforGraph2()
	  var myChart2 = echarts.init(document.getElementById('graph2'));
	  
	    var option2 = {
	    	    title : {
	    	        text: '薪水变化趋势图',
	    	    },
	    	    tooltip : {
	    	        trigger: 'axis'
	    	    },
	    	    legend: {
	    	        data:['薪水上限','薪水下限']
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
	    	            data : data1forGraph2
	    	        }
	    	    ],
	    	    yAxis : [
	    	        {
	    	            type : 'value',
	    	            axisLabel : {
	    	                formatter: '{value} K'
	    	            }
	    	        }
	    	    ],
	    	    series : [
	    	        {
	    	            name:'薪水上限',
	    	            type:'line',
	    	            data:data2forGraph2,
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
	    	            name:'薪水下限',
	    	            type:'line',
	    	            data:data3forGraph2,
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
	    	        }
	    	    ]
	    	};
	  myChart2.setOption(option2);
	  
	 //初始化第三张表
	 getDataforGraph3()
	  var myChart3 = echarts.init(document.getElementById('graph3'));
	 
	    var option3 = {
	    	    title : {
	    	        text: '薪水变化趋势图',
	    	    },
	    	    tooltip : {
	    	        trigger: 'axis'
	    	    },
	    	    legend: {
	    	        data:['薪水上限','薪水下限']
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
	    	            data : data1forGraph3
	    	        }
	    	    ],
	    	    yAxis : [
	    	        {
	    	            type : 'value',
	    	            axisLabel : {
	    	                formatter: '{value} K'
	    	            }
	    	        }
	    	    ],
	    	    series : [
	    	        {
	    	            name:'薪水上限',
	    	            type:'line',
	    	            data:data2forGraph3,
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
	    	            name:'薪水下限',
	    	            type:'line',
	    	            data:data3forGraph3,
	    	            markPoint : {
	    	                data : [
		    	                    {type : 'max', name: '最大值'},
		    	                    {type : 'min', name: '最小值'}
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
	  myChart3.setOption(option3);
	  
	//初始化第四张表
	  getDataforGraph4()
	  var myChart4 = echarts.init(document.getElementById('graph4'));
	 
	    var option4 = {
	    	    title : {
	    	        text: '薪水变化趋势图',
	    	    },
	    	    tooltip : {
	    	        trigger: 'axis'
	    	    },
	    	    legend: {
	    	        data:['薪水上限','薪水下限']
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
	    	            data : data1forGraph4
	    	        }
	    	    ],
	    	    yAxis : [
	    	        {
	    	            type : 'value',
	    	            axisLabel : {
	    	                formatter: '{value} K'
	    	            }
	    	        }
	    	    ],
	    	    series : [
	    	        {
	    	            name:'薪水上限',
	    	            type:'line',
	    	            data:data2forGraph4,
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
	    	            name:'薪水下限',
	    	            type:'line',
	    	            data:data3forGraph4,
	    	            markPoint : {
	    	                data : [
		    	                    {type : 'max', name: '最大值'},
		    	                    {type : 'min', name: '最小值'}
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
	  myChart4.setOption(option4);  
	});
    
    function getDataforGraph1(){
	  $.ajax({
	   		  url: "http://localhost:8080/jobAnalysis/getSalariesByfields.action",
	   		  dataType: 'jsonp',
	   		  jsonp:'jsoncallback',
	   		  type: 'get',
	   		  async:false,
	   		  success:function(data){
	   			 
	   			  $.each(data,function(i,item){
	   				data1forGraph1.push(item.indices) 
	   				data2forGraph1.push(item.requirements)
 	   				data3forGraph1.push(item.requirements2) 
	   			  });
	   		  },
	   		  error:function(XMLHttpRequest, textStatus, errorThrown){
	   			  alert(errorThrown)
	   		  }
	   	     });
    }
    
    function getDataforGraph2(){
	   	$.ajax({
	   		  url: "http://localhost:8080/jobAnalysis/getSalariesBykinds.action",
	   		  dataType: 'jsonp',
	   		  jsonp:'jsoncallback',
	   		  type: 'get',
	   		  async:false,
	   		  success:function(data){
	
	   			  $.each(data,function(i,item){
	   				data1forGraph2.push(item.indices) 
	   				data2forGraph2.push(item.requirements)
 	   				data3forGraph2.push(item.requirements2)
	   			  });
	   		  },
	   		  error:function(XMLHttpRequest, textStatus, errorThrown){
	   			  alert(errorThrown)
	   		  }
	   	     });
    }
    
    function getDataforGraph3(){
    	$.ajax({
	   		  url: "http://localhost:8080/jobAnalysis/getSalariesByyear.action",
	   		  dataType: 'jsonp',
	   		  jsonp:'jsoncallback',
	   		  type: 'get',
	   		  async:false,
	   		  success:function(data){
	   			  
	   			  $.each(data,function(i,item){
	   				data1forGraph3.push(item.indices) 
	   				data2forGraph3.push(item.requirements)
 	   				data3forGraph3.push(item.requirements2) 
	   			  });
	   		  },
	   		  error:function(XMLHttpRequest, textStatus, errorThrown){
	   			  alert(errorThrown)
	   		  }
	   	     });
    }
    
    function getDataforGraph4(){
    	$.ajax({
	   		  url: "http://localhost:8080/jobAnalysis/getSalariesBycity.action",
	   		  dataType: 'jsonp',
	   		  jsonp:'jsoncallback',
	   		  type: 'get',
	   		  async:false,
	   		  success:function(data){
	   			  
	   			  $.each(data,function(i,item){
	   				data1forGraph4.push(item.indices) 
	   				data2forGraph4.push(item.requirements)
 	   				data3forGraph4.push(item.requirements2) 
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