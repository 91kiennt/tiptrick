import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:tiptrick_game/app/_app_connectivity.dart';
import 'package:tiptrick_game/auth/views/login_screen.dart';
import 'package:tiptrick_game/auth/widgets/auth_loading.dart';
import 'package:tiptrick_game/auth/widgets/group_button_login.dart';
import 'package:tiptrick_game/base/device_info_model.dart';
import 'package:tiptrick_game/global_state.dart';
import 'package:tiptrick_game/helpers/assets.dart';

class SplashState {
  Future<void> getDeviceInfo() async {
    Future<String> _getIps() async {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type.name.contains('IPv4')) {
            return addr.address;
          }
        }
      }
      NetworkInfo networkInfo = NetworkInfo();
      return networkInfo.getWifiIP();
    }

    String deviceIp = await _getIps();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var _deviceInfo = DeviceInfoModel();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _deviceInfo.clientIp = deviceIp;
      _deviceInfo.clientId = androidInfo.androidId;
      _deviceInfo.deviceInfo = androidInfo.model;
      _deviceInfo.fcmToken = "";
      _deviceInfo.versionNumber = androidInfo.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _deviceInfo.clientIp = deviceIp;
      _deviceInfo.clientId = iosInfo.identifierForVendor;
      _deviceInfo.deviceInfo = iosInfo.model;
      _deviceInfo.fcmToken = "";
      _deviceInfo.versionNumber = iosInfo.systemVersion;
    }
  }

  Future<void> startServer() async {
    try {
      var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 1411);
      await for (HttpRequest request in server) {
        String responseContent = '';
        if (request.uri.path.contains('captcha.html')) {
          responseContent = GlobalState.config.decrypt(GlobalState.captchaHtml);
          request.response
            ..headers.contentType =
                ContentType('text', 'html', charset: 'utf-8')
            ..write(responseContent)
            ..close();
        }
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> initState() async {
    // startServer();
    await getDeviceInfo();
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WrapperPage(
      children: <Widget>[
        const Opacity(
          opacity: .8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetContent.splash, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned.fill(
          top: 0,
          bottom: 24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('TIP TRICK GAME',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('@2023',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red))
            ],
          ),
        ),
        const _InViewSplashPage(),
      ],
    );
  }
}

class _InViewSplashPage extends StatefulWidget {
  const _InViewSplashPage({Key key}) : super(key: key);

  @override
  _InViewSplashPageState createState() => _InViewSplashPageState();
}

class _InViewSplashPageState extends State<_InViewSplashPage> {
  final SplashState _spState = SplashState();
  bool hasConnection = false;
  StreamSubscription<bool> connectionChangeStream;

  @override
  void initState() {
    super.initState();
    hasConnection = GlobalState.hasConnectivity;
    AppConnectivity connect = AppConnectivity.getInstance();
    connectionChangeStream = connect.connectionChange.listen((event) {
      setState(() {
        hasConnection = event;
      });
    });

    _spState.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthLoading _loader = AuthLoading();
    return Positioned.fill(
      top: 20,
      left: 0,
      right: 0,
      bottom: 0,
      child: Builder(
        builder: (BuildContext _) {
          const LoginScreen();
          groupButtonLogin(() {}, _loader);
          if (!hasConnection) _NotConnectivity();
          return const SizedBox();
        },
      ),
    );
  }
}

class _WrapperPage extends StatelessWidget {
  final List<Widget> children;
  const _WrapperPage({Key key, @required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: children),
    );
  }
}

class _NotConnectivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Kết nối không ổn định",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF0D47A1), width: 1)),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Kết nối lại'),
                ),
              ],
            ),
          ),
        ]);
  }
}
