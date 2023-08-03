class EnvRemote {
  EnvRemote._();
  static final EnvRemote _instance = EnvRemote._();
  static EnvRemote get instance => _instance;

  String endPointApi = '';
}