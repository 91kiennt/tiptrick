import 'package:flutter/material.dart';
import 'package:tiptrick_game/widgets/app_bar.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopBar.basic(context, 'Thông báo'),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
