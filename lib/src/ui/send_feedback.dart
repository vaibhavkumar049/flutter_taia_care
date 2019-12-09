import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_alertdialog.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';

class SendFeedBack extends StatefulWidget {
  @override
  _SendFeedBackState createState() => _SendFeedBackState();
}

class _SendFeedBackState extends State<SendFeedBack> {
  double _width;
  double _height;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Schreib uns"),
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Hast du Feedback, Fragen oder Anregungen? Teile sie uns mit", style: TextStyle(fontSize: _width/20),textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(color: Styles.boxesNarrowsGrey)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    hintText: "Deine Nachricht"
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            CustomButton(text: "Abschicken",
              onTap: () {
                if (_controller.text != null && _controller.text.length > 0) {
                  _controller.clear();
                  Navigator.of(context).pop();
                } else {
                  CustomDialogBox.showAlertDialog(context, "Alert!", "Bitte gebe eine Nachricht ein", width: _width);
                }
              },
              isDelete: false,)
          ],
        ),
      ),
    );
  }
}
