import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/listTile_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  double _width;
  double _height;
  List<ListTileModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list =[
      ListTileModel(icon: FontAwesomeIcons.key, title: "Passwort ändern", subtitle: "Ändere dein Passwort"),
      ListTileModel(icon: FontAwesomeIcons.paperclip, title: "Daten anfordern", subtitle: "Wir schicken dir alle deine gespeicherten Daten per E-Mail zu",),
      ListTileModel(icon: FontAwesomeIcons.eraser, title: "Account löschen", subtitle: "Wir löschen alle deine Daten. Diese Aktion kann nicht rückgängig gemacht werden",),
    ];

  }


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Benutzerkonto"),
      body: Container(
        height: _height,
        width: _width,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            listChats(),
            SizedBox(height: 20,),
            CustomButton(text: "ABMELDEN",
              onTap: () {

              },
              isDelete: true,
              icon: FontAwesomeIcons.signOutAlt,
            )
          ],
        ),
      ),
    );
  }

  Widget listChats(){
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_,index){
            return InkWell(
              onTap: (){
                if(index==0){
                  print("0");
                }else if(index==1){
                  print("1");
                  Navigator.of(context).pushNamed(Constant.REQUESTDATA);
                } else if(index==2){
                  print("2");
                  Navigator.of(context).pushNamed(Constant.DELETEACCOUNT);
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
      ),
    );
  }
}
