import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:{{name.snakeCase()}}/data/service/preferences/preferences.dart';
import 'package:{{name.snakeCase()}}/presentation/manager/notification/notification_model.dart';

class NotificationManager {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _notificationController = BehaviorSubject<FirebaseNotificationModel?>();
  final _notificationControllerTest = BehaviorSubject<RemoteMessage?>();
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Stream<FirebaseNotificationModel?> get notificationStream =>
      _notificationController.stream;
  Stream<RemoteMessage?> get notificationStreamTest =>
      _notificationControllerTest.stream;

  Future initializeNotifications() async {
    await _registerIOS();
    await _getToken();
    await _listen();
    await subscribe("all");
  }

  final _androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'E-Bina',
    'E-Bina',
    playSound: true,
    importance: Importance.max,
    priority: Priority.high,
  );

  final _iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
    sound: 'default',
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  Future _showBigTextNotification({RemoteMessage? message}) async {
    var notificationDetail = NotificationDetails(
      android: _androidPlatformChannelSpecifics,
      iOS: _iOSPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    const androidInitialize =
        AndroidInitializationSettings('mipmap/launcher_icon');
    const iOSInitialize = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initializationsSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (details) {
        if (message != null) {
          _handleMessage(message, false);
          _notificationController.add(null);
        }
      },
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      _encodeTextToUrl(message?.data["title"] ?? ""),
      _encodeTextToUrl(message?.data["message"] ?? ""),
      notificationDetail,
    );
  }

  String _encodeTextToUrl(String text) {
    return Uri.decodeComponent(text).replaceAll("+", " ");
  }

  _getToken() async {
    final prefs = await PreferencesService.instance;
    final fcmToken = await _firebaseMessaging.getToken();
    await prefs.setFcmToken(fcmToken ?? "");

    if (kDebugMode) print("FCM TOKEN: $fcmToken");
  }

  _listen() async {
    // const message = RemoteMessage(
    //   notification: RemoteNotification(
    //     title: "Test",
    //     body: "Test",
    //   ),
    // );
    // _notificationControllerTest.add(message);
    // _showBigTextNotification(
    //   message: message,
    // );
    final initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) _handleMessage(initialMessage, false);

    FirebaseMessaging.onMessage.listen((message) async {
      return _showBigTextNotification(
        message: message,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(message, true);
    });
  }

  _handleMessage(RemoteMessage message, bool fromBackground) {
    final notification = FirebaseNotificationModel(
      title: _encodeTextToUrl(message.data["title"] ?? ""),
      body: _encodeTextToUrl(message.data["message"] ?? ""),
      route: message.data["page"],
      fromBackground: fromBackground,
    );
    _notificationController.add(notification);
  }

  _registerIOS() async {
    if (Platform.isIOS) {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print("User granted permission");
      } else {
        print("User declined or has not accepted permission");
      }
    }
  }

  subscribe(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  close() {
    _notificationController.close();
    _notificationControllerTest.close();
  }
}
