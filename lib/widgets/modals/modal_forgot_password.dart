import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/message.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/widgets/commons/common_modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> forgotPasswordModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _ForgotPasswordDialog());

class _ForgotPasswordDialog extends StatefulWidget {
  const _ForgotPasswordDialog();

  @override
  State<_ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<_ForgotPasswordDialog> {
  final TextEditingController _emailController = TextEditingController()
    ..text = '';
  final LoadingApp _loader = LoadingApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool get _validator {
    if (_emailController.text == null || _emailController.text.isEmpty) {
      context.tb(MessageAuth.errorEmptyEmail);
      return false;
    }
    var isValidEmail = AValidator.validateEmail(_emailController.text);
    if (!isValidEmail) {
      context.tb(MessageAuth.errorInvalidEmail);
      return false;
    }
    return true;
  }

  void _submit() async {
    if (!_validator) return;
    // await aRecaptchaVerify(context);
    var authState = Provider.of<AuthState>(context, listen: false);
    _loader.show(context);
    bool value =
        await authState.handleForgotPassword(email: _emailController.text);
    _loader.hide();
    if (value) {
      Navigator.pop(context);
    } else {
      context.tb(MessageAuth.authForgetpassFail);
    }
  }

  Widget _aForm() {
    return Column(children: [
      aFormLabel("Email", color: Colors.black87),
      aFormInput("Enter your email address", _emailController,
          color: Colors.black87),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Lấy lại mật khẩu',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _aForm(),
      ),
      command: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.bottomRight,
        child: BtnModalCommon.btnYes('Submit', () {
          _submit();
          Navigator.pop(context, true);
        }),
      ),
    );
  }
}
