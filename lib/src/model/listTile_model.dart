import 'package:flutter/material.dart';

class ListTileModel{
  IconData icon;
  String title;
  String subtitle;
  bool isLocked=false;
  String image;
  int count=0;

  ListTileModel({this.icon, this.title, this.subtitle, this.isLocked, this.image, this.count});

}