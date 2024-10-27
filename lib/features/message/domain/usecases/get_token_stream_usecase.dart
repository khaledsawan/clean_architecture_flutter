import '../repositories/push_notification_reporsitory.dart';

class GetTokenStreamUseCase {
  final PushNotificationRepository repository;

  GetTokenStreamUseCase(this.repository);

  Stream<String>? execute() {
    return repository.getTokenStream();
  }
}
