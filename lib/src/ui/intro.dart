import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_button.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/intro_slider.dart' as prefix0;


class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  List<Slide> slides = new List();
  double _height;
  double _width;
  int _current=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.insert(0,
      new Slide(
        title: "Ich bin Taia",
        description: "dein persönlicher"+"\nGesundheitscoach",
        styleTitle: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),
        styleDescription: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        backgroundColor: Styles.whiteColor,
        marginTitle: EdgeInsets.only(bottom: 0, top: 80)
      ),
    );
    slides.insert(1,
      new Slide(
        title: "Lerne dich kennen",
        description: "Erfahre was dein"+"\nWohlbefinden und deine"+"\nErkrankung beeinflusst",
          styleTitle: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        backgroundColor: Styles.whiteColor,
          marginTitle: EdgeInsets.only(bottom: 0, top: 80)
      ),
    );
    slides.insert(2,
      new Slide(
        title: "Helfe dir selbst",
        description:
        "Wähle deine Hilfsmittel"+"\nund verbessere deinen"+"\nZustand Tag für Tag.",
          styleTitle: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        backgroundColor: Styles.whiteColor,
          marginTitle: EdgeInsets.only(bottom: 0, top: 80)
      ),
    );
    slides.insert(3,
      new Slide(
        title: "Privat und sicher",
        description:
        "Deine Daten gehören nur dir."+ "\nSie werden nicht an Dritte"+"\nweitergegeben.",
          styleTitle: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),
          styleDescription: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        backgroundColor: Styles.whiteColor,
          marginTitle: EdgeInsets.only(bottom: 0, top: 80)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.whiteColor,
        body: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.all(20),
         // color: Styles.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: _height/4,
                    width: _width/3,
                   // color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Image.network("https://images-na.ssl-images-amazon.com/images/I/61lPLTJ4bCL._SY741_.jpg", fit: BoxFit.contain,),
                  ),
                  introSlider(),
                ],
              ),

              //SizedBox(height: 10),
              introButtons()


            ],
          ),
        ),
      ),
    );
  }

  Widget introSlider(){
    return Container(
      height: _height/2.5,
      //margin: EdgeInsets.only(bottom: _height/8),
     color: Colors.red,
      child: prefix0.IntroSlider(
        slides: this.slides,
        colorDot: Styles.taiaGreen,
        colorActiveDot: Colors.black,
       isShowPrevBtn: false,
       isShowSkipBtn: false,
       // isScrollable: t,
          sizeDot: 13.0,
      ),
     /* child: CarouselSlider(
        height: _height/2,
        viewportFraction: 0.999,
        initialPage: _current,
        enlargeCenterPage: false,
        autoPlay: false,
        reverse: false,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: slides.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              *//*    Image.network(
                    imgUrl,
                    fit: BoxFit.contain,
                    width: _width,
                  ),*//*
                  Text(imgUrl.title),
                  Text(imgUrl.description)
                ],
              );
            },
          );
        }).toList(),
      )*/
    );
  }

  Widget introButtons(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
     /*   SizedBox(
          width: _width,
          child: RaisedButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(Constant.REGISTER);
              },
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Styles.taiaGreen,
            child: Text("Registrieren", style: TextStyle(color: Styles.whiteColor, fontSize: 20),),
          ),
        ),*/
        CustomButton(
          onTap: (){
            Navigator.of(context).pushNamed(Constant.REGISTER);
          },
          text: "Registrieren",
          isDelete: false,
        ),
        SizedBox( height: 10,),
        SizedBox(
          width: _width,
          child: RaisedButton(
              onPressed: (){
                Navigator.of(context).pushNamed(Constant.LOGIN);
              },
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(color: Styles.taiaGreen)),
            color: Colors.white,
            child: Text("Einloggen", style: TextStyle(color: Styles.taiaGreen, fontSize: 20),),
          ),
        ),
      ],
    );
  }
}
