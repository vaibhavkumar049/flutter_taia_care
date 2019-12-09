import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class MedicineDetails extends StatefulWidget {
  @override
  _MedicineDetailsState createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  String title;
  double _width;
  double _height;
  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context).settings.arguments;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: title),
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
        _buildCardItem(title: "Wirkstoff", subTitle: title, isIcon: false),
        Container(height: 4, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Darreichungsform", subTitle: title, isIcon: true),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Dosiereinheit", subTitle: title, isIcon: true),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Menge", subTitle: title, isIcon: false),
        Container(height: 4, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Therapieplan", subTitle: title, isIcon: true),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Einnahmezeit", subTitle: title, isIcon: true),
        Container(height: 1, width: _width, color: Colors.grey[300],),
        _buildCardItem(title: "Dauer", subTitle: title, isIcon: true),
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
      child: Column(
        children: <Widget>[
          CustomButton(
            onTap: (){
              //Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
            },
            text: "SPEICHERN",
            isDelete: false,
          ),
          SizedBox(height: 10,),
          CustomButton(
            onTap: (){
              //Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
            },
            text: "LÖSCHEN",
            icon: Icons.delete,
            isDelete: true,
          ),
        ],
      ),
    );
  }
}

