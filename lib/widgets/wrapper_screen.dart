import 'package:flutter/material.dart';

class WrapperScreen extends StatelessWidget {
  final Widget drawer;
  final Widget appBar;
  final Widget body;
  final Widget bottomNavigationBar;
  const WrapperScreen({
    Key key,
    this.drawer,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: drawer,
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
