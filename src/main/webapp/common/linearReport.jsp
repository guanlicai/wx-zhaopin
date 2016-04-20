<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<title>JSChart</title>

<script type="text/javascript" src="http://127.0.0.1:8080/admin/assets/js/jscharts.js"></script>

</head>
<body>

<div id="graph">Loading graph...</div>

<script type="text/javascript">
	var myData = new Array([01, 7.80], [02, 4.80], [03, 6.50], [04, 6.10], [05, 4.40], [06, 5.80], [07, 4.00], [08, 8.50], [09, 8.90], [10, 9.20], [11, 9.20], [12, 9.20]);
	var myChart = new JSChart('graph', 'line');
	myChart.setDataArray(myData);
	myChart.setTitle('线性统计报表');
	myChart.setTitleColor('#8E8E8E');
	myChart.setTitleFontSize(11);
	myChart.setAxisNameX('');
	myChart.setAxisNameY('');
	myChart.setAxisColor('#8420CA');
	myChart.setAxisValuesColor('#949494');
	myChart.setAxisPaddingLeft(100);
	myChart.setAxisPaddingRight(120);
	myChart.setAxisPaddingTop(50);
	myChart.setAxisPaddingBottom(40);
	myChart.setAxisValuesDecimals(3);
	myChart.setAxisValuesNumberX(10);
	myChart.setShowXValues(false);
	myChart.setGridColor('#C5A2DE');
	myChart.setLineColor('#BBBBBB');
	myChart.setLineWidth(2);
	myChart.setFlagColor('#9D12FD');
	myChart.setFlagRadius(4);
	myChart.setTooltip([01, 'GDP 7.80']);
	myChart.setTooltip([02, 'GDP 4.80']);
	myChart.setTooltip([03, 'GDP 6.50']);
	myChart.setTooltip([04, 'GDP 6.10']);
	myChart.setTooltip([05, 'GDP 4.40']);
	myChart.setTooltip([06, 'GDP 5.80']);
	myChart.setTooltip([07, 'GDP 4.00']);
	myChart.setTooltip([08, 'GDP 8.50']);
	myChart.setTooltip([09, 'GDP 8.90']);
	myChart.setTooltip([10, 'GDP 9.20']);
	myChart.setTooltip([11, 'GDP 9.20']);
	myChart.setTooltip([12, 'GDP 9.20']);
	myChart.setLabelX([01, '01']);
	myChart.setLabelX([02, '02']);
	myChart.setLabelX([03, '03']);
	myChart.setLabelX([04, '04']);
	myChart.setLabelX([05, '05']);
	myChart.setLabelX([06, '06']);
	myChart.setLabelX([07, '07']);
	myChart.setLabelX([08, '08']);
	myChart.setLabelX([09, '09']);
	myChart.setLabelX([10, '10']);
	myChart.setLabelX([11, '11']);
	myChart.setLabelX([12, '12']);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('chart_bg.jpg');
	myChart.draw();
</script>

</body>
</html>