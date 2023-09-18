import 'dart:convert';

import 'package:tiptrick_game/auth/_auth_export.dart';

class LichSuState extends AppState {
  void init() {
    _fetch();
  }

  Future<void> _fetch() async {
    Map data = {'PageSize': 20, 'PageIndex': 1};

    Map<String, dynamic> headers = {};

    await gfetch('', headers, json.encode(data), (data) {
      try {} catch (e) {
        throw Exception(e);
      }
    });
  }

  Future<void> onRefresh() async {}
}
