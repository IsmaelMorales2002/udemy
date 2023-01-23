// Sha-1 : B8:DB:30:38:78:E6:CB:9C:B7:8F:F5:B1:C0:B6:33:53:3F:33:B5:75

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messagestream = new StreamController.broadcast();
  static Stream<String> get messageStream => _messagestream.stream;

  static Future _backgroudHandler(RemoteMessage message)async{
    // print('background Handler ${message.messageId}');
    print(message.data);
    _messagestream.add(message.data['product'] ?? 'No Data');
  }

  
  static Future _onMessageHandler(RemoteMessage message)async{
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messagestream.add(message.data['product'] ?? 'No Data');
  }

  
  static Future _onMessageOpenApp(RemoteMessage message)async{
    // print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messagestream.add(message.data['product'] ?? 'No Data');

  }

  static Future initializeApp() async{

    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');
    
    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroudHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //Local Notification
    
  }

  static closeStreams(){
    _messagestream.close();
  }

}