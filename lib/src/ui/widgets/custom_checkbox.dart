import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  bool checkValue = false;
  bool isRichText = false;
  bool isThirdPage = false;
  String text;
  String thirdPageText;

  CustomCheckBox(
      {this.checkValue,
      this.isRichText,
      this.text,
      this.isThirdPage,
      this.thirdPageText});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.isThirdPage != null && widget.isThirdPage
                ? Text(
                    widget.thirdPageText != null ? widget.thirdPageText : null, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
                : SizedBox(),
            widget.isThirdPage != null && widget.isThirdPage
                ? Container(
                    height: 1,
                    width: _width,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                  )
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: widget.isRichText
                        ? Text.rich(
                            TextSpan(
                              text: "Ich akzeptiere die\n",
                              style: TextStyle(fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Datenschutzerklärung\t",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(
                                  text: "und\n",
                                ),
                                TextSpan(
                                  text: "Nutzungsbedingungen.",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            widget.text,
                            style: TextStyle(fontSize: 18),
                          )),
                Checkbox(
                  value: widget.checkValue,
                  onChanged: (value) {
                    setState(() {
                      widget.checkValue = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
