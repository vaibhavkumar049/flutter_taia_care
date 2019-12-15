import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/model/list_model.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class TreatmentPlan extends StatefulWidget {
  @override
  _TreatmentPlanState createState() => _TreatmentPlanState();
}

class _TreatmentPlanState extends State<TreatmentPlan> {
  double _width;
  double _height;
  List<ListModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list=[
      ListModel(text: "Jeden Tag9", status: false),
      ListModel(text: "An bestimmten Wochentagen", status: false),
      ListModel(text: "Jeden x Tag/Woche/Monat", status: false),
      ListModel(text: "Nach Bedarf", status: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Therapieplan"),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          children: <Widget>[
            _list(),
          ],
        )
      ),
    );
  }

  Widget _list(){
    return Expanded(
        child: ListView.builder(
          itemCount: list.length,
            itemBuilder: (_,index){
              return InkWell(
                onTap: (){
                  setState(() {
                    list[index].status = !list[index].status;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
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
                    Container(height: 2, width: _width, color: Colors.grey[300],)
                  ],
                ),
              );
            }
        )
    );
  }
}
