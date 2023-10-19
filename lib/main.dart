import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiptrick_game/app/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tiptrick_game/local/firebase/firebase_interaction.dart';

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
  await FirebaseMessaging.onBackgroundMessage((message) =>
      FirebaseInteraction.firebaseMessagingBackgroundHandler(message));
  HttpOverrides.global = TipTrickHttpOverrides();
  await TipTrickApp.defaultLayer();
  return runApp(TipTrickApp());
}
