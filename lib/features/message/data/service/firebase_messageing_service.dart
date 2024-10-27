import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../firebase_options.dart';
import 'notifications_service.dart';

class FirebaseMessageService extends NotificationService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? _token;
  Stream<String>? _tokenStream;
  // ignore: unused_field
  bool _requested = false;
  // ignore: unused_field
  bool _fetching = false;
  // ignore: unused_field
  late NotificationSettings? _settings;


  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
      await handleBackgroundMessage(message);

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (message.notification != null) {
      print("Background notification: ${message.notification?.title}");
    }
  }


  @override
  Future<void> init() async {
    await messaging.requestPermission();
    await getDeviceToken();

    FirebaseMessaging.onMessage.listen(handleForegroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleForegroundNotification);
  }

  @override
  Future<void> getDeviceToken() async {
    _token ??= await messaging.getToken(vapidKey: dotenv.env['VAPIDKEY']);
    _tokenStream = messaging.onTokenRefresh;
    _tokenStream?.listen((token) {
      _token = token;
      print('FCM Token: $token');
    });
  }

  /// Retrieves the current notification settings and sets the [_requested] flag.
  ///
  /// This allows the app to determine whether the user has been prompted to
  /// grant notification permissions, without actually prompting the user.
  ///
  /// The [_fetching] flag is used to prevent concurrent requests to the
  /// underlying SDK.
  @override
  Future<void> requestPermissions() async {
    _fetching = true;
    _settings = await messaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    _requested = true;
    _fetching = false;
  }

  /// Retrieves the current notification settings and sets the [_requested] flag.
  /// This allows the app to determine whether the user has been prompted to
  /// grant notification permissions, without actually prompting the user.
  ///
  /// This is useful when the app needs to display a custom permission prompt,
  /// rather than relying on the default prompt provided by the Firebase SDK.
  ///
  /// The [_fetching] flag is used to prevent concurrent requests to the
  /// underlying SDK.
  @override
  Future<void> checkPermissions() async {
    _fetching = true;
    _settings = await messaging.getNotificationSettings();
    _requested = true;
    _fetching = false;
  }

  @override
  void handleForegroundNotification(dynamic message) {
    print('Got a message in the foreground! Data: ${message.data}');
    if (message.notification != null) {
      print('Notification: ${message.notification?.title}');
    }
  }

  @override
  Stream<String>? get tokenStream => _tokenStream;

  @override
  String? get Token => _token;
}
