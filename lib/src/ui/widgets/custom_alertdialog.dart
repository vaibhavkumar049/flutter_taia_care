import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/list_model.dart';
import 'package:flutter_taia_care/src/provider/library_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class CustomDialogBox{
  static void showAlertDialog(BuildContext context, String title, String message,
      {@required double width, int actionID}) {
//actionID is used as flag to establish various route ways
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontSize: width / 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                      fontSize: width / 30, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                if (actionID != null && actionID == 0) {
/* Navigator.of(context).pushReplacementNamed(Constant.MY_ADS);*/
                  Navigator.of(context).pop(true);
                } else if (actionID != null && actionID == 1) {
                  //Navigator.of(context).pushReplacementNamed(Constant.MY_ADS);
                } else if (actionID != null && actionID == 3) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void buildDialog( BuildContext context,String title,double _height, double _width,{List<ListModel> list,dynamic model}) {
    showCupertinoModalPopup(
        context: context,
        //barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (context,setState){
              return SimpleDialog(
                children: <Widget>[
                  Container(
                    //  margin: EdgeInsets.only(bottom: 20),
                    height: _height/1.5,
                    width: _width,
                    //color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric( horizontal:15.0),
                              child: Text(title),
                            ),
                            IconButton(onPressed: (){
                              Navigator.of(context).pop();
                            }
                                ,icon: Icon(Icons.clear, color: Styles.taiaGreen,))
                          ],
                        ),
                        Container(
                          height: 1,
                          width: _width,
                          color: Colors.grey[100],
                        ),
                        Expanded(
                          //height: _height/3,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 0),
                              itemCount: list.length,
                              itemBuilder: (_,index){
                                return InkWell(
                                  onTap: (){
//                                    model.setIsSelected(!list[index].status);
                                    model.setSelectedCategory(list[index].text);

                                    setState(() {
                                      list.forEach((element) => element.status = false);
                                      list[index].status = !list[index].status;

                                    });
                                    Navigator.of(context).pop();



                                    /*    print("Is Selected value: ${model.isSelected}");
                                        print("Selected category: ${model.selectedCategory}");*/
                                  },
                                  child: Container(
                                    color: list[index].status?Styles.taiaGreen:Colors.white,
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(list[index].text),
                                        Container(
                                          width: _width / 10,
                                          height: _height / 20,
                                          decoration: BoxDecoration(
                                              color: Styles.whiteColor,
                                              border: Border.all(color: Styles.boxesNarrowsGrey),
                                              shape: BoxShape.circle
                                          ),
                                          child: list[index].status?Icon(Icons.check):SizedBox(),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            /* child: CustomDialog(_height, _width, list, model));*/
          );
        });}


}


