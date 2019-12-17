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

  Widget _body(){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Constant.TAIARECOMMENDATION);
          },
          child: Card(
            margin: EdgeInsets.only(left: 10, right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: _height/8,
                  width: _width/3,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Image.network("https://images-na.ssl-images-amazon.com/images/I/61lPLTJ4bCL._SY741_.jpg", fit: BoxFit.contain,),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Taia’s Empfehlung"),
                      Text("Super! Du kannst nichts verbessern", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _width/25), maxLines: 2,)
                    ],
                  ),
                )
              ],
            )
          ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _today(),
                  _pain(),
                  _disease()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _today(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Wohlbefinden")
      ],
    );
  }
  Widget _pain(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Schmerzen")
      ],
    );
  }
  Widget _disease(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Aktivität der RA")
      ],
    );
  }
}
