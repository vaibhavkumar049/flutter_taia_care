import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  double _width;
  double _height;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Account löschen"),
      body: Container(
        height: _height,
        width: _width,  
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
