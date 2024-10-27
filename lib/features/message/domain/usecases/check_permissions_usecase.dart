import '../repositories/push_notification_reporsitory.dart';

class CheckPermissionsUseCase {
  final PushNotificationRepository repository;

  CheckPermissionsUseCase(this.repository);

  Future<void> execute() async {
    await repository.checkPermissions();
  }
}
