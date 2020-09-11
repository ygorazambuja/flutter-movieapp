import 'package:admob_flutter/admob_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/app_controller.dart';

class AppWidget extends StatelessWidget {
  final AppController controller;

  const AppWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Admob.initialize('ca-app-pub-8572242041813835~3194237493');

    return Observer(builder: (_) {
      if (controller.themeType != null) {
        return MaterialApp(
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
          ],
          builder: BotToastInit(),
          navigatorKey: Modular.navigatorKey,
          title: 'YShare',
          debugShowCheckedModeBanner: false,
          theme: controller.themeType,
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
