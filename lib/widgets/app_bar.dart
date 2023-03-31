import 'package:flutter/material.dart';

class CommonTopBar extends AppBar {
  CommonTopBar.simple(BuildContext context, String title,
      {Key key, List<Widget> actions = const [],
      bool isCenter = true,
      VoidCallback onBack})
      : super(key: key, 
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(title,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            centerTitle: isCenter,
            leading:
                onBack == null ? const BackButton() : BackButton(onPressed: onBack),
            actions: actions);
}
