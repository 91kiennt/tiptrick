import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';

class SpinKitLoaderView extends StatelessWidget {
  final double size;

  const SpinKitLoaderView({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPouringHourGlassRefined(
          size: size ?? 32.0, color: Colors.orange),
    );
  }
}

class LoadingApp {
  static LoadingApp _customLoader;
  LoadingApp._createObject();
  factory LoadingApp() {
    _customLoader ??= LoadingApp._createObject();
    return _customLoader;
  }

  OverlayState _overlayState;
  OverlayEntry _overlayEntry;

  void show(context) {
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return _build(context);
      },
    );
    _overlayState.insert(_overlayEntry);
  }

  void hide() {
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x88888888),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const SpinKitLoaderView(key: Key('loading'), size: 32.0)
        ),
      ),
    );
  }
}
