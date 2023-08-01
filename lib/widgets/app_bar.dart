import 'package:flutter/material.dart';

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
    BuildContext context, {
    Key key,
    bool isCenter = true,
  }) : super(
            key: key,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text('Trick Game'),
            centerTitle: isCenter,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _topBarSettingIcon(context),
              )
            ]);
}

Widget _topBarSettingIcon(BuildContext context) {
  return IconButton(
    padding: EdgeInsets.zero,
    color: Colors.white,
    icon: const Icon(Icons.settings, size: 20),
    iconSize: 30,
    onPressed: () {
      Navigator.of(context).pushNamed('/Setting');
    },
  );
}
