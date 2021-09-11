import 'package:flutter/material.dart';
import 'package:googleandfacebook/ALL%20NAVIGATION%20ROUTES/navigation_route_name.dart';
import 'package:googleandfacebook/GETSTARTED/getStarted.dart';
import 'package:googleandfacebook/HOME%20SCREEN%20PAGE/home_screen_page.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/register_page.dart';
import 'package:googleandfacebook/STAY%20CONNECTED%20PAGE/stay_connected.dart';
import 'package:googleandfacebook/SplashScreeen/splashscreen.dart';
import 'package:logger/logger.dart';

class RouteGenerator {
  static var logger = Logger();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    logger.w('=====>   ${settings.name}');
    switch (settings.name) {
      case AllRouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => Log());
        break;

      case AllRouteNames.getStartedPage:
        return MaterialPageRoute(builder: (context) => GetStarted());
        break;

      case AllRouteNames.homeScreenPage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
        break;

      case AllRouteNames.loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;

      case AllRouteNames.stayConnectedPage:
        return MaterialPageRoute(builder: (context) => StayConnectedPage());
        break;

      case AllRouteNames.registerPageForParampara:
        return MaterialPageRoute(
            builder: (context) => RegisterPageForParampara());
        break;

      default:
        return MaterialPageRoute(builder: (context) => Log());
    }
  }
}
