
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'logic.dart';

class ChartsPage extends GetView<ChartsLogic> {
  var _myPageController = Get.put<ChartsLogic>(ChartsLogic());
  final logic = Get.find<ChartsLogic>();
  final state = Get
      .find<ChartsLogic>()
      .state;


  @override
  Widget build(BuildContext context) {
    _myPageController.generateData();
    return Scaffold(
      appBar: AppBar(
          title: new Center(child: Text("CHARTS")),
          automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [
            _buttonBar(),
            _typeOneCharts()
          ],
        ),
      ),
    );
  }

  Widget _buttonBar() {
    return Row(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                  child: Text("TYPE ONE"),
                  color: Colors.blue,
                  onPressed: () => {


                  }),
              RaisedButton(
                  child: Text("TYPE TWO"),
                  color: Colors.blue,
                  onPressed: () => {}),
              RaisedButton(
                  child: Text("TYPE THREE"),
                  color: Colors.blue,
                  onPressed: () => {})
            ],
          )
        ]
    );
  }

  Widget _typeOneCharts() {
    return Container(
      child: charts.BarChart(
        _myPageController.getSeriesData(),
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
        //behaviors: [new charts.SeriesLegend()],
        animationDuration: Duration(seconds: 5),

      ),

    );

  }
}
