import 'package:provider/provider.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/modules/lichsu/states/lichsu_state.dart';

class AppInitialize {
  AppInitialize._();
  static final AppInitialize _instance = AppInitialize._();
  static AppInitialize get instance => _instance;

  void initialize(BuildContext context) {
    final historyState = Provider.of<LichSuState>(context, listen: false);
    try {
      try {
        historyState.init();
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
