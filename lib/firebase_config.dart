import 'package:eran_by_saving/utils/push_notification.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp();
  await PushNotificationService.requestPermissions();
  await PushNotificationService.initCM();
}
