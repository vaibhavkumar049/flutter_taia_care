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

  static void buildDialog( BuildContext context,String title,double _height, double _width,{List<ListModel> list}) {
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
                    height: _height/2,
                    width: _width,
                    //color: Colors.red,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only( left:8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(title),
                                  IconButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }
                                      ,icon: Icon(Icons.clear, color: Styles.taiaGreen,))
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: _width,
                              color: Colors.grey[100],
                            ),
                            Container(
                              height: _height/3,
                              child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (_,index){
                                    return InkWell(
                                      onTap: (){
//                                    model.setIsSelected(!list[index].status);
                                       // model.setSelectedCategory(list[index].text);

                                        setState(() {
                                          list.forEach((element) => element.status = false);
                                          list[index].status = !list[index].status;

                                        });



                                    /*    print("Is Selected value: ${model.isSelected}");
                                        print("Selected category: ${model.selectedCategory}");*/
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(list[index].text),
                                              Container(
                                                width: _width / 20,
                                                height: _height / 30,
                                                decoration: BoxDecoration(
                                                    color: list[index].status? Styles.taiaGreen : Styles
                                                        .whiteColor,
                                                    border: Border.all(color: !list[index].status ? Colors
                                                        .black : Styles.taiaGreen),
                                                    shape: BoxShape.circle
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 1,
                                width: _width,
                                color: Colors.grey[100],
                              ),
                              SizedBox(
                                width: _width,
                                child: FlatButton(onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                    child: Text("AUSWÄHLEN", style: TextStyle(
                                        color: Styles.taiaGreen),)),
                              )
                            ],
                          ),
                        )
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


