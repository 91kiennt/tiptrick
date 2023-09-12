import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tiptrick_game/widgets/app_bar.dart';
import 'package:tiptrick_game/widgets/commons/common_list_tile.dart';
import 'package:tiptrick_game/widgets/modals/modal_setting_ads.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_section.dart';

class CaiDatScreen extends StatefulWidget {
  const CaiDatScreen({Key key}) : super(key: key);

  @override
  State<CaiDatScreen> createState() => _CaiDatScreenState();
}

class _CaiDatScreenState extends State<CaiDatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonTopBar.basic(context, 'Cài đặt'),
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Expanded(flex: 2, child: _body()),
              const SizedBox(height: 16)
            ],
          )),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleSection(
              title: "Thiết lập",
              children: [
                CommonListTile(
                  title: const Text("Nhận thông báo"),
                  icon: Icons.notifications_active,
                  trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                ),
                CommonListTile(
                  title: const Text("Wifi"),
                  icon: Icons.wifi,
                  trailing: CupertinoSwitch(value: false, onChanged: (val) {}),
                ),
                CommonListTile(
                  title: const Text("Chế độ màu nền"),
                  icon: Icons.format_color_fill_sharp,
                  trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleSection(
              title: "Hệ thống",
              children: [
                CommonListTile(
                  title: const Text("Số lượng quảng cáo"),
                  icon: Icons.addchart_sharp,
                  isShowModal: true,
                  onTap: () {
                    settingAdsModal(context: context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
