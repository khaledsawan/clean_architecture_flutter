import '../../domain/repositories/push_notification_reporsitory.dart';
import '../service/firebase_messageing_service.dart';

class PushNotificationRepositoryImpl implements PushNotificationRepository {
  final FirebaseMessageService firebaseService;

  PushNotificationRepositoryImpl({required this.firebaseService});

  @override
  Future<void> initNotifications() => firebaseService.init();

  @override
  Future<void> requestPermissions() => firebaseService.requestPermissions();

  @override
  Future<void> checkPermissions() => firebaseService.checkPermissions();

  @override
  Stream<String>? getTokenStream() => firebaseService.tokenStream;

  @override
  String? getToken() => firebaseService.Token;
}
