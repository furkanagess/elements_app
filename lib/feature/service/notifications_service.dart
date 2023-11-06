import 'package:firebase_messaging/firebase_messaging.dart';

/// The `NotificationService` class is responsible for managing notifications within your Flutter application
/// using Firebase Cloud Messaging (FCM). It provides methods for initializing notifications and handling
/// background messages.
class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// Initializes notifications and requests permission from the user.
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

/// Handles background messages received by the application from Firebase Cloud Messaging (FCM).
///
/// This function is called when a background message is received by the application. You can implement
/// custom logic to process the message or perform actions in response to the notification.
Future<void> handleBackgroundMessage(RemoteMessage message) async {}
