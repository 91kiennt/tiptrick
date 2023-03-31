import 'package:tiptrick_game/auth/_auth_export.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class GlobalState {
  GlobalState._();

  static String captchaHtml = "";
  static bool hasConnectivity = false;
  static String loaiConnectivity = '';

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final ConfigModel _config = ConfigModel();

  static ConfigModel get config => _config;
}
