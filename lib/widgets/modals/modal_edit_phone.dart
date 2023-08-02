import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/message.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/widgets/commons/common_modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> editPhoneModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _EditPhoneDialog());

class _EditPhoneDialog extends StatefulWidget {
  const _EditPhoneDialog();

  @override
  State<_EditPhoneDialog> createState() => _EditPhoneDialogState();
}

class _EditPhoneDialogState extends State<_EditPhoneDialog> {
  final TextEditingController _phoneOldController = TextEditingController()
    ..text = '';
  final TextEditingController _phoneNewController = TextEditingController()
    ..text = '';
  final LoadingApp _loader = LoadingApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneOldController.dispose();
    _phoneNewController.dispose();
    super.dispose();
  }

  bool get _validator {
    if (_phoneOldController.text == null || _phoneOldController.text.isEmpty) {
      context.tb(MessageAuth.errorLongName);
      return false;
    }
    if (_phoneNewController.text == null || _phoneNewController.text.isEmpty) {
      context.tb(MessageAuth.errorLongName);
      return false;
    }
    return true;
  }

  void _submit() async {
    if (!_validator) return;
    // await aRecaptchaVerify(context);
    var authState = Provider.of<AuthState>(context, listen: false);
    _loader.show(context);
    bool value = await authState.handleEditPhone({
      'oldPhone': _phoneOldController.text,
      'newPhone': _phoneNewController.text
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
      aFormLabel("Số điện thoại cũ", color: Colors.black87),
      aFormInput("Enter your phone", _phoneOldController,
          color: Colors.black87, isNumber: true),
      aFormLabel("Số điện thoại mới", color: Colors.black87),
      aFormInput("Enter your phone", _phoneNewController,
          color: Colors.black87, isNumber: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Thay đổi số điện thoại',
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
