import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetContent {
  static const ImageProvider splash = AssetImage('assets/images/splash.jpeg');

  static Widget image = SvgPicture.asset('', fit: BoxFit.cover);
}
