import 'package:tiptrick_game/auth/_auth_export.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController()
    ..text = "";
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
    _userNameController.dispose();
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
    List<Widget> _aForm() {
      return [
        aFormLabel("User name"),
        aFormInput("Enter full name", _userNameController),
        aFormLabel("Email"),
        aFormInput("Enter your email address", _emailController),
        aFormLabel("Password"),
        aFormInput("Enter your password", _passwordController),
        aFormButton("Sign up", () {})
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
