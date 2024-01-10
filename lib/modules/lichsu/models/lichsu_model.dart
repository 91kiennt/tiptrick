import 'package:tiptrick_game/base/model.dart';
import 'package:tiptrick_game/base/abstract_model.dart';

class LichSuModel extends ModelAbstract {
  int amountInvoice;
  LichSuModel({
    String contentId = '',
    String title = '',
    String description = '',
    String iconId = '',
    String createDate = '',
    int displayType = 0,
    this.amountInvoice = 0,
  }) : super(
          contentId: contentId,
          title: title,
          description: description,
          iconId: iconId,
          createDate: createDate,
          displayType: displayType,
        );

  @override
  Map<String, dynamic> toMap() => {
        'contentId': contentId,
        'title': title,
        'description': description,
        'iconId': iconId,
        'createDate': createDate,
        'displayType': displayType,
      };

  factory LichSuModel.fromJson(Map<String, dynamic> json) {
    try {
      assert(json != null);
      return LichSuModel(
        contentId: json['contentId'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        iconId: json['iconId'] ?? '',
        createDate: json['createDate'] ?? '',
        displayType: json['displayType'] ?? 0,
        amountInvoice: json['amountInvoice'] ?? 0,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

class ListLichSuModel {
  List<LichSuModel> data;
  ListLichSuModel({this.data = const []});

  factory ListLichSuModel.fromJson(Map<String, dynamic> json) {
    try {
      assert(json != null);
      return ListLichSuModel(
          data: Model.generator(
              json['data'] ?? [],
              (dynamic results) =>
                  LichSuModel.fromJson(results.cast<String, dynamic>())));
    } catch (e) {
      throw Exception(e);
    }
  }
}
