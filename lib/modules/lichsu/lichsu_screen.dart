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
    return RefreshIndicator(
      onRefresh: () {},
      backgroundColor: Colors.white,
      color: Colors.blue,
      child: CustomScrollView(
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
          const Icon(Icons.show_chart_rounded, size: 20),
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
}
