import 'package:flutter/material.dart';

class LichSuScreen extends StatefulWidget {
  const LichSuScreen({ Key key }) : super(key: key);

  @override
  State<LichSuScreen> createState() => _LichSuScreenState();
}

class _LichSuScreenState extends State<LichSuScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Lịch sử'));
  }
}
