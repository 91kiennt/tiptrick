import 'dart:async';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tiptrick_game/app/router.dart';
import 'package:tiptrick_game/app/splash_page.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/global_state.dart';
import 'package:tiptrick_game/widgets/modals/modal_thoatungdung.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tiptrick_game/app/_app_connectivity.dart';

class DefaultLayerModel {
  const DefaultLayerModel();
}

class TipTrickApp extends StatefulWidget {
  TipTrickApp({Key key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static Future<DefaultLayerModel> defaultLayer() async {
    GlobalState.loaiConnectivity =
        AppConnectivity.loaiKetNoi(await Connectivity().checkConnectivity());
    GlobalState.hasConnectivity =
        await AppConnectivity.getInstance().checkConnection();
    return const DefaultLayerModel();
  }

  @override
  _TipTrickAppState createState() => _TipTrickAppState();
}

class _TipTrickAppState extends State<TipTrickApp> with WidgetsBindingObserver {
  StreamSubscription<ConnectivityResult> _conectivitySubscription;

  @override
  void initState() {
    super.initState();
    _conectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult event) async {
      GlobalState.loaiConnectivity = AppConnectivity.loaiKetNoi(event);
      GlobalState.hasConnectivity =
          await AppConnectivity.getInstance().checkConnection();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        _conectivitySubscription.cancel();
        break;
      case AppLifecycleState.resumed:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: snackbarKey,
          title: 'Tip Trick Game',
          // theme: Provider.of<ThemeNotifier>(context).AppTheme,
          home: WillPopScope(
            onWillPop: () async => await thoatUngDungModal(context: context),
            child: const SplashPage(),
          ),
          routes: Routes.initRoute(),
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
          navigatorObservers: [GlobalState.routeObserver],
        );
      }),
    );
  }
}
