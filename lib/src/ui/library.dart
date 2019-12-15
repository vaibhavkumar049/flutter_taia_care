import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/listTile_model.dart';
import 'package:flutter_taia_care/src/model/list_model.dart';
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
  List<ListModel> list = List();
  List<ListTileModel> chatList = List();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = LibraryViewModel();
    list = [
      ListModel(
        text: "Alles anzeigen",
        status: false,
      ),
      ListModel(
        text: "Schmerzen",
        status: false,
      ),
      ListModel(
        text: "Medikamente",
        status: false,
      ),
      ListModel(
        text: "Komorbiditäten",
        status: false,
      ),
      ListModel(
        text: "Krankheitsverlauf",
        status: false,
      ),
      ListModel(
        text: "Mentale Gesundheit",
        status: false,
      ),
      ListModel(
        text: "Bewegung",
        status: false,
      ),
      ListModel(
        text: "Ernährung",
        status: false,
      ),
      ListModel(
        text: "Ergotherapie",
        status: false,
      ),
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
                           print("is Select Category before dialog: ${model.selectedCategory}");
                         CustomDialogBox.buildDialog( context,"Kategorie auswählen",_height, _width, list: list);
                           print("is Select Category after  dialog: ${model.selectedCategory}");
                          //CustomDialog( _height, _width, model,list);
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

class CustomDialog extends StatefulWidget {
  double height;
  double width;
  List<ListModel> list;
  LibraryViewModel model;

  CustomDialog(this.height, this.width, this.list, this.model);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {





  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Container(
          //  margin: EdgeInsets.only(bottom: 20),
          height: widget.height/2,
          width: widget.width,
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
                    width: widget.width,
                    color: Colors.grey[100],
                  ),
                  Container(
                    height: widget.height/3,
                    child: ListView.builder(
                        itemCount: widget.list.length,
                        itemBuilder: (_,index){
                          return InkWell(
                            onTap: (){
//                                    model.setIsSelected(!list[index].status);
                             widget.model.setSelectedCategory(widget.list[index].text);
                                setState(() {
                                  widget.list.forEach((element) => element.status = false);
                                  widget.list[index].status = !widget.list[index].status;
                                });



                              print("Is Selected value: ${widget.model.isSelected}");
                              print("Selected category: ${widget.model.selectedCategory}");
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(widget.list[index].text),
                                    Container(
                                      width: widget.width / 20,
                                      height: widget.height / 30,
                                      decoration: BoxDecoration(
                                          color: widget.list[index].status? Styles.taiaGreen : Styles
                                              .whiteColor,
                                          border: Border.all(color: !widget.list[index].status ? Colors
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
                      width: widget.width,
                      color: Colors.grey[100],
                    ),
                    SizedBox(
                      width: widget.width,
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
  }
}



