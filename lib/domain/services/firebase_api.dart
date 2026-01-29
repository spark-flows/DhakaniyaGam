import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static String? currentUuid;
  static bool isVideo = false;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.data);
      if (Platform.isAndroid) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'high_importance_channel',
            title: message.notification?.title ?? '',
            body: message.notification?.body ?? "",
            payload: message.data.map(
              (key, value) => MapEntry(
                key,
                value.toString(),
              ),
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleNavigationOnNotificationBackground(message);
    });

    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      Get.find<BottomBarController>().selectedIndex = 1;
      Get.forceAppUpdate();
    }
  }

  static void onAppTerminateMode() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        handleNavigationOnNotification(message);
      }
    });
  }

  void onDidReceiveNotificationResponse(
      ReceivedNotification notificationResponse) async {
    if (notificationResponse.payload != null) {
      var message = notificationResponse.payload;
      if (message != null) {
        handleNavigationOnNotification(RemoteMessage.fromMap(message));
      }
    }
  }

  static void handleNavigationOnNotification(RemoteMessage message) {
    print(message);
  }

  static void handleNavigationOnNotificationBackground(RemoteMessage message) {
    Get.find<BottomBarController>().selectedIndex = 1;
    Get.forceAppUpdate();
  }

  static Future<void> initilizeNotification() async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: "high_importance_channel_group",
          channelKey: 'high_importance_channel', // Must match exactly
          channelName: 'High Importance Notifications',
          channelDescription: 'Demo Noteification ',
          ledColor: Colors.blue,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        ) 
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel',
          channelGroupName: 'Group 1',
        )
      ],
      debug: true,
    );

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) async {
        handleNavigationOnNotification(
          RemoteMessage(data: receivedAction.payload!),
        );
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}
}
