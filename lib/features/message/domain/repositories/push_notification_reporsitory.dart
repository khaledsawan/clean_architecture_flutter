abstract class PushNotificationRepository {
  Future<void> requestPermissions();
  Future<void> checkPermissions();
  Future<void> initNotifications();
  Stream<String>? getTokenStream();
  String? getToken();
}
