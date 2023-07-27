import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/widgets/modals/modal_forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController()
    ..text = "";
  final TextEditingController _passwordController = TextEditingController()
    ..text = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _body(),
    );
  }

  Widget _body() {
    LoadingApp _loader = LoadingApp();
    List<Widget> _aForm() {
      return [
        aFormLabel("Email"),
        aFormInput("Enter your email address", _emailController),
        aFormLabel("Password"),
        aFormInput("Enter your password", _passwordController),
        aFormButton("Sign in", () {
          Navigator.of(context).pushNamed('/Home');
        }),
        aFormForgotPassword("Forgot password", () {
          forgotPasswordModal(context: context);
        }),
        ...buttonSocial(() {}, _loader)
      ];
    }

    List<Widget> _aBody() => [aForm(_formKey, _aForm())];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      child: Column(children: _aBody()),
    );
  }
}
