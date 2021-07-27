
import 'package:flutter_eyepetizer/http/url.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

class AppInit {
  //private constructor
  AppInit._();

  //hide splash
  static Future<void> init() async {
    Urls.baseUrl = 'http://baobab.kaiyanapp.com/api/';
    return Future.delayed(Duration(milliseconds: 3600), () {
      FlutterSplashScreen.hide();
    });
  }
}
