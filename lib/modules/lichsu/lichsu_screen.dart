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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        MultiSliver(children: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return _itemHistory(index);
              },
              childCount: _listIndex.length,
            ),
          )
        ])
      ],
    );
  }

  Widget _itemHistory(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          // icon
          Expanded(child: Text('$index')),
          CommonListTile(
            title: const Text('Text'),
            subtitle: const Text('Text'),
            onTap: () {},
          )
          // ListTile(
          //   contentPadding: const EdgeInsets.all(0.0),
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // Title
          //       const Text('Lịch sử thao tác'),
          //       // Thoi gian, Action
          //       Row(children: [
          //         // Action
          //         Expanded(
          //             child: Row(
          //           children: [
          //             IconButton(
          //                 onPressed: () {},
          //                 icon: const Icon(Icons.refresh),
          //                 iconSize: 20),
          //             const Icon(Icons.warning, color: Colors.red, size: 20),
          //           ],
          //         )),
          //         // Thoi gian
          //         const Text('16:20')
          //       ])
          //     ],
          //   ),
          //   subtitle: const Text('Mô tả ngắn'),
          // )
        ],
      ),
    );
  }
}
