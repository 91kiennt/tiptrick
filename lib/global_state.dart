import 'package:flutter/material.dart';
import 'package:tiptrick_game/auth/models/config_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class GlobalState {
  GlobalState._();

  static String captchaHtml = "";
  static bool hasConnectivity = false;
  static String loaiConnectivity = '';

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final ConfigModel _config = ConfigModel();

  static ConfigModel get config => _config;

  static String _tokenFcm = '';
  static String get tokenFcm => _tokenFcm;
  static void setToken(String token) {
    _tokenFcm = token;
  }
}
