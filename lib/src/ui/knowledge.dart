import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class Knowledge extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  double _height;
  double _width;
  bool showAvg = false;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.brown,
      body: Container(
        height: _height,
        width: _width,
        color: Styles.whiteColor,
        child: Stack(
          children: <Widget>[
            Container(
              height: 100,
              color: Styles.taiaGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Constant.TAIARECOMMENDATION);
          },
          child: Card(
              margin: EdgeInsets.only(left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: <Widget>[
                  Container(
                    height: _height / 8,
                    width: _width / 3,
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      "https://images-na.ssl-images-amazon.com/images/I/61lPLTJ4bCL._SY741_.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Taia’s Empfehlung"),
                        Text(
                          "Super! Du kannst nichts verbessern",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _width / 25),
                          maxLines: 2,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.only(left: 15, right: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[_today(), _pain(), _disease()],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _today() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Wohlbefinden"),
        Container(
          height: _height / 4,
         width: _width,
         // margin: EdgeInsets.only(top: 10),
          margin: EdgeInsets.only( top: 20, bottom: 15),
          padding: EdgeInsets.only(right: 15),
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  Widget _pain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Schmerzen"),
        Container(
          height: _height / 4,
          width: _width,
          margin: EdgeInsets.only(top: 20, bottom: 15),
          padding: EdgeInsets.only(right: 15),
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  Widget _disease() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Aktivität der RA"),
        Container(
          height: _height / 4,
          width: _width,
          margin: EdgeInsets.only(top: 20, bottom: 15),
          padding: EdgeInsets.only(right: 15),
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      backgroundColor: Colors.white,
      clipToBorder: true,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '40';
              case 2:
                return '41';
              case 3:
                return '42';
              case 4:
                return '43';
              case 5:
                return '44';
              case 6:
                return '45';
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 9:
                return '10';
            }
            return '';
          },
          reservedSize: 28,
          margin: 5,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(top: BorderSide( color: Styles.boxesNarrowsGrey), bottom: BorderSide( color: Styles.boxesNarrowsGrey))

      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 10),
            FlSpot(1, 5),
            FlSpot(2, 4),
            FlSpot(3, 3),
            FlSpot(4, 3),
            FlSpot(5, 2),
            FlSpot(6, 0),
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true, dotColor: Colors.blue),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
