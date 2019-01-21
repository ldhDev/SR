<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>


<c:if test="${!empty chart }">

<c:if test="${type == 'gender' }"><!-- 성비차트 -->

    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
	
        var data = google.visualization.arrayToDataTable([
          ['성별', '비율'],
          ['남자',  ${chart.m_use}],
          ['여자',  ${chart.f_use}],
          ['비회원', ${chart.nomember_use}]
        ]);
 
        var options = {
          width:508,
          height:211,
          legend: { position: 'labeled' },
          fontSize:14,
          title: '남녀 자전거 이용비율'
        };

        var chart = new google.visualization.PieChart(document.getElementById('charts'));

        chart.draw(data, options);
      }
    </script>

</c:if> <!-- 성비차트 끝 -->


<c:if test="${type == 'age' }"><!-- 성비차트 -->

<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {

     // var button = document.getElementById('charts');
      var chartDiv = document.getElementById('charts');

      var data = google.visualization.arrayToDataTable([
        ['연령대', '이용횟수'],
        ['10대', ${chart.age_10}],
        ['20대', ${chart.age_20}], 
        ['30대', ${chart.age_30}],
        ['40대', ${chart.age_40}],
        ['50대', ${chart.age_50}], 
        ['60대 이상', ${chart.age_60}]
   
      ]);

      var materialOptions = { //안씀
        width: 508,
        chart: {
          title: '서울시 따릉이 연령대별 이용현황',
         
        },
        series: {
          0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
          1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
        },
        axes: {
          y: {
            distance: {label: '이용횟수'}, // Left y-axis.
            brightness: {side: 'right', label: 'apparent magnitude'} // Right y-axis.
          }
        }
      };

      var classicOptions = {
        width: 508,
        height: 211,
        legend: { position: 'bottom' },
        series: {
        	0: { color: '#26872e' }
        },
        title: '연령대별 이용현황',
        vAxes: {
          // Adds titles to each axis.
          //0: {title: 'parsecs'},
        }
      };
      
      var classicChart = new google.visualization.ColumnChart(chartDiv);
      classicChart.draw(data, classicOptions);

      //      var materialChart = new google.charts.Bar(chartDiv);
//      materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
      
      
 /*
      function drawMaterialChart() {
        var materialChart = new google.charts.Bar(chartDiv);
        materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
        button.innerText = 'Change to Classic';
        button.onclick = drawClassicChart;
      }

      function drawClassicChart() {
        
        button.innerText = 'Change to Material';
        button.onclick = drawMaterialChart;
      }
 */

      drawMaterialChart();
  };
    </script>

</c:if>

</c:if> <!-- 차트 있음 -->




<c:if test="${empty chart }">
	<div id="no_chart"
		style="height: 210px;width: 508px; line-height: 210px; font-size: 16px; font-weight: bold; font-family: 'Nanum Gothic'; text-align: center;color: gray;"
	>
		등록된 통계정보가 없습니다.
	</div>
</c:if>