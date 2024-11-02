import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initialize() async {
    // Mendapatkan FCM Token jika diperlukan
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    // Listener notifikasi saat aplikasi di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      RemoteNotification? notification = message.notification;
      print('Pesan diterima di foreground: ${message.notification?.body}');
      if(notification != null){
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
        const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/logo');

        const InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
        );

        // Inisialisasi plugin
        await flutterLocalNotificationsPlugin.initialize(initializationSettings);

        await flutterLocalNotificationsPlugin.show(
            message.notification.hashCode,
            message.notification!.title,
            message.notification!.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                "CHANNEL ID",
                "SCORING TARALI",
                // other properties...
              ),
            ));
      }
    });

    // Listener notifikasi saat aplikasi di background atau ketika pengguna menekan notifikasi
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Pesan di-tap di background: ${message.notification?.body}');
      //Klo pesan nya di tap, nanti bakal ngarah kemana, itu kmu detailin
    });
  }

  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User declined or has not accepted permission");
    }
  }
}