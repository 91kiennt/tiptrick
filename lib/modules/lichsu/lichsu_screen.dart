import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tiptrick_game/helpers/extension.dart';
import 'package:tiptrick_game/modules/lichsu/states/lichsu_state.dart';
import 'package:tiptrick_game/widgets/commons/common_list_tile.dart';
import 'package:tiptrick_game/modules/lichsu/models/lichsu_model.dart';

class LichSuScreen extends StatefulWidget {
  const LichSuScreen({Key key}) : super(key: key);

  @override
  State<LichSuScreen> createState() => _LichSuScreenState();
}

class _LichSuScreenState extends State<LichSuScreen> {
  LichSuState _vm = new LichSuState();

  @override
  void initState() {
    super.initState();
    _vm.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LichSuState>(
        create: (_) => _vm,
        child: Consumer(builder: (_, LichSuState state, __) {
          return _vm.loading
              ? const Center(child: CircularProgressIndicator())
              : _body(state);
        }));
  }

  Widget _body(LichSuState state) {
    return RefreshIndicator(
      onRefresh: () async => await state.refresh(),
      backgroundColor: Colors.white,
      color: Colors.blue,
      child: Container(
        height: context.h,
        alignment: Alignment.center,
        child: state.children.isNotEmpty && state.children != null
            ? GroupedListView<LichSuModel, int>(
                elements: state.children,
                groupBy: (element) {
                  String date = element.createDate.split(' ')[0];
                  DateTime dt1 = DateFormat('dd/MM/yyyy').parseStrict(date);
                  return dt1.millisecondsSinceEpoch;
                },
                groupComparator: (val1, val2) => val2.compareTo(val1),
                itemComparator: (LichSuModel el1, LichSuModel el2) {
                  String date1 = el1.createDate.split(' ')[0];
                  String date2 = el2.createDate.split(' ')[0];

                  DateTime dt1 = DateFormat('dd/MM/yyyy').parseStrict(date1);
                  DateTime dt2 = DateFormat('dd/MM/yyyy').parseStrict(date2);

                  return dt1.millisecondsSinceEpoch
                      .compareTo(dt2.millisecondsSinceEpoch);
                },
                floatingHeader: true,
                groupSeparatorBuilder: (int val) {
                  DateTime date = DateTime.fromMillisecondsSinceEpoch(val);
                  String _date = new DateFormat("dd/MM/yyyy").format(date);
                  int _idx = state.children
                      .indexWhere((e) => e.createDate.contains(_date));
                  return _idx == 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(_date), _filter()],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.5))),
                          child: Text(_date));
                },
                itemExtent: 200,
                indexedItemBuilder: (context, _, index) {
                  return _item(index);
                },
              )
            : Text('Chưa có sẵn dữ liệu!'),
      ),
    );
  }

  Widget _item(int index) {
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

  Widget _filter() {
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

  IconData _icon(int dpType) {
    switch (dpType) {
      case 1:
        return Icons.person;
      default:
        return Icons.abc;
    }
  }
}
