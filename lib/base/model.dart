import 'dart:convert';

abstract class _ModelInterface {
  Model clone() => null;

  Map<String, dynamic> toMap();

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() => Model.mapToString(toMap());

  dynamic operator [](String key) => toMap()[key];
}

abstract class Model with _ModelInterface {
  static String mapToString(Map<String, dynamic> map) {
    return json.encode(map);
  }

  static Map<String, dynamic> stringToMap(String string) {
    return json.decode(string);
  }

  static List<T> generator<T>(dynamic items, Function(dynamic) cb) {
    return List<T>.generate(
      items != null ? items.length : 0,
      (int index) => cb(items[index]),
    );
  }
}
