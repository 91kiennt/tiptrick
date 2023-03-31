import 'package:tiptrick_game/auth/_auth_export.dart';

List<Widget> groupButtonLogin(VoidCallback callback, AuthLoading loader) {
  return <Widget>[
    Row(
      children: const <Widget>[
        Expanded(child: Divider(height: 1, color: Colors.white)),
        SizedBox(width: 16),
        Expanded(
            child: Text("Hoặc",
                style: TextStyle(fontSize: 16, color: Colors.white))),
        SizedBox(width: 16),
        Expanded(child: Divider(height: 1, color: Colors.white)),
      ],
    ),
    const SizedBox(height: 16),
    GoogleLoginButton(callback: callback, loader: loader),
    const SizedBox(height: 16),
    FacebookLoginButton(callback: callback, loader: loader),
    const SizedBox(height: 16),
    AppleLoginButton(callback: callback, loader: loader),
  ];
}

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final AuthLoading loader;
  const GoogleLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FacebookLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final AuthLoading loader;
  const FacebookLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppleLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final AuthLoading loader;
  const AppleLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
