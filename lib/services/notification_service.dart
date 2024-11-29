import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final dashboardController = Get.put(DashboardController());
  Future<void> initialize() async {
    // Mendapatkan FCM Token jika diperlukan
    // String? token = await _firebaseMessaging.getToken();

    // Listener notifikasi saat aplikasi di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('@mipmap/logo');

        const InitializationSettings initializationSettings =
            InitializationSettings(
          android: initializationSettingsAndroid,
        );

        // Inisialisasi plugin
        await flutterLocalNotificationsPlugin
            .initialize(initializationSettings);

        await flutterLocalNotificationsPlugin.show(
            message.notification.hashCode,
            message.notification!.title,
            message.notification!.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                "CHANNEL ID",
                "SCORING TARALI",
                // other properties...
                playSound: true,
                enableVibration: true,
                priority: Priority.high,
                importance: Importance.max,
                showWhen: true,
              ),
            ));
      }
    });

    // Listener notifikasi saat aplikasi di background atau ketika pengguna menekan notifikasi
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Pesan di-tap di background: ${message.notification?.body}');
      //Klo pesan nya di tap, nanti bakal ngarah kemana, itu kmu detailin
      Get.toNamed(
        RouteName.history,
        arguments: dashboardController.userModel.toMap(),
      );
    });
  }

  bool _isRequestingPermission = false;

  Future<void> requestPermission() async {
    if (_isRequestingPermission) {
      log("Permission request is already running.");
      return;
    }
    _isRequestingPermission = true;
    try {
      NotificationSettings settings =  await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        log("User granted permission");
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        log("User granted provisional permission");
      } else {
        log("User declined or has not accepted permission");
      }
    } catch (e) {
      log("Error requesting permission: $e");
    } finally {
      _isRequestingPermission = false;
    }
  }

  Future<bool> hasPermission() async {
    NotificationSettings settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }
}
