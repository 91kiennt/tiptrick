import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiptrick_game/global_state.dart';
// import 'package:tiptrick_game/env/env_state.dart';
import 'package:tiptrick_game/helpers/assets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:tiptrick_game/app/_app_connectivity.dart';
import 'package:tiptrick_game/base/device_info_model.dart';
import 'package:tiptrick_game/auth/views/login_screen.dart';
import 'package:tiptrick_game/auth/views/register_screen.dart';

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
      _deviceInfo.clientId = androidInfo.id;
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
    await startServer();
    await getDeviceInfo();
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashState _spState = SplashState();
  bool hasConnection = false;
  StreamSubscription<bool> connectionChangeStream;
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true, initialPage: currentPage);
  }

  Future<String> _initialize() async {
    _spState.initState();
    hasConnection = GlobalState.hasConnectivity;
    AppConnectivity connect = AppConnectivity.getInstance();
    // EnvState.instance.initEnvForRemote().then((_) {
    //   EnvState.instance.setEnvForApp();
    // });
    connectionChangeStream = connect.connectionChange.listen((event) {
      setState(() {
        hasConnection = event;
      });
    });
    return '';
  }

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
          bottom: 32,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator()),
              const SizedBox(height: 16),
              const Text('TIP TRICK GAME',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Text('@2023',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red))
            ],
          ),
        ),
        _inViewSplashPage(),
      ],
    );
  }

  Widget _inViewSplashPage() {
    return FutureBuilder<String>(
        future: _initialize(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Positioned.fill(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: Builder(
                builder: (BuildContext _) {
                  if (!hasConnection) _NotConnectivity();
                  return _buildPageView();
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      allowImplicitScrolling: true,
      onPageChanged: (int idPage) {
        setState(() => currentPage = idPage);
      },
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        LoginScreen(),
        RegisterScreen(),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: const Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.0, 0.0),
                  )
                : const BoxShadow(color: Colors.transparent)
          ],
          shape: BoxShape.circle,
          color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 2; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
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
