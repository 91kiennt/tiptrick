import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tiptrick_game/widgets/commons/common_list_tile.dart';

class LichSuScreen extends StatefulWidget {
  const LichSuScreen({Key key}) : super(key: key);

  @override
  State<LichSuScreen> createState() => _LichSuScreenState();
}

class _LichSuScreenState extends State<LichSuScreen> {
  List<int> _listIndex = [];

  @override
  void initState() {
    super.initState();
    _listIndex = List<int>.generate(20, (counter) => counter);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> refresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await refresh(),
      backgroundColor: Colors.white,
      color: Colors.blue,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          MultiSliver(pushPinnedChildren: true, children: [
            SliverPersistentHeader(
                pinned: true, delegate: HeaderLayoutHistory()),
            SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
              return _layoutHistoryOnDate(index);
            }, childCount: _listIndex.take(10).length))
          ]),
          MultiSliver(pushPinnedChildren: true, children: [
            SliverPersistentHeader(
                pinned: true, delegate: HeaderLayoutHistory()),
            SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
              return _layoutHistoryAllDate(index);
            }, childCount: _listIndex.take(10).length))
          ])
        ],
      ),
    );
  }

  Widget _layoutHistoryOnDate(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(.5))),
      child: Column(
        children: [_itemHistory(index)],
      ),
    );
  }

  Widget _layoutHistoryAllDate(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [_itemHistory(index)],
      ),
    );
  }

  Widget _itemHistory(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(_icon(0), size: 20),
          Expanded(
            child: CommonListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Lịch sử thao tác'),
                  Expanded(
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Action
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.refresh),
                                  iconSize: 20),
                              const Icon(Icons.warning,
                                  color: Colors.red, size: 20),
                            ],
                          ),
                          const SizedBox(width: 20),
                          // Thoi gian
                          const Text('16:20')
                        ]),
                  )
                ],
              ),
              subtitle: const Text('Mô tả ngắn'),
              onTap: () {},
              trailing: const SizedBox(),
            ),
          )
        ],
      ),
    );
  }

  IconData _icon(int dpType) {
    switch (dpType) {
      case 1:
        return Icons.person;
      default:
        return Icons.abc;
    }
  }

  // Widget _filterInLayout() {
  //   return PopupMenuButton(
  //     key: const Key('PopupMenuButton'),
  //     padding: const EdgeInsets.all(0),
  //     itemBuilder: (context) => [
  //       PopupMenuItem(
  //           value: 1,
  //           child: Row(children: const [
  //             Text('Tăng dần',
  //                 style: TextStyle(fontSize: 14, color: Colors.black87))
  //           ])),
  //       PopupMenuItem(
  //           value: 2,
  //           child: Row(children: const [
  //             Text('Giảm dần',
  //                 style: TextStyle(fontSize: 14, color: Colors.black87))
  //           ]))
  //     ],
  //     onSelected: (value) async {
  //       switch (value) {
  //         case 1:
  //           break;
  //         case 2:
  //           break;
  //       }
  //     },
  //     child: const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Icon(Icons.more_horiz, size: 25), //more_vert
  //     ),
  //   );
  // }
}

class HeaderLayoutHistory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          height: 60,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Ngày ${DateTime.now()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          // bo loc
          _filterInLayout(),
        ]),
      ),
    );
  }

  Widget _filterInLayout() {
    return PopupMenuButton(
      key: const Key('PopupMenuButton'),
      padding: const EdgeInsets.all(0),
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: Row(children: const [
              Text('Tăng dần',
                  style: TextStyle(fontSize: 14, color: Colors.black87))
            ])),
        PopupMenuItem(
            value: 2,
            child: Row(children: const [
              Text('Giảm dần',
                  style: TextStyle(fontSize: 14, color: Colors.black87))
            ]))
      ],
      onSelected: (value) async {
        switch (value) {
          case 1:
            break;
          case 2:
            break;
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_horiz, size: 25), //more_vert
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
