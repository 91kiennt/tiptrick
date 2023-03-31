import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiptrick_game/app/app.dart';

class TipTrickHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = TipTrickHttpOverrides();
  final DefaultLayerModel bs = await TipTrickApp.defaultLayer();
  return runApp(TipTrickApp());
}
