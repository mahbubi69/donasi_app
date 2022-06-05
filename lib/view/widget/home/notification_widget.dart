import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationWidget {
  static final _notificarion = FlutterLocalNotificationsPlugin();

  static Future init({bool schdule = false}) async {
    var initAndroidSetting =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    final setting =
        InitializationSettings(android: initAndroidSetting, iOS: ios);

    await _notificarion.initialize(setting);
  }

  static Future showNotification({
    var id = 0,
    title,
    body,
    paylod,
  }) async =>
      _notificarion.show(id, title, body, await notificationDetail());

  static notificationDetail() async {
    return NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }
}
