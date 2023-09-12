import 'package:tiptrick_game/auth/_auth_export.dart';

class AuthState extends AppState {
  Future<bool> handleForgotPassword({String email}) async {
    return true;
  }

  Future<bool> handleEditEmail(Map<String, dynamic> params) async {
    return true;
  }

  Future<bool> handleEditName(Map<String, dynamic> params) async {
    return true;
  }

  Future<bool> handleEditPhone(Map<String, dynamic> params) async {
    return true;
  }

  Future<bool> handleSettingAds(Map<String, dynamic> params) async {
    return true;
  }
}
