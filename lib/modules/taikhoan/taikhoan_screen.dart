import 'package:flutter/material.dart';
import 'package:tiptrick_game/widgets/commons/common_button.dart';
import 'package:tiptrick_game/widgets/modals/modal_edit_image.dart';
import 'package:tiptrick_game/widgets/modals/modal_edit_name.dart';
import 'package:tiptrick_game/widgets/modals/modal_edit_phone.dart';
import 'package:tiptrick_game/widgets/modals/modal_edit_email.dart';
import 'package:tiptrick_game/widgets/commons/common_list_tile.dart';
import 'package:tiptrick_game/widgets/backgrounds/background_section.dart';

// edit anh, login or logout account
class TaiKhoanScreen extends StatefulWidget {
  const TaiKhoanScreen({Key key}) : super(key: key);

  @override
  State<TaiKhoanScreen> createState() => _TaiKhoanScreenState();
}

class _TaiKhoanScreenState extends State<TaiKhoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(flex: 1, child: _topPortion()),
            const SizedBox(height: 16),
            Expanded(flex: 2, child: _body()),
            const SizedBox(height: 16)
          ],
        ));
  }

  Widget _topPortion() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () {
                uploadImageModal(context: context);
              },
              child: const Icon(Icons.picture_in_picture,
                  size: 24, color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            SingleSection(
              title: "Thông tin",
              children: [
                CommonListTile(
                  title: const Text("Chỉnh sửa tên"),
                  icon: Icons.edit,
                  isShowModal: true,
                  onTap: () {
                    editNameModal(context: context);
                  },
                ),
                CommonListTile(
                  title: const Text("Chỉnh sửa số điện thoại"),
                  icon: Icons.phone,
                  isShowModal: true,
                  onTap: () {
                    editPhoneModal(context: context);
                  },
                ),
                CommonListTile(
                  title: const Text("Cập nhật email"),
                  icon: Icons.email,
                  isShowModal: true,
                  onTap: () {
                    editEmailModal(context: context);
                  },
                ),
                CommonListTile(
                  title: const Text("Số lượng thông báo của bạn"),
                  icon: Icons.notifications_active,
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text('100+',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CommonButton.elevatedBtn(
                title: "Đăng xuất",
                textColor: Colors.black,
                onPressed: () {},
                radius: 4),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
