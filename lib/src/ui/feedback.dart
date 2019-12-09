import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/listTile_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  double _width;
  double _height;

  List<ListTileModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list =[
      ListTileModel(icon: FontAwesomeIcons.commentDots, title: "Schreibe uns", subtitle: "Hast du Feedback, Fragen oder Anregungen? Teile sie uns mit"),
      ListTileModel(icon: FontAwesomeIcons.star, title: "Bewerte Taia", subtitle: "Bewerte uns im App-Store",),
    ];

  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Feedback"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(10),
        child: listChats(),
      ),
    );
  }

  Widget listChats(){
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_,index){
          return InkWell(
            onTap: (){
              if(index==0){
                print("0");
                Navigator.of(context).pushNamed(Constant.SENDFEEDBACK);
              }else if(index==1){
                print("1");
              }
            },
            child: Container(
              height: _height/6,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: <Widget>[
                              // !list[index].isSvg?Icon(list[index].icon,color: Styles.taiaGreen,):SvgPicture.asset(list[index].image, height: 50, width: 50,color: Styles.taiaGreen,allowDrawingOutsideViewBox: true,),
                              Icon(list[index].icon,color: Styles.taiaGreen,),
                              SizedBox(width: 20,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(list[index].title, style: TextStyle(fontSize: _width/25, fontWeight: FontWeight.w500),),
                                    SizedBox(height: 15,),
                                    Text(list[index].subtitle, maxLines: 5,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios, color: Colors.grey[400],)
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ),
          );
        }
    );
  }
}
