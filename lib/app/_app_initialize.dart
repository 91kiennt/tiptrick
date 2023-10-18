import 'package:flutter/material.dart';

class AppInitialize {
  AppInitialize._();
  static final AppInitialize _instance = AppInitialize._();
  static AppInitialize get instance => _instance;

  void initialize(BuildContext context) {
    try {
      try {} catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
