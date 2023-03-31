class DeviceInfoModel {
  String clientId;
  String deviceInfo;
  String clientIp;
  String fcmToken;
  String versionNumber;

  Map<String, dynamic> fromJson() => {
        "ClientId": clientId,
        "DeviceInfo": deviceInfo,
        "ClientIp": clientIp,
        "FcmToken": fcmToken,
        "VersionNumber": versionNumber,
      };
}
