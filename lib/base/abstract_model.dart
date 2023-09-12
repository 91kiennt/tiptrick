import 'package:tiptrick_game/env/model.dart';

abstract class ModelAbstract extends Model {
  String contentId;
  String title;
  String description;
  String iconId;
  String imageUrl;
  String createDate;
  String dueDate;
  String message;
  int countComment;
  int displayType;

  ModelAbstract({
    this.contentId = '',
    this.title = '',
    this.description = '',
    this.iconId = '',
    this.imageUrl = '',
    this.createDate = '',
    this.dueDate = '',
    this.message = '',
    this.countComment = 0,
    this.displayType = 0,
  });
}
