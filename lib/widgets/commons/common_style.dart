import 'package:flutter/material.dart';

class _CommonStyle {
  // height
  int titleHeight;
  int descHeight;
  int imageHeight;
  // width
  int titleWidth;
  int descWidth;
  int imageWidth;
  // color
  Color colorTitle;
  Color colorDesc;
  // fontsize
  int sizeTitle;
  int sizeDesc;
  _CommonStyle({
    // height
    this.titleHeight = 0,
    this.descHeight = 0,
    this.imageHeight = 0,
    // width
    this.titleWidth = 0,
    this.descWidth = 0,
    this.imageWidth = 0,
    // color
    this.colorTitle = Colors.black87,
    this.colorDesc = Colors.grey,
    // fontsize
    this.sizeTitle = 0,
    this.sizeDesc = 0
  });
}
