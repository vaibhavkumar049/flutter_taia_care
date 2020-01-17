import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Flexible(
        child: Card(
          color: Styles.chatBubbleGrey,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(text,),
            )
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Image.asset(
                  'assets/out.png',
                  fit: BoxFit.scaleDown,
                  width: 30.0,
                  height: 30.0,
                  color: Styles.taiaGreen,
                ),
                Card(
                  margin: EdgeInsets.only(top: 0, right: 6),
                    color: Styles.taiaGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(text, style: TextStyle(color: Colors.white),),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: this.type ? userMessage(context) : botMessage(context),
    );
  }
}