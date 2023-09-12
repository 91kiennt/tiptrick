import 'package:flutter/material.dart';
import 'package:tiptrick_game/app/main_page.dart';
import 'package:tiptrick_game/app/splash_page.dart';
import 'package:tiptrick_game/widgets/app_bar.dart';
import 'package:tiptrick_game/modules/caidat/caidat_screen.dart';
import 'package:tiptrick_game/widgets/camera/camera_screen.dart';

class Routes {
  static dynamic initRoute() {
    return {
      'SplashPage': (BuildContext context) => const SplashPage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    String _ = '';
    if (!(pathElements[0] != '' || pathElements.length == 1)) {
      _ = pathElements[1];
    }
    switch (_) {
      case 'Home':
        return FadeOutRoute<bool>(
            builder: (BuildContext context) => const MainPage());
        break;
      case 'Setting':
        return FadeOutRoute<bool>(
            builder: (BuildContext context) => const CaiDatScreen());
        break;
      case 'Camera':
        return FadeOutRoute<bool>(
            builder: (BuildContext context) => const CameraScreen());
        break;
      default:
        return onUnknownRoute(settings);
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    String route = '';
    try {
      route = settings.name.split('/')[1];
      route += ' ';
    } catch (e) {
      route = '';
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: CommonTopBar.basic(context, 'Thông báo'),
        body: Center(child: Text('Trang ${route}không tồn tại')),
      ),
    );
  }
}

class FadeOutRoute<T> extends MaterialPageRoute<T> {
  FadeOutRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == 'SplashPage') {
      return child;
    }
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      child: child,
    );
  }
}

class SlideLeftRoute<T> extends MaterialPageRoute<T> {
  SlideLeftRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == 'SplashPage') {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }
}
