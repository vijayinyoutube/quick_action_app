import 'package:flutter/material.dart';
import '../b_first_page.dart';
import '../c_second_page.dart';

import '../a_homepage.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: 'Flutter Quick Actions'));
      case '/firstpage':
        return MaterialPageRoute(
            builder: (_) => const FirstPage(title: 'First Page Screen'));
      case '/secondpage':
        return MaterialPageRoute(
            builder: (_) => const SecondPage(title: 'Second Page Screen'));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
