import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/helpers/message.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/widgets/commons/common_modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> settingAdsModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _SettingAdsDialog());

class _SettingAdsDialog extends StatefulWidget {
  const _SettingAdsDialog();

  @override
  State<_SettingAdsDialog> createState() => _SettingAdsDialogState();
}

class _SettingAdsDialogState extends State<_SettingAdsDialog> {
  final TextEditingController _countAdsController = TextEditingController()
    ..text = '';
  final LoadingApp _loader = LoadingApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _countAdsController.dispose();
    super.dispose();
  }

  bool get _validator {
    if (_countAdsController.text == null || _countAdsController.text.isEmpty) {
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
    bool value =
        await authState.handleSettingAds({'count': _countAdsController.text});
    _loader.hide();
    if (value) {
      if (context.mounted) Navigator.pop(context);
    } else {
      if (context.mounted) context.tb(MessageAuth.authResetpassFail);
    }
  }

  Widget _aForm() {
    return Column(children: [
      aFormLabel("Số lượng quảng cáo", color: Colors.black87),
      aFormInput("Enter your count ads", _countAdsController,
          color: Colors.black87, isNumber: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Thay đổi số lượng quảng cáo',
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
