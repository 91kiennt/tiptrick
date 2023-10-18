import 'dart:convert';

import 'package:http/http.dart';
import 'package:tiptrick_game/auth/_auth_export.dart';
import 'package:tiptrick_game/auth/models/api_result_model.dart';

int timeOutApi = 5000;

class AppState extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) => _loading = value;

  String _message = '';
  String get message => _message;
  set message(String value) => _message = value;

  bool _status = false;
  bool get status => _status;
  set status(bool value) => _status = value;

  Future<void> gfetch(
      String url, Map<String, dynamic> headers, String body, dynamic callBack,
      {bool isGet = false, bool isDynamic = false}) async {
    var response = isGet
        ? await get(Uri.parse(url), headers: headers)
            .timeout(new Duration(milliseconds: timeOutApi))
        : await post(Uri.parse(url), headers: headers, body: body)
            .timeout(new Duration(milliseconds: timeOutApi));
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        ApiResultModel result;
        result = ApiResultModel.fromGJson(data);
        try {
          if (result.statusMessage) {
            try {
              callBack(result.data);
            } catch (e) {
              _message = result.message;
              throw Exception('API $url Callback Error: ${e.toString()}');
            }
          }
        } catch (e) {
          _message = result.message;
          throw Exception('API $url Result False: ${result.message}');
        }
      } else {
        _message = 'Yêu cầu không hợp lệ';
        throw Exception('API $url Response Fail: ${response.statusCode}');
      }
    } catch (e) {
      _message = 'Có lỗi xảy ra';
      throw Exception(e);
    }
  }
}
