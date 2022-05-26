import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/Dashboard_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({ Key? key }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
late List<Data> _chartData;
late TooltipBehavior _tooltipBehavior;
  
  @override
  void initState() {
    _chartData = getChartData;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: ListTile(
                title: const Text('Username'),
                leading: CircleAvatar(backgroundColor: Colors.black54),
                trailing: Icon(Icons.add),
              ),
            ),
            Expanded(
              flex: 20,
              child:Stack(
                children: [
                  Container(
                    color: Colors.green[100],
                  ),
                  Positioned(
                    top: 30,
                    left: 80,
                    
                    child: Container(
                      child: const Text('Total'),
                      
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 84,
                    
                    child: Container(
                      child: Text('\$\$\$'),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    right: 50,
                    child: Container(
                      color: Colors.green[300],
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text('52.4%'),
                      ),
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex:30,
              child: Container(
                child: SfCircularChart(
                  legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                  series: <CircularSeries>[
                    PieSeries<Data, String>(
                      dataSource: _chartData,
                      xValueMapper: (Data data, _)=>data.sector,
                      yValueMapper: (Data data, _)=>data.holding,
                      dataLabelSettings: DataLabelSettings(isVisible: true,),
                      enableTooltip: true
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Top Performer')
                  ),
              )
                ),
            Expanded(
              flex:35,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,int index){
                  return Container(
                    child: ListTile(
                      title: const Text('Ticker'),
                      subtitle: const Text('Name'),
                      trailing: const Text('55%')
                    ),
                  );
                }),
            ),
          ],
        ),
      )
    );
  }
  List<Data> get getChartData{
    final List<Data> chartData = [
      Data("Commercial Banks",20),
      Data('Deveopment Banks',30),
      Data('Hydropower',10),
      Data('Microfinance',20),
      Data('Agriculture Banks',10),
      Data('Finance',10),
    ];
    return chartData;
  }
}