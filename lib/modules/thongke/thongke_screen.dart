import 'package:flutter/material.dart';

class ThongKeScreen extends StatefulWidget {
  const ThongKeScreen({ Key key }) : super(key: key);

  @override
  State<ThongKeScreen> createState() => _ThongKeScreenState();
}

class _ThongKeScreenState extends State<ThongKeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Thống kê'));
  }
}
