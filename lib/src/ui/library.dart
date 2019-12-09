import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/listTile_model.dart';
import 'package:flutter_taia_care/src/provider/library_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  double _height;
  double _width;
  LibraryViewModel model;
  List<String> list = List();
  List<ListTileModel> chatList = List();

  void buildDialog( double _height, double _width, LibraryViewModel model,{List<String> list}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
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
                              Text("Kategorie auswählen"),
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

                                    setState(() {
                                      model.setIsSelected(!model.isSelected);
                                      model.setSelectedCategory(list[index]);
                                    });

                                  print("Is Selected value: ${model.isSelected}");
                                  print("Selected category: ${model.selectedCategory}");
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(list[index]),
                                          Container(
                                            width: _width / 20,
                                            height: _height / 30,
                                            decoration: BoxDecoration(
                                                color: model.isSelected? Styles.taiaGreen : Styles
                                                    .whiteColor,
                                                border: Border.all(color: !model.isSelected ? Colors
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
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = LibraryViewModel();
    list = [
      "Alles anzeigen",
      "Schmerzen",
      "Medikamente",
      "Komorbiditäten",
      "Krankheitsverlauf",
      "Mentale Gesundheit",
      "Bewegung",
      "Ernährung",
      "Ergotherapie",
    ];

    chatList = [
      ListTileModel(icon: Icons.local_hospital,title: "Medication", subtitle:"Shopping list with anti-inflammatory foods that help you to decrease pain and flares.", isLocked: false ),
      ListTileModel(icon: Icons.shopping_cart,title: "Shopping List", subtitle:"Shopping list with anti-inflammatory foods that help you to decrease pain and flares.", isLocked: false ),
      ListTileModel(icon: Icons.shopping_cart,title: "Shopping List", subtitle:"Shopping list with anti-inflammatory foods that help you to decrease pain and flares.", isLocked: true ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      body:  SafeArea(
        child: Container(
          height: _height,
          width: _width,
          color: Styles.whiteColor,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: _width,
                padding: EdgeInsets.all(10),
                color: Styles.taiaGreen,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Kategorie", style: TextStyle(color: Styles.greyTextColor),),
                       InkWell(
                         onTap: (){
                          buildDialog( _height, _width, model, list: list);
                         },
                         child: Row(
                           children: <Widget>[
                             Text(model.selectedCategory!=null && model.selectedCategory.trim().length>0? model.selectedCategory: "Alles anzeigen"),
                             Icon(Icons.arrow_drop_down)
                           ],
                         ),
                       )
                      ],
                    ),
                  ),
                ),
              ),
              listChats()
            ],
          ),
        ),
      ),
    );
  }

  Widget listChats(){
    return Expanded(
        child: ListView.builder(
          itemCount: chatList.length,
            itemBuilder: (_,index){
              return Container(
                height: _height/6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: !chatList[index].isLocked? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(chatList[index].icon)
                          ],
                        ),
                        SizedBox(width: 10,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(chatList[index].title, style: TextStyle(fontSize: _width/20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text(chatList[index].subtitle, maxLines: 5,),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ],
                    ),
                  ):Icon(Icons.lock, size: 40, color: Styles.greyTextColor,)
                ),
              );
            }
        )
    );
  }
}


