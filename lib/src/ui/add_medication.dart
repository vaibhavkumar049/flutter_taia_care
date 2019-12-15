import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/model/list_model.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class AddMedication extends StatefulWidget {
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  double _width;
  double _height;
  List<ListModel> _dosageList = List();
  List<ListModel> _dosingList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dosageList = [
      ListModel(
        text: "Pillen, Tabletten oder Kapseln",
        status: false,
      ),
      ListModel(
        text: "Creme, Paste oder Gel",
        status: false,
      ),
      ListModel(
        text: "Flüssigkeiten",
        status: false,
      ),
      ListModel(
        text: "Tropfen",
        status: false,
      ),
      ListModel(
        text: "Spray",
        status: false,
      ),
      ListModel(
        text: "Injektionen",
        status: false,
      ),
      ListModel(
        text: "Patch",
        status: false,
      ),
      ListModel(
        text: "Inhalator",
        status: false,
      ),
      ListModel(
        text: "Zäpfchen",
        status: false,
      ),
      ListModel(
        text: "Pulver, Granulat, Granulat",
        status: false,
      ),
    ];

    _dosingList = [
      ListModel(
        text: "g (Gramm)",
        status: false,
      ),
      ListModel(
        text: "mg (Milligramm)",
        status: false,
      ),
      ListModel(
        text: "ug (Mikrogramm)",
        status: false,
      ),
      ListModel(
        text: "ml (Milliliter)",
        status: false,
      ),
      ListModel(
        text: "Tablette",
        status: false,
      ),
      ListModel(
        text: "Ampulle",
        status: false,
      ),
      ListModel(
        text: "Kapsel",
        status: false,
      ),
      ListModel(
        text: "Tropfen",
        status: false,
      ),
      ListModel(
        text: "Inhalator",
        status: false,
      ),
      ListModel(
        text: "Spray",
        status: false,
      ),
      ListModel(
        text: "Esslöffel",
        status: false,
      ),
      ListModel(
        text: "IU (Einheit)",
        status: false,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Medikament hinzufügen"),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildBody(),
            _buildButtons()

          ],
        ),
      ),
    );
  }

  Widget _buildBody(){
    return Column(
      children: <Widget>[
        _buildCardItem(title: "Wirkstoff eintragen", subTitle: "", isIcon: false),
        Container(height: 4, width: _width, color: Colors.grey[300],),
        InkWell(onTap: (){
          CustomDialogBox.buildDialog(context, "Darreichungsform", _height, _width, list: _dosageList);
        },child: _buildCardItem(title: "Darreichungsform", subTitle: "Auswählen", isIcon: true)),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        InkWell(onTap:(){
          CustomDialogBox.buildDialog(context, "Darreichungseinheit", _height, _width, list: _dosingList);
        },child: _buildCardItem(title: "Dosiereinheit", subTitle: "Auswählen", isIcon: true)),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Menge", subTitle: "Eintragen", isIcon: false),
        Container(height: 4, width: _width, color: Colors.grey[300],),
        InkWell(onTap:(){
          Navigator.of(context).pushNamed(Constant.TREATMENTPLAN);
        },child: _buildCardItem(title: "Therapieplan", subTitle: "Auswählen", isIcon: true)),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Einnahmezeit", subTitle: "Auswählen", isIcon: true),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Dauer", subTitle: "Auswählen", isIcon: true),
        Container(height: 4, width: _width, color: Colors.grey[300],),
      ],
    );
  }

  Widget _buildCardItem({String title, String subTitle, bool isIcon}){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,style: TextStyle(color: Colors.grey),),
          Row(
            children: <Widget>[
              Text(subTitle),
              SizedBox(width: 10,),
              isIcon?Icon(Icons.arrow_forward_ios, color: Colors.grey,): SizedBox()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        onTap: (){
          //Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
        },
        text: "SPEICHERN",
        isDelete: false,
      ),
    );
  }
}
