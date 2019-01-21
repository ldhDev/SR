<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>


<c:if test="${!empty chart }">

<c:if test="${type == 'gender' }"><!-- ������Ʈ -->

    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
	
        var data = google.visualization.arrayToDataTable([
          ['����', '����'],
          ['����',  ${chart.m_use}],
          ['����',  ${chart.f_use}],
          ['��ȸ��', ${chart.nomember_use}]
        ]);
 
        var options = {
          width:508,
          height:211,
          legend: { position: 'labeled' },
          fontSize:14,
          title: '���� ������ �̿����'
        };

        var chart = new google.visualization.PieChart(document.getElementById('charts'));

        chart.draw(data, options);
      }
    </script>

</c:if> <!-- ������Ʈ �� -->


<c:if test="${type == 'age' }"><!-- ������Ʈ -->

<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {

     // var button = document.getElementById('charts');
      var chartDiv = document.getElementById('charts');

      var data = google.visualization.arrayToDataTable([
        ['���ɴ�', '�̿�Ƚ��'],
        ['10��', ${chart.age_10}],
        ['20��', ${chart.age_20}], 
        ['30��', ${chart.age_30}],
        ['40��', ${chart.age_40}],
        ['50��', ${chart.age_50}], 
        ['60�� �̻�', ${chart.age_60}]
   
      ]);

      var materialOptions = { //�Ⱦ�
        width: 508,
        chart: {
          title: '����� ������ ���ɴ뺰 �̿���Ȳ',
         
        },
        series: {
          0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
          1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
        },
        axes: {
          y: {
            distance: {label: '�̿�Ƚ��'}, // Left y-axis.
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
        title: '���ɴ뺰 �̿���Ȳ',
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

</c:if> <!-- ��Ʈ ���� -->




<c:if test="${empty chart }">
	<div id="no_chart"
		style="height: 210px;width: 508px; line-height: 210px; font-size: 16px; font-weight: bold; font-family: 'Nanum Gothic'; text-align: center;color: gray;"
	>
		��ϵ� ��������� �����ϴ�.
	</div>
</c:if>