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
        min-height: 800px;
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
            <li ><a href="main.jsp" class="fui-user">职位统计</a></li>
            	 <li><a href="jobsByRequirements.jsp">职位需求</a></li>
                <li><a href="jobsBySalaries.jsp">薪水情况</a></li>
                <li class="active"><a href="aluminees.jsp">校友人才分布</a></li>
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
		        <h5 ><font color="#1abc9c">按照工作城市统计人才分布</font></h5>
		      </div>
		      <div id="graph1" style="height:400px"></div>
           </div>
          </div>
          
          <div class="jumbotron">
           <div class="row-fluid">
		      <div class="page-header">
		        <h5 ><font color="#1abc9c">按照公司统计人才分布</font></h5>
		      </div>
		      <div id="graph2" style="height:400px"></div>
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
    var option = {
    	    title : {
    	        text: '2014年浙大软件学院人才去向城市统计',
    	        x:'left'
    	    },
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
    	    },
    	    toolbox: {
    	        show : true,
    	        feature : {
    	            mark : {show: true},
    	            dataView : {show: true, readOnly: false},
    	            magicType : {
    	                show: true, 
    	                type: ['pie', 'funnel'],
    	                option: {
    	                    funnel: {
    	                        x: '25%',
    	                        width: '50%',
    	                        funnelAlign: 'left',
    	                        max: 1548
    	                    }
    	                }
    	            },
    	            restore : {show: true},
    	            saveAsImage : {show: true}
    	        }
    	    },
    	    calculable : true,
    	    series : [
    	        {
    	            name:'城市',
    	            type:'pie',
    	            radius : '55%',
    	            center: ['50%', '60%'],
    	            data:[
    	                {value:172, name:'浙江'},
    	                {value:70, name:'上海'},
    	                {value:36, name:'北京'},
    	                {value:23, name:'广东'},
    	                {value:15, name:'江苏'},
    	                {value:15, name:'其他'}
    	            ]
    	        }
    	    ]
    	};
    var option2 = {
    	    color : [
    	        'rgba(255, 69, 0, 0.5)',
    	        'rgba(255, 150, 0, 0.5)',
    	        'rgba(255, 200, 0, 0.5)',
    	        'rgba(155, 200, 50, 0.5)',
    	        'rgba(55, 200, 100, 0.5)'
    	    ],
    	    title : {
    	        text: '2014年浙大软件学院人才去向公司统计',
    	    },
    	    
    	    toolbox: {
    	        show : true,
    	        feature : {
    	            mark : {show: true},
    	            dataView : {show: true, readOnly: false},
    	            restore : {show: true},
    	            saveAsImage : {show: true}
    	        }
    	    },
    	    calculable : true,
    	    series : [
    	 
    	              {
    	                  name:'公司',
    	                  type:'funnel',
    	                  x: '-5%',
    	                  width: '80%',
    	                  maxSize: '300%',
    	                  itemStyle: {
    	                      normal: {
    	                          label: {
    	                              formatter: '{b}'
    	                          },
    	                          labelLine: {
    	                              show : false
    	                          }
    	                      },
    	                      emphasis: {
    	                          label: {
    	                              position:'inside',
    	                              formatter: '{b}公司 : {c}人'
    	                          }
    	                      }
    	                  },
    	                  data:[
    	      	                {value:21, name:'阿里巴巴'},
    	      	                {value:16, name:'华为'},
    	      	                {value:12, name:'网易'},
    	      	                {value:10, name:'百度'},
    	      	                {value:9, name:'腾讯&杭州华三通信技术有限公司&SAP'} ,
    	      	                {value:8, name:'IBM'},
    	      	                {value:5, name:'广东佳邦信息咨询有限公司&宁波智慧物流科技有限公司'} ,
    	      	                {value:4, name:'大众点评&中国移动通信集团&中国工商银行股份有限公司'} ,
    	      	                {value:3, name:'京东&思科系统（中国）研发有限公司&新浪微博'},
    	      	                {value:2, name:'微策略软件（杭州) 有限公司&中国银行&携程计算机技术（上海）有限公司'},
    	      	                
    	      	            ]
    	              },
    	          
    	        
    	    ]
    	};
    	                    
    	                    
    
    myChart.setOption(option); 
    myChart2.setOption(option2);
   
    </script>
  </body>
</html>