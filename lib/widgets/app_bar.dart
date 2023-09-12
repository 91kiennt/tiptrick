import 'package:flutter/material.dart';
import 'package:tiptrick_game/global_state.dart';
import 'package:tiptrick_game/helpers/extension.dart';

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

  CommonTopBar.history(BuildContext context, String leading,
      {Key key, bool isCenter = true})
      : super(
            key: key,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(leading,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            leadingWidth: 150,
            actions: [const SearchBar()]);
}

Widget _topBarFilterIcon(BuildContext context) {
  return IconButton(
    padding: const EdgeInsets.all(0.0),
    color: Colors.white,
    tooltip: 'Bộ lọc',
    icon: const Icon(Icons.filter_alt_sharp, size: 20),
    iconSize: 30,
    onPressed: () {},
  );
}

Widget _topBarSettingIcon(BuildContext context) {
  return IconButton(
    padding: const EdgeInsets.all(0.0),
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
    padding: const EdgeInsets.all(0.0),
    color: Colors.white,
    tooltip: 'Thông báo',
    icon: const Icon(Icons.notifications_active, size: 20),
    iconSize: 30,
    onPressed: () {
      scaffoldKey.currentState.openDrawer();
    },
  );
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActiveSearch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          !_isActiveSearch ? _topBarFilterIcon(context) : const SizedBox(),
          !_isActiveSearch ? _topBarSettingIcon(context) : const SizedBox(),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActiveSearch
                  ? Container(
                      width: context.w / 1.5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Tìm kiếm',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() => _isActiveSearch = false);
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() => _isActiveSearch = true);
                      },
                      color: Colors.white,
                      tooltip: 'Tìm kiếm',
                      icon: const Icon(Icons.search)),
            ),
          ),
        ],
      ),
    );
  }
}
