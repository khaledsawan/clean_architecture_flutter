
import '../repositories/push_notification_reporsitory.dart';

class InitNotificationsUseCase {
  final PushNotificationRepository repository;

  InitNotificationsUseCase(this.repository);

  Future<void> execute() async {
    await repository.initNotifications();
  }
}
