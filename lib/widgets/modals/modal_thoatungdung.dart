import 'package:flutter/material.dart';

Future<bool> thoatUngDungModal({@required BuildContext context}) =>
    showDialog<bool>(
        context: context, builder: (_) => const _ThoatUngDungModalDialog());

class _ThoatUngDungModalDialog extends StatelessWidget {
  const _ThoatUngDungModalDialog();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
