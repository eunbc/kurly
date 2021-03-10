<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/WEB-INF/views/include/bs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>	
	<style>
	    .chart--container {
	      height: 60%;
	      width: 100%;
	      min-height: 530px;
	      margin: 0 auto;
	    }
	
	    .zc-ref {
	      display: none;
	    }	
		.admin-main{
			display: inline-block;
			width: 200px;
			height: 150px;
			border: 4px solid black;
			margin: 20px;		
			border-radius: 10px;
		} 
		.title {
			text-align: center;
			font-size: 20px;
			font-weight: bold;
			padding: 7px;	
			border-bottom: 1px solid black;		
		}
		.content{
			padding: 30px 55px;
			font-weight: 800;
			font-size: 25px;
		}
		.content a{
			text-decoration: none;
			color: black;
		}
		.box1 {
			border-color: #1976d2;
		}
		.box2 {
			border-color: #424242;
		}
		.box3 {
			border-color: #388e3c;
		}
		.box4 {
			border-color: #ffa000;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav_admin.jsp"%>
<div class="content-default">
	<div style="text-align:center;font-weight: bold;"><h3>관리자 메인</h3></div>
	<div class="admin-main box1" style="margin-left:80px;">
		<div class="title">오늘 가입한 회원</div>
		<div class="content"><a href="${contextPath}/admin/memberList">${NewMemberCnt}명 ></a></div>
	</div>

	<div class="admin-main box2">
		<div class="title">품절 현황</div>
		<div class="content"><a href="${contextPath}/admin/goodsList">${OutofStock}건 ></a></div>
	</div>

	<div class="admin-main box3">
		<div class="title">1:1문의 현황</div>
		<div class="content"><a href="${contextPath}/admin/inquiry?iREPLY=답변대기중">${InquiryCnt}건 ></a></div>
	</div>

	<div class="admin-main box4">
		<div class="title">오늘의 주문건수</div>
		<div class="content"><a href="${contextPath}/admin/orderList">${OrderCntToday}건 ></a></div>
	</div>

 	<div id="myChart" class="chart--container"><a class="zc-ref" href="https://www.zingchart.com/">Powered by ZingChart</a></div>

</div>
  <script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    let initState = null; // Used later to store the chart state before changing the data
    let bgColors = ['#1976d2', '#424242', '#388e3c', '#ffa000']; // mathworks, ansys, arenasimulation, omnetpp, promodel
    let chartConfig = {
      type: 'bar',
      theme: 'classic',
      globals: {
        fontFamily: 'Helvetica'
      },
      backgroundColor: 'white',
      title: {
        text: '',
        backgroundColor: 'white',
        color: '#606060'
      },
      subtitle: {
        text: '',
        color: '#606060'
      },
      plot: {
        hoverState: {
          border: "2px solid #ffff00"
        },
        tooltip: {
          visible: false
        },
        valueBox: {
          text: '%v',
          color: '#606060',
          textDecoration: 'underline'
        },
        animation: {
          effect: 'ANIMATION_EXPAND_HORIZONTAL'
        },
        cursor: 'hand',
        dataBrowser: [
          '<span style=\'font-weight:bold;color:#1976d2;\'>오늘 가입한 회원</span>',
          '<span style=\'font-weight:bold;color:#424242;\'>품절 현황</span>',
          '<span style=\'font-weight:bold;color:#388e3c;\'>1:1문의 현황</span>',
          '<span style=\'font-weight:bold;color:#ffa000;\'>오늘의 주문건수</span>',
        ],
        rules: [{
            backgroundColor: '#1976d2',
            rule: '%i==0'
          },
          {
            backgroundColor: '#424242',
            rule: '%i==1'
          },
          {
            backgroundColor: '#388e3c',
            rule: '%i==2'
          },
          {
            backgroundColor: '#ffa000',
            rule: '%i==3'
          }
        ]
      },
      scaleX: {
        values: ['오늘 가입한 회원', '품절 현황', '1:1문의 현황', '오늘의 주문건수'],
        guide: {
          visible: false
        },
        item: {
          color: '#606060'
        },
        lineColor: '#C0D0E0',
        lineWidth: '1px',
        tick: {
          lineColor: '#C0D0E0',
          lineWidth: '1px'
        }
      },
      scaleY: {
        guide: {
          lineStyle: 'solid'
        },
        item: {
          color: '#606060'
        },
        lineColor: 'none',
        tick: {
          lineColor: 'none'
        }
      },
      crosshairX: {
        lineColor: 'none',
        lineWidth: '0px',
        marker: {
          visible: false
        },
        plotLabel: {
          text: '%data-browser: %v',
          padding: '8px',
          alpha: 0.9,
          backgroundColor: 'white',
          borderRadius: '4px',
          borderWidth: '3px',
          callout: true,
          calloutPosition: 'bottom',
          color: '#606060',
          fontSize: '12px',
          multiple: true,
          offsetY: '-20px',
          placement: 'node-top',
          rules: [{
              borderColor: '#1976d2',
              rule: '%i==0'
            },
            {
              borderColor: '#424242',
              rule: '%i==1'
            },
            {
              borderColor: '#388e3c',
              rule: '%i==2'
            },
            {
              borderColor: '#ffa000',
              rule: '%i==3'
            },
            {
              borderColor: '#7b1fa2',
              rule: '%i==4'
            },
            {
              borderColor: '#c2185b',
              rule: '%i==5'
            }
          ],
          shadow: false
        },
        scaleLabel: {
          visible: false
        }
      },
      series: [{
        values: [${NewMemberCnt}, ${OutofStock}, ${InquiryCnt}, ${OrderCntToday}]
      }]
    };

    let updateChart = (p) => {
      initState = zingchart.exec(p.id, 'getdata'); // Gets the state of the chart when the node was clicked
      let newValues = null;
      let update = null;
      switch (p.nodeindex) {
        case 0:
          newValues = store['mathworks'];
          update = true;
          break;
        case 1:
          newValues = store['ansys'];
          update = true;
          break;
        case 2:
          newValues = store['arenasimulation'];
          update = true;
          break;
        case 3:
          newValues = store['omnetpp'];
          update = true;
          break;
        case 5:
          update = false; // We don't want to allow drilldown for unknown
          break;
      }

      if (update) {
        zingchart.unbind(p.id, 'node_click'); // Disable node_click for second level
        zingchart.exec(p.id, 'modify', {
          update: false, // Making multiple changes, queue these changes
          data: {
            crosshairX: {
              plotLabel: {
                text: '%v% of total',
                borderColor: bgColors[p.nodeindex],
                rules: []
              }
            },
            plot: {
              backgroundColor: bgColors[p.nodeindex],
              cursor: null,
              rules: []
            },
            scaleX: {
              values: []
            }
          }
        });
        zingchart.exec(p.id, 'setseriesvalues', { // Replaces all values at plotindex 0
          update: false, // Queue these, too
          plotindex: 0,
          values: newValues
        });
        zingchart.exec(p.id, 'update'); // Push queued changes
        zingchart.bind(p.id, 'animation_end', () => { // When the animation ends...
          zingchart.exec(p.id, 'addobject', { // ...add a back button
            type: 'shape',
            data: {
              type: 'rectangle',
              id: 'back_btn',
              backgroundColor: '#ffffff #f6f6f6',
              borderColor: '#888',
              borderWidth: '1px',
              cursor: 'hand',
              hoverState: {
                backgroundColor: '#1976D2 #ffffff',
                borderColor: '#57a2ff',
                fillAngle: -180
              },
              label: {
                text: '< Back',
                color: '#606060'
              },
              width: '70px',
              height: '20px',
              x: '80%',
              y: '16%'
            }
          });
        });
      }
    };

    zingchart.render({
      id: 'myChart',
      data: chartConfig,
      height: '100%',
      width: '100%',
    });

  </script>	
</body>
</html>