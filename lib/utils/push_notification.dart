import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initCM() async {
    token = await FirebaseMessaging.instance.getToken();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    print("Token: $token");

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static Future _onMessage(RemoteMessage message) async {
    print("onMessage messageId ${message.messageId}");
    print("onMessage data ${message.data}");
  }

  static Future _onBackgroundMessage(RemoteMessage message) async {
    print("onBackgroundMessage ${message.messageId}");
    print("onBackgroundMessage notification ${message.data}");
    print("onBackgroundMessage notification ${message.notification?.body}");
    print("onBackgroundMessage notification ${message.notification?.title}");
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print("onMessageOpenApp ${message.messageId}");
  }

  static Future requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }
}
