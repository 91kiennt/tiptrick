// import 'dart:convert';

import 'package:tiptrick_game/base/enum.dart';
import 'package:tiptrick_game/env/env_model.dart';
import 'package:tiptrick_game/env/env_remote.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';

class EnvState {
  EnvState._();
  static final EnvState _instance = EnvState._();
  static EnvState get instance => _instance;

  EnvModel _envModel = EnvModel();
  EnvModel get envModel => _envModel;

  EnvEnum _envEnum = EnvEnum.staging;
  set appEnv(EnvEnum value) => _envEnum = value;

  // FirebaseRemoteConfig get remoteFirebase => FirebaseRemoteConfig.instance;

  EnvRemote get envRemote => EnvRemote.instance;

  void _setEnvForState(EnvEnum _envEnum) {
    switch (_envEnum) {
      case EnvEnum.development:
        _envModel = EnvModel(apiEndPoint: envRemote.endPointApi);
        break;
      case EnvEnum.staging:
        _envModel = EnvModel(apiEndPoint: envRemote.endPointApi);
        break;
      case EnvEnum.production:
        _envModel = EnvModel(apiEndPoint: envRemote.endPointApi);
    }
  }

  void setEnvForApp() {
    _setEnvForState(_envEnum);
  }

  Future<void> initEnvForRemote() async {
    void _initEnvForRemote() {
      // Map<String, dynamic> _cfg =
      //     json.decode(remoteFirebase.getString('_AppConstant'));
      // envRemote.endPointApi = _cfg['AppDomain'];
    }

    _initEnvForRemote();
  }
}
