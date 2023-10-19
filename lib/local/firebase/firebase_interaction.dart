import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tiptrick_game/global_state.dart';

final AndroidInitializationSettings _androidInitializationSettings =
    new AndroidInitializationSettings('');
final DarwinInitializationSettings _darwinInitializationSettings =
    new DarwinInitializationSettings();

final InitializationSettings initializationSettings =
    new InitializationSettings(
  android: _androidInitializationSettings,
  iOS: _darwinInitializationSettings,
);

Stream<String> _tokenFcm;
AndroidNotificationChannel _androidNotificationChannel;
FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

class FirebaseInteraction {
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: '', appId: '', messagingSenderId: '', projectId: ''));
    _getTokenFcm();
    await _initMessage();
    _showNotification(message);
  }

  static Future<void> _initMessage() async {
    _androidNotificationChannel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // android
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidNotificationChannel);

    // iOS
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    try {
      FirebaseMessaging.instance.getInitialMessage().then((value) => {});
      FirebaseMessaging.onMessage.listen((event) => _onTapMessage(event));
      FirebaseMessaging.onMessageOpenedApp
          .listen((event) => _onTapMessage(event));
    } catch (e) {}
  }

  static void _onTapMessage(RemoteMessage message) {}

  static void _showNotification(RemoteMessage message) {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    AppleNotification iOS = message.notification?.apple;
    if (notification != null && android != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidNotificationChannel.id,
            _androidNotificationChannel.name,
            channelDescription: _androidNotificationChannel.description,
            icon: 'launch_background',
          ),
        ),
      );
    } else if (notification != null && iOS != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          iOS: DarwinNotificationDetails(
            presentSound: true,
            presentBanner: true,
          ),
        ),
      );
    }
  }

  static void _getTokenFcm() {
    try {
      FirebaseMessaging.instance
          .getToken(vapidKey: '')
          .then(GlobalState.setToken);
      _tokenFcm = FirebaseMessaging.instance.onTokenRefresh;
      _tokenFcm.listen(GlobalState.setToken);
    } catch (e) {}
  }
}
