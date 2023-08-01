import 'package:flutter/material.dart';

class TrangChuScreen extends StatefulWidget {
  const TrangChuScreen({Key key}) : super(key: key);

  @override
  State<TrangChuScreen> createState() => _TrangChuScreenState();
}

class _TrangChuScreenState extends State<TrangChuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text('Trang chu'),
      ),
    );
  }
}
