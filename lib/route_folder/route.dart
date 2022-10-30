import 'package:flutter/material.dart';
import 'package:flutter_application_3/route_folder/route_names.dart';
import 'package:flutter_application_3/screens/home_page.dart';
import 'package:flutter_application_3/screens/success_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case RouteName.successpage:
        // case 'success_page':
        return MaterialPageRoute(builder: (_) => SuccessScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
