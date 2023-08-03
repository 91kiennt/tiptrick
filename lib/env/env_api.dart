abstract class EnvConfigApi {}

class EnvConfigApiStaging extends EnvConfigApi {
  EnvConfigApiStaging._();
  static final EnvConfigApiStaging _instance = EnvConfigApiStaging._();
  static EnvConfigApiStaging get instance => _instance;
  String get _host => '';

  Map<String, dynamic> get apiStaging => {
    'GetListTipTrick': '$_host/'
  };
}

class EnvConfigApiProduction extends EnvConfigApi {
  EnvConfigApiProduction._();
  static final EnvConfigApiProduction _instance = EnvConfigApiProduction._();
  static EnvConfigApiProduction get instance => _instance;
  String get _host => '';

  Map<String, dynamic> get apiProduction => {
    'GetListTipTrick': '$_host/'
  };
}
