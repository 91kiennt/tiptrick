import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/helpers/message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
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

  bool get _isValidate {
    if (_userNameController.text == null || _userNameController.text.isEmpty) {
      context.tb(MessageAuth.errorLongName);
      return false;
    }
    if (_emailController.text == null || _emailController.text.isEmpty) {
      context.tb(MessageAuth.errorEmptyEmail);
      return false;
    }
    var isValidEmail = AValidator.validateEmail(_emailController.text);
    if (!isValidEmail) {
      context.tb(MessageAuth.errorInvalidEmail);
      return false;
    }
    if (_passwordController.text == null || _passwordController.text.isEmpty) {
      context.tb(MessageAuth.errorEmptyPassword);
      return false;
    }
    if (_passwordController.text.length < 8) {
      context.tb(MessageAuth.errorNotmatchPassword);
      return false;
    }
    return true;
  }

  Widget _body() {
    LoadingApp _loader = LoadingApp();
    List<Widget> _aForm() {
      return [
        aFormLabel("User name"),
        aFormInput("Enter full name", _userNameController, isRadius: true),
        aFormLabel("Email"),
        aFormInput("Enter your email address", _emailController,
            isEmail: true, isRadius: true),
        aFormLabel("Password"),
        aFormInput("Enter your password", _passwordController,
            isPassword: true, isRadius: true),
        aFormButton("Sign up", () {
          if (_isValidate) {
            Navigator.of(context).pushNamed('/Home');
          }
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
