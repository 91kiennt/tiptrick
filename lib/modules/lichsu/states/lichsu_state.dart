import 'dart:convert';
import 'package:tiptrick_game/auth/states/app_state.dart';
import 'package:tiptrick_game/modules/lichsu/models/lichsu_model.dart';

class LichSuState extends AppState {
  List<LichSuModel> _children = [];
  List<LichSuModel> get children => _children;

  void init() async {
    await _fetch();
  }

  Future<void> _fetch() async {
    Map data = {'PageSize': 20, 'PageIndex': 1};
    Map<String, dynamic> headers = {};
    loading = true;
    await gfetch('', headers, json.encode(data), (data) {
      try {
        var tempt = ListLichSuModel.fromJson(data);
        _children.addAll(tempt.data);
      } catch (e) {
        throw Exception(e);
      }
    });
    loading = false;
    notifyListeners();
  }

  Future<void> refresh() async {}
}
