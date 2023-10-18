import 'dart:convert';
import 'package:tiptrick_game/auth/states/app_state.dart';


class LichSuState extends AppState {
  void init() {
    _fetch();
  }

  Future<void> _fetch() async {
    Map data = {'PageSize': 20, 'PageIndex': 1};

    Map<String, dynamic> headers = {};

    await gfetch('', headers, json.encode(data), (data) {
      try {
        loading = true;
        loading = false;
      } catch (e) {
        throw Exception(e);
      }
    });
  }

  Future<void> onRefresh() async {}
}
