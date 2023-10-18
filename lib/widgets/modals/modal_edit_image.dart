import 'package:flutter/material.dart';
import 'package:tiptrick_game/auth/widgets/widget_auth.dart';
import 'package:tiptrick_game/widgets/commons/common_modal_button.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_modal.dart';

Future<bool> uploadImageModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _UploadImageDialog());

class _UploadImageDialog extends StatefulWidget {
  const _UploadImageDialog();

  @override
  State<_UploadImageDialog> createState() => _UploadImageDialogState();
}

class _UploadImageDialogState extends State<_UploadImageDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _aForm() {
    return Column(children: [
      aFormLabel("Ảnh đại diện", color: Colors.black87),
      aFormUpload('Chọn file ảnh', () {}),
      ..._buttonCamera()
    ]);
  }

  List<Widget> _buttonCamera() {
    return <Widget>[
      const SizedBox(height: 16),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Expanded(child: Divider(height: 1, color: Colors.black87)),
          SizedBox(width: 16),
          Expanded(
              child: Text('Hoặc',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center)),
          SizedBox(width: 16),
          Expanded(child: Divider(height: 1, color: Colors.black87))
        ],
      ),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/Camera');
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black87)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.camera_alt_outlined, color: Colors.black87),
                    SizedBox(width: 12),
                    Text('Mở camera',
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center),
                  ],
                )),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Hình ảnh được lấy từ camera',
                  style: TextStyle(color: Colors.black87)),
              InkWell(
                  onTap: () {},
                  child:
                      const Icon(Icons.close, size: 20, color: Colors.black87))
            ],
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundModal(
      title: 'Thay đổi hình đại diện',
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
              'Continue',
              () {},
            ),
          )),
    );
  }
}
