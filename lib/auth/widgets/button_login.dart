import 'package:tiptrick_game/auth/_auth_export.dart';

List<Widget> buttonSocial(VoidCallback callback, LoadingApp loader) {
  return <Widget>[
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Expanded(child: Divider(height: 1, color: Colors.white)),
        SizedBox(width: 16),
        Expanded(
            child: Text("Hoặc",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center)),
        SizedBox(width: 16),
        Expanded(child: Divider(height: 1, color: Colors.white))
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
  final LoadingApp loader;
  const GoogleLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('assets/images/google_logo.png', height: 24, width: 24),
            const SizedBox(width: 12),
            const Expanded(
              child: Text('Đăng nhập nhanh với Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
            ),
          ],
        ));
  }
}

class FacebookLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final LoadingApp loader;
  const FacebookLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('assets/images/facebook_logo.png',
                height: 24, width: 24),
            const SizedBox(width: 12),
            const Expanded(
                child: Text('Đăng nhập nhanh với Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center)),
          ],
        ));
  }
}

class AppleLoginButton extends StatelessWidget {
  final VoidCallback callback;
  final LoadingApp loader;
  const AppleLoginButton({Key key, this.callback, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
