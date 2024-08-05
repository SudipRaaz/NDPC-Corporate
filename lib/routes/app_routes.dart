import 'package:flutter/material.dart';
import 'package:ndpc_web/presentation/Recharge/recharge_page.dart';
import 'package:ndpc_web/presentation/test/test.dart';

import '../presentation/home_page/home_page.dart';
import 'route_path.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    // route setting request cases
    switch (settings.name) {
      // case;
      case RoutesName.homePage_screen:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.recharge_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => RechargeFormPage());

      // case RoutesName.recharge_screen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ExcelExample());

      // if non of these above cases are met then return this
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route defined")),
          );
        });
    }
  }
}
