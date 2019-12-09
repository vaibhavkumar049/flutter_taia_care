import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  double _width;
  double _height;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Über Taia"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _topContainer(),
            _bottomContainer()
          ],
        ),
      ),
    );
  }

  Widget _topContainer(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('CE', style: TextStyle(fontSize: _width/20, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text('taiaCare Gbr'),
        SizedBox(height: 30,),
        Text('Address'),
        SizedBox(height: 30,),
        Text('Version: 1.1'),
      ],
    );
  }

  Widget _bottomContainer(){
    return Column(
      children: <Widget>[
        _buildButton("Nutzungsbedingungen"),
        _buildButton("Datenschutzrichtlinie"),
        _buildButton("Softwarelizenzen Dritter"),
      ],
    );
  }

  Widget _buildButton(String text){
    return Container(
      width: _width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15),),
          side: BorderSide(width: 1, color: Colors.grey[300])
        ),
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(text, style: TextStyle(fontSize: _width/20),),
            )
        ),
      ),
    );
  }
}
