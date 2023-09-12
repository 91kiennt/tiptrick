import 'package:flutter/material.dart';
import 'package:tiptrick_game/app/_app_initialize.dart';
import 'package:tiptrick_game/global_state.dart';
import 'package:tiptrick_game/widgets/drawer.dart';
import 'package:tiptrick_game/widgets/app_bar.dart';
import 'package:tiptrick_game/auth/widgets/loading_app.dart';
import 'package:tiptrick_game/modules/lichsu/lichsu_screen.dart';
import 'package:tiptrick_game/modules/thongke/thongke_screen.dart';
import 'package:tiptrick_game/modules/trangchu/trangchu_screen.dart';
import 'package:tiptrick_game/modules/taikhoan/taikhoan_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final LoadingApp loader = LoadingApp();
  int _selectedIndex = 0;
  String _labelForIndex = '';

  @override
  void initState() {
    super.initState();
    setState(() => _labelForIndex = 'Home');
    AppInitialize.instance.initialize(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  static const List<Widget> _screens = <Widget>[
    TrangChuScreen(),
    ThongKeScreen(),
    LichSuScreen(),
    TaiKhoanScreen(),
  ];

  Widget _appBar(BuildContext context, String label) {
    switch (label) {
      case 'Home':
      case 'Profile':
      case 'Statisticals':
        return CommonTopBar.custom(context, _labelForIndex);
      case 'Histories':
        return CommonTopBar.history(context, _labelForIndex);
      default:
        return const SizedBox();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _labelForIndex = 'Home';
          break;
        case 1:
          _labelForIndex = 'Statisticals';
          break;
        case 2:
          _labelForIndex = 'Histories';
          break;
        case 3:
          _labelForIndex = 'Profile';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context, _labelForIndex),
      drawer: const DrawerApp(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: SafeArea(
          child: Center(child: _screens.elementAt(_selectedIndex)),
        ),
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
