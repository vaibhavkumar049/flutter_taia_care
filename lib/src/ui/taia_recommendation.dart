import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/listTile_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaiaRecommendation extends StatefulWidget {
  @override
  _TaiaRecommendationState createState() => _TaiaRecommendationState();
}

class _TaiaRecommendationState extends State<TaiaRecommendation> {

  double _height;
  double _width;
  List<ListTileModel> chatList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList = [
      ListTileModel(icon: FontAwesomeIcons.prescriptionBottleAlt,title: "Medikamente", subtitle: null, isLocked: false, count: 3),
      ListTileModel(icon: FontAwesomeIcons.heartbeat,title: "Begleiterkrankungen", subtitle:null, isLocked: false,count: 3 ),
      ListTileModel(icon: FontAwesomeIcons.signal,title: "Krankheitsverlauf", subtitle:null, isLocked: false,count: 3 ),
      ListTileModel(icon: FontAwesomeIcons.brain,title: "Mentale Gesundheit", subtitle:null, isLocked: false,count: 3 ),
      ListTileModel(icon: FontAwesomeIcons.walking,title: "Bewegung", subtitle:null, isLocked: false,count: 3 ),
      ListTileModel(icon: FontAwesomeIcons.utensils,title: "Ernährung", subtitle:null, isLocked: false ,count: 3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.brown,
      appBar: CustomAppBar.buildAppBar(context: context,title: "Taia‘s Empfehlungen") ,
      body: Container(
        height: _height,
        width: _width,
        color: Styles.whiteColor,
        margin: EdgeInsets.all(10),
        child: listChats()
      ),
    );
  }

  Widget listChats(){
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (_,index){
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(chatList[index].icon, color:iconColor(index) ,),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Text(chatList[index].title, style: TextStyle(fontSize: _width/25,)),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              Text("Maßnahmen", style: TextStyle(fontSize: _width/40),),
                              Text("${chatList[index].count}/10", style: TextStyle(fontSize: _width/20),)
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios, color: Styles.lightGrey,)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  Color iconColor(int index){
    switch(index){
      case 0:
        return Styles.lightBlue;
      case 1:
        return Styles.lightCyan;
      case 2:
        return Styles.softViolet;
      case 3:
        return Styles.softPink;
      case 4:
        return Styles.lightRedIcon;
      case 5:
        return Styles.lightYellow;
    }
    return Styles.transparent;
  }

}
