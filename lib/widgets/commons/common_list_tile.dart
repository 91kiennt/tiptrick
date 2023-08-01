import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final Widget title;
  final IconData icon;
  final Widget trailing;
  final bool isShowModal;
  final VoidCallback onTap;
  const CommonListTile(
      {Key key,
      this.title,
      this.icon,
      this.trailing,
      this.isShowModal = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      title: title,
      minLeadingWidth: 0,
      leading: Icon(icon),
      trailing: trailing ??
          Icon(isShowModal ? Icons.open_in_browser : Icons.arrow_forward_ios,
              size: 20),
      onTap: onTap,
    );
  }
}
