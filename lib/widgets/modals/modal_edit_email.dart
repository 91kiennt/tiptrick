import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/message.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/widgets/commons/modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> editEmailModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _EditEmailDialog());

class _EditEmailDialog extends StatefulWidget {
  const _EditEmailDialog();

  @override
  State<_EditEmailDialog> createState() => _EditEmailDialogState();
}

class _EditEmailDialogState extends State<_EditEmailDialog> {
  final TextEditingController _emailOldController = TextEditingController()
    ..text = '';
  final TextEditingController _emailNewController = TextEditingController()
    ..text = '';
  final LoadingApp _loader = LoadingApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailOldController.dispose();
    _emailNewController.dispose();
    super.dispose();
  }

  bool get _validator {
    if (_emailOldController.text == null || _emailOldController.text.isEmpty) {
      context.tb(MessageAuth.errorEmptyEmail);
      return false;
    }
    if (_emailNewController.text == null || _emailNewController.text.isEmpty) {
      context.tb(MessageAuth.errorEmptyEmail);
      return false;
    }
    var isValidOldEmail = AValidator.validateEmail(_emailOldController.text);
    var isValidNewEmail = AValidator.validateEmail(_emailNewController.text);
    if (!isValidOldEmail) {
      context.tb(MessageAuth.errorInvalidEmail);
      return false;
    }
    if (!isValidNewEmail) {
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
    bool value = await authState.handleEditEmail({
      'oldEmail': _emailOldController.text,
      'newEmail': _emailNewController.text
    });
    _loader.hide();
    if (value) {
      Navigator.pop(context);
    } else {
      context.tb(MessageAuth.authResetpassFail);
    }
  }

  Widget _aForm() {
    return Column(children: [
      aFormLabel("Email cũ", color: Colors.black87),
      aFormInput("Enter your email address", _emailOldController,
          color: Colors.black87, isEmail: true),
      aFormLabel("Email mới", color: Colors.black87),
      aFormInput("Enter your email address", _emailNewController,
          color: Colors.black87, isEmail: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Thay đổi email',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _aForm(),
      ),
      command: Container(
          alignment: Alignment.bottomRight,
          child: Row(
            children: BtnModalCommon.btnModalYesNo(
              'Cancle',
              () {
                Navigator.pop(context);
              },
              'Submit',
              () {
                _submit();
              },
            ),
          )),
    );
  }
}
