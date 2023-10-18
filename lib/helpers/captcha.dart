import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tiptrick_game/auth/states/auth_state.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> aRecaptchaVerify(BuildContext context) =>
    showDialog<void>(context: context, builder: (_) => CaptchaPage());

class CaptchaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var authState = Provider.of<AuthState>(context, listen: false);
    return SafeArea(
        child: InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse('http://localhost:1411/captcha.html')),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(transparentBackground: true),
            ),
            onWebViewCreated: (controller) {
              controller.addJavaScriptHandler(
                  handlerName: "PING",
                  callback: (List<dynamic> payload) {
                    // authState.Temp_User_ReCaptcha = payload[0];
                    Navigator.pop(context);
                  });
            }));
  }
}