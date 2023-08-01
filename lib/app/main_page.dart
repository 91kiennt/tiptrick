import 'package:flutter/material.dart';
import 'package:tiptrick_game/widgets/drawer.dart';
import 'package:tiptrick_game/widgets/app_bar.dart';
import 'package:tiptrick_game/auth/widgets/loading_app.dart';
import 'package:tiptrick_game/modules/trangchu/trangchu_screen.dart';
import 'package:tiptrick_game/modules/taikhoan/taikhoan_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final LoadingApp _loader = LoadingApp();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TrangChuScreen(),
    Text('Index 1: Thống kê', style: optionStyle),
    Text('Index 2: Lịch sử', style: optionStyle),
    TaiKhoanScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopBar.custom(context),
      drawer: const DrawerApp(),
      body: SafeArea(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart), label: 'Statisticals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Histories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
