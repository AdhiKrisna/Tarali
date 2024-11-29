import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:tarali/firebase_options.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/routes/route_page.dart';
import 'package:flutter/services.dart';
import 'package:tarali/services/music_service.dart';
// import 'package:tarali/services/notification_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Tambahkan logika untuk menangani pesan di sini
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/logo');

  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

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
          playSound: true,
          enableVibration: true,
          priority: Priority.high,
            importance: Importance.max,
            showWhen: true,

        ),
      ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    // Tunda inisialisasi Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log("Firebase initialization error: $e");
  }
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ],
  );

  // NotificationService notificationService = NotificationService();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
  // // Tunda inisialisasi layanan notifikasi
  // await notificationService.requestPermission();
  // await notificationService.initialize();
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AudioService());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePages().routes,
      initialRoute: RouteName.splash,
    );
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // Inisialisasi Firebase jika diperlukan
//   await Firebase.initializeApp();

//   // Tambahkan logika untuk menangani pesan di sini
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/logo');

//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   // Inisialisasi plugin
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   await flutterLocalNotificationsPlugin.show(
//       message.notification.hashCode,
//       message.notification!.title,
//       message.notification!.body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           "CHANNEL ID",
//           "SCORING TARALI",
//           // other properties...
//         ),
//       ));
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   SystemChrome.setPreferredOrientations(
//     [
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ],
//   );
//   NotificationService notificationService = NotificationService();
//   await notificationService.requestPermission();
//   notificationService.initialize();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   Get.put(AudioService());
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: RoutePages().routes,
//       initialRoute: RouteName.splash,
//     );
//   }
// }