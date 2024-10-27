// we use abstract 
abstract class NotificationService {
  Future<void> init();
  Future<void> requestPermissions();
  Future<void> checkPermissions();
  Stream<String>? get tokenStream;
  String? get Token;
  Future<void> getDeviceToken();
  void handleForegroundNotification(dynamic message);
  static Future<void> handleBackgroundMessage(dynamic message) async {}
}
