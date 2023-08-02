import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/message.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/widgets/commons/common_modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> editNameModal({@required BuildContext context}) =>
    showDialog<bool>(context: context, builder: (_) => const _EditNameDialog());

class _EditNameDialog extends StatefulWidget {
  const _EditNameDialog();

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  final TextEditingController _nameOldController = TextEditingController()
    ..text = '';
  final TextEditingController _nameNewController = TextEditingController()
    ..text = '';
  final LoadingApp _loader = LoadingApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameOldController.dispose();
    _nameNewController.dispose();
    super.dispose();
  }

  bool get _validator {
    if (_nameOldController.text == null || _nameOldController.text.isEmpty) {
      context.tb(MessageAuth.errorLongName);
      return false;
    }
    if (_nameNewController.text == null || _nameNewController.text.isEmpty) {
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
    bool value = await authState.handleEditName({
      'oldName': _nameOldController.text,
      'newName': _nameNewController.text
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
      aFormLabel("Tên cũ", color: Colors.black87),
      aFormInput("Enter your name", _nameOldController, color: Colors.black87),
      aFormLabel("Tên mới", color: Colors.black87),
      aFormInput("Enter your name", _nameNewController, color: Colors.black87),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Thay đổi tên',
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
