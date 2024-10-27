import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/check_permissions_usecase.dart';
import '../../domain/usecases/get_token_stream_usecase.dart';
import '../../domain/usecases/init_notifications_usecase.dart';
import '../../domain/usecases/request_permissions_usecase.dart';

class PushNotificationBloc extends Cubit<void> {
  final RequestPermissionsUseCase requestPermissionsUseCase;
  final CheckPermissionsUseCase checkPermissionsUseCase;
  final InitNotificationsUseCase initNotificationsUseCase;
  final GetTokenStreamUseCase getTokenStreamUseCase;

  PushNotificationBloc({
    required this.requestPermissionsUseCase,
    required this.checkPermissionsUseCase,
    required this.initNotificationsUseCase,
    required this.getTokenStreamUseCase,
  }) : super(null);

  Future<void> requestPermissions() async {
    await requestPermissionsUseCase.execute();
  }

  Future<void> checkPermissions() async {
    await checkPermissionsUseCase.execute();
  }

  /// Initializes push notifications.
  ///
  /// we alreday called in dependency injection || This should be called as soon as possible when the app is launched.
  ///
  Future<void> initNotifications() async {
    await initNotificationsUseCase.execute();
  }

  Stream<String>? getTokenStream() {
    return getTokenStreamUseCase.execute();
  }
}
