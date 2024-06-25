import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/tzdata.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // static final messaging = FirebaseMessaging.instance;
  static deleteNotification(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );

    Permission.notification.request();

    Permission.scheduleExactAlarm.request();
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Extracting payload from notification details
        final String payloadString = details.payload!;

        // Convert payload string to map
        final Map<String, dynamic> payload = _convertStringToMap(payloadString);

        // Parse the payload to extract id and type
        final int? id = int.tryParse(payload['id']);
        final String? type = payload['type'];
        print("Id: " + id.toString());
        print("Type: " + type.toString());
        // Navigate to news or handle the payload as required
        // navigateToCustomPage(id, type);
        print(id);
        print(type);

        // NotificationNavigation.navigateToCustomPage(id, type.toString());
      },
    );

    // Configure the onMessage, onBackgroundMessage, and onLaunch callbacks
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    //   debugPrint('onMessage: $message');
    //   print(message.toMap().toString());
    //   await handleNotification(message.toMap());
    // });

    // Request permission for displaying notifications on iOS devices
    // final NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   provisional: true,
    //   sound: true,
    // );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   debugPrint('User granted permission for notifications');
    // } else {
    //   debugPrint('User declined permission for notifications');
    // }
  }

  static Map<String, dynamic> _convertStringToMap(String payloadString) {
    try {
      print(json.decode(payloadString));
      return json.decode(payloadString);
    } catch (e, stackTrace) {
      print("Error converting payload string to map: $e");
      print("Stack trace: $stackTrace");
      return {}; // Return an empty map or handle the error as per your requirement
    }
  }

  static Future<void> handleNotification(Map<String, dynamic> message) async {
    final NotificationData data = NotificationData.fromMap(message);
    // Show local notification when the app is in the foreground
    if (data.title.isNotEmpty && data.body.isNotEmpty) {
      print(data.title);
      print(data.body);
      print(message['data'] ?? 'no');
      await _showLocalNotification(data);
    }
  }

  static Future<void> scheduleNotificationAtSpecificTime(int id, DateTime scheduledTime, String title, String body, {String payload = ''}) async {
    if (scheduledTime.isBefore(DateTime.now())) {
      print("Notification cannot be scheduled in the past.");
      return;
    }

    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // icon: 'launch_background',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      styleInformation: BigTextStyleInformation(''),
      // groupKey: "com.yourapp.notifications",
      color: Colors.red,
      colorized: true,
    );

    NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body, tz.TZDateTime.from(scheduledTime, tz.local), platformDetails,
        payload: payload, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, matchDateTimeComponents: DateTimeComponents.time);
  }

  static Future<void> show(String title, String body) async {
    int rand = Random().nextInt(54552);
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'GuROW',
      'GuROW',
      // 'channel_description',
      // icon: '@drawable/notification_icon',
      groupKey: "groupKey$rand",
      // category: AndroidNotificationCategory('name'),
      visibility: NotificationVisibility.public,
      groupAlertBehavior: GroupAlertBehavior.all,
      color: const Color(0xFF980000),
      colorized: true,
      importance: Importance.max,
      styleInformation: const BigTextStyleInformation(''),
      // colorized: true,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    // const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(54123),
      title,
      body,
      platformChannelSpecifics,
    );
  }

  static Future<void> _showLocalNotification(NotificationData notificationData) async {
    int rand = Random().nextInt(54552);
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'GuROW',
      'GuROW',
      // 'channel_description',
      icon: '@drawable/notification_icon',
      groupKey: "groupKey$rand",
      // category: AndroidNotificationCategory('name'),
      visibility: NotificationVisibility.public,
      groupAlertBehavior: GroupAlertBehavior.all,
      color: const Color(0xFF980000),
      colorized: true,
      importance: Importance.max,
      // styleInformation: const BigTextStyleInformation(''),
      // colorized: true,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    // const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );
    print(json.encode({"id": notificationData.id, "type": notificationData.screenName}));
    await flutterLocalNotificationsPlugin.show(Random().nextInt(54123), notificationData.title, notificationData.body, platformChannelSpecifics,
        payload: json.encode({"id": notificationData.id, "type": notificationData.screenName}));
  }

  // static void subscribeToTopic(String topic) {
  //   messaging.subscribeToTopic(topic);
  // }

  // static void unSubscribeToTopic(String topic) {
  //   messaging.unsubscribeFromTopic(topic);
  // }
}

class NotificationData {
  final String title;
  final String body;
  final int? id;
  final String? screenName;
  NotificationData({required this.title, required this.body, this.id, this.screenName});

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
        title: map['notification']['title'] as String? ?? '',
        body: map['notification']['body'] as String? ?? '',
        id: int.tryParse((map['data']['id'] ?? "").toString()),
        screenName: (map['data']['type']).toString());
  }
}
