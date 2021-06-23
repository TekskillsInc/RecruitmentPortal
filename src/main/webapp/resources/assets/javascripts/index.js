var chart;
var legend;

var chartData = [{
    country: "TOTAL",
    value: 1500},
{
    country: "SELECTED",
    value: 350},
{
    country: "REJECTED",
    value: 120},
{
    country: "ON HOLD",
    value: 60}];

AmCharts.ready(function() {
    // PIE CHART
    chart = new AmCharts.AmPieChart();
    chart.dataProvider = chartData;
    chart.titleField = "country";
    chart.valueField = "value";
    //chart.outlineColor = "";
    chart.outlineAlpha = 0.8;
    chart.outlineThickness = 2;
    // this makes the chart 3D
    chart.depth3D = 20;
    chart.angle = 30;

    // WRITE
    chart.write("chartdiv");
});