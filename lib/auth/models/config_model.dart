import 'package:tiptrick_game/auth/_auth_export.dart';

enum Environment { staging, development, product }
enum ApiVersion { apiv1, apiv2 }

class ConfigModel {
  final Environment environment;
  final String envCode;
  final ApiVersion apiVersion;
  final String apiEndpoint;
  final String urlReCaptcha;
  final String aesAccountAPI;
  final Map<String, String> headers;

  ConfigModel({
    this.environment = Environment.development,
    this.envCode = '',
    this.apiVersion = ApiVersion.apiv1,
    this.apiEndpoint = '',
    this.urlReCaptcha = '',
    this.aesAccountAPI = '',
    this.headers = const {},
  });

  String decrypt(String data) => AES.decrypt(data);

  Map<String, dynamic> toMap() => null;
}
