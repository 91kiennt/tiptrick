import 'package:flutter/material.dart';

extension TBExtension on BuildContext {
  void tb(String thongbao, {int thoigian = 1000}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Text(thongbao), duration: Duration(milliseconds: thoigian)));
  }

  void hide() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void tbKetNoi() =>
      tb('Kết nối internet không ổn định. Xin hãy kiểm tra và thử lại sau.');

  void tbDangNhap() => tb('Bạn chưa đăng nhập.');

  void tbKhongThay() =>
      tb('Không tìm thấy thông tin yêu cầu. Xin hãy kiểm tra và thử lại sau');

  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}
