import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

import "bar_data.dart";
class MyBarGraph extends StatelessWidget {
  List<double> weeklysummary=[];
  MyBarGraph({ required this.weeklysummary});
  @override
  Widget build(BuildContext context) {
    BarData myBardata= BarData(
      sunAmount: weeklysummary[0],
      monAmount: weeklysummary[1],
      tueAmount: weeklysummary[2],
      wedAmount: weeklysummary[3],
      thurAmount:weeklysummary[4],
      friAmount: weeklysummary[5],
      satAmount: weeklysummary[6],
    );
    myBardata.intializeBarData();
    List<BarChartGroupData> barChartGroupDataList = myBardata.barData.map((data) => BarChartGroupData(
      x: data.x.toInt(),
      barRods: [
        BarChartRodData(
          toY: data.y,
          color:Color(0xFF7A82B0),
          width:25,
          borderRadius: BorderRadius.circular(1),
          backDrawRodData: BackgroundBarChartRodData(
            show:true,
            toY:100,
            color:Colors.white,
          )
        ),
      ],
    )).toList();
    return BarChart(
        BarChartData(
            maxY:100,
            minY:0,
          gridData: FlGridData(show:false),
          borderData: FlBorderData(show:false),
          titlesData: FlTitlesData(
            show:true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: bottomTitles )
            ),
          barGroups: barChartGroupDataList,
        )
    );
  }
}
SideTitles get bottomTitles => SideTitles(
  showTitles: true,
  getTitlesWidget: (value, meta) {
    String text = '';
    switch (value.toInt()) {
      case 0:
        text = 'Sun';
        break;
      case 1:
        text = 'Mon';
        break;
      case 2:
        text = 'Tue';
        break;
      case 3:
        text = 'Wed';
        break;
      case 4:
        text = 'Thur';
        break;
      case 5:
        text = 'Fri';
        break;
      case 6:
        text = 'Sat';
        break;
    }

    return Text(text);
  },
);

