
import '../repositories/push_notification_reporsitory.dart';

class RequestPermissionsUseCase {
  final PushNotificationRepository repository;

  RequestPermissionsUseCase(this.repository);

  Future<void> execute() async {
    await repository.requestPermissions();
  }
}
