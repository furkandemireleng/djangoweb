import 'dart:io';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:eduasistogrenci/models/BildirimData.dart';
import 'package:eduasistogrenci/pages/anasayfa_page.dart';
import 'package:eduasistogrenci/pages/giris_yap_page.dart';
import 'package:eduasistogrenci/pages/splashscreen_page.dart';
import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:eduasistogrenci/services/bildirimler_db_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './bottomTabs.dart';

void main() {
  runApp(EduAsistOgrenci());
}

class EduAsistOgrenci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: colorPrimary,
        accentColor: colorPrimary,
        cursorColor: colorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("tr", "TR")],
    );
  }
}

Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print(data);
  }
  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }
  // Or do other work.
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AUTH_STAT { login, logout, loading }

class _RootPageState extends State<RootPage> {
  bool isAuth = false;

  AUTH_STAT _auth = AUTH_STAT.loading;
  bool isNotificationNewMessage = false;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future<void> _handleNotification(Map<dynamic, dynamic> message) async {
    print(message);
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
      String title = data['title'];
      BildirimlerLocalDb().open().then((db) {
        BildirimlerLocalDb().insert(
            db,
            BildirimData(
              title: title,
              endpoint: "Raporisletme/GorusmeSayisi",
              content: "Görüşme sayısı içerik denemesi text test",
              done: false,
            ));
      });
    }
    setState(() {
      isNotificationNewMessage = true;
    });
  }

  @override
  void initState() {
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    firebaseMessaging.configure(
        onBackgroundMessage:
            Platform.isAndroid ? backgroundMessageHandler : null,
        onMessage: _handleNotification,
        onResume: _handleNotification,
        onLaunch: _handleNotification);

    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings listen) {});

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    AuthService().authCheck().then((user) {
      if (user.oturumToken == null) {
        setState(() {
          _auth = AUTH_STAT.logout;
        });
      } else {
        setState(() {
          _auth = AUTH_STAT.login;
        });
        _ctrlAutoSelectedDerslikAndSezon();
      }
    });
    super.initState();
  }

  void _ctrlAutoSelectedDerslikAndSezon() {
    AuthService().getSavedDerslik().then((derslikId) {
      if (derslikId != -1) {
        setState(() {
          selectedDerslik = authUser.derslikler
              .where((element) => element.derslikID == derslikId)
              .first;
        });
      }
    });
    AuthService().getSavedSezon().then((sezonId) {
      if (sezonId != -1) {
        setState(() {
          selectedSezon =
              authUser.sezonlar.where((element) => element.id == sezonId).first;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_auth) {
      case AUTH_STAT.logout:
        return GirisYapPage();
        break;
      case AUTH_STAT.login:
        return Tabs();
        break;
      default:
        return SplashscreenPage();
        break;
    }
  }
}
