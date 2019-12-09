import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/task_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height;
  double _width;
  List<TaskModel> tasks = List();
  final int itemLength2 = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks= [
      TaskModel(title: "Methotrexat 15mg", subtitle: "18:00 Uhr"),
      TaskModel(title: "Methotrexat 15mg", subtitle: "18:00 Uhr"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          children: <Widget>[
            firstHalf(),
            Expanded(child: secondHalf())
          ],
        ),
      ),
    );
  }

  Widget firstHalf(){
    return Container(
      height: _height/2,
      width: _width,
      color: Styles.taiaGreen,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: _height/4,
            width: _width/3,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Image.network("https://images-na.ssl-images-amazon.com/images/I/61lPLTJ4bCL._SY741_.jpg", fit: BoxFit.contain,),
          ),
          SizedBox(width: 10,),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Hallo, ich bin Taia", style: TextStyle(color: Styles.whiteColor, fontSize: _width/20),),
               /* SizedBox(height: 10,),
                Text("Ernährung", style: TextStyle(color: Styles.whiteColor, fontSize: _width/15),),*/
                SizedBox(height: 10,),
                SizedBox(
                  width: _width,
                  child: RaisedButton(
                    onPressed: (){},
                    color: Styles.whiteColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text("Hallo Taia", style: TextStyle(fontSize: _width/20, color: Styles.taiaGreen),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget secondHalf(){
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 5),
              itemCount: tasks.length>1?tasks.length+1:itemLength2+1,
                itemBuilder: (_,index){
                print("task length:${tasks.length}");
                  return tasks.length ==0? Card(child: Text(""),)
                      :tasks.length == index?  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                          width: _width,
                          child: RaisedButton(
                            onPressed: (){},
                            color: Styles.whiteColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add, color: Styles.taiaGreen,),
                                Text("Medikament")
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: SizedBox(
                          width: _width,
                          child: RaisedButton(
                            onPressed: (){},
                            color: Styles.whiteColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add, color: Styles.taiaGreen,),
                                Text("Arzttermin")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      :InkWell(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(tasks[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(tasks[index].subtitle)
                              ],
                            ),
                            Container(
                              width: _width / 20,
                              height: _height / 30,
                              decoration: BoxDecoration(
                                  color:
                                  //model.radioButton3? Styles.taiaGreen :
                                  Styles
                                      .whiteColor,
                                  border: Border.all(color:
                                  //!model.radioButton3 ?
                                  Colors
                                      .black
                                      //: Styles.taiaGreen
                                  ),
                                  shape: BoxShape.circle
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            )
        ),

      ],
    );
  }
}
