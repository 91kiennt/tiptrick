import 'package:flutter/material.dart';
import 'package:tiptrick_game/global_state.dart';

class CommonTopBar extends AppBar {
  CommonTopBar.basic(BuildContext context, String title,
      {Key key,
      List<Widget> actions = const [],
      bool isCenter = true,
      VoidCallback onBack})
      : super(
            key: key,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            centerTitle: isCenter,
            leading: onBack == null
                ? const BackButton()
                : BackButton(onPressed: onBack),
            actions: actions);

  CommonTopBar.custom(
    BuildContext context,
    String leading, {
    Key key,
    bool isCenter = true,
  }) : super(
            key: key,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(leading,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            leadingWidth: 150,
            actions: [
              _topBarFilterIcon(context),
              _topBarSettingIcon(context),
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _topBarNotification(context)),
            ]);
}

Widget _topBarFilterIcon(BuildContext context) {
  return IconButton(
    padding: EdgeInsets.zero,
    color: Colors.white,
    tooltip: 'Bộ lọc',
    icon: const Icon(Icons.filter_alt_sharp, size: 20),
    iconSize: 30,
    onPressed: () {},
  );
}

Widget _topBarSettingIcon(BuildContext context) {
  return IconButton(
    padding: EdgeInsets.zero,
    color: Colors.white,
    tooltip: 'Cài đặt',
    icon: const Icon(Icons.settings, size: 20),
    iconSize: 30,
    onPressed: () {
      Navigator.of(context).pushNamed('/Setting');
    },
  );
}

Widget _topBarNotification(BuildContext context) {
  return IconButton(
    padding: EdgeInsets.zero,
    color: Colors.white,
    tooltip: 'Thông báo',
    icon: const Icon(Icons.notifications_active, size: 20),
    iconSize: 30,
    onPressed: () {
      scaffoldKey.currentState.openDrawer();
    },
  );
}
