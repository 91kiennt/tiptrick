class ApiResultModel {
  String message;
  bool statusMessage;
  Map<String, dynamic> data;

  ApiResultModel({this.message = '', this.statusMessage = false, this.data});

  factory ApiResultModel.fromRJson(Map<String, dynamic> json) {
    try {
      assert(json != null);
      return ApiResultModel(
        message: json['message'] ?? '',
        statusMessage: json['statusCode'] ?? false,
        data: json['data'] ?? {},
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
