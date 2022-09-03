import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

import 'Routes/generated_routes.dart';
import 'b_first_page.dart';
import 'c_second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuickActions quickActions = const QuickActions();
  String quickActionScreen = '';

  @override
  void initState() {
    initializeQuickActions();
    super.initState();
  }

  initializeQuickActions() {
    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'First Page Screen':
          _navigate('/firstpage');
          return;
        case 'Second Page Screen':
          _navigate('/secondpage');
          return;
        default:
          _navigate('/firstpage');
          return;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'First Page Screen',
        localizedTitle: 'First Page',
        icon: 'image1',
      ),
      const ShortcutItem(
        type: 'Second Page Screen',
        localizedTitle: 'Second Page',
        icon: 'image1',
      ),
    ]);
  }

  _navigate(String screen) {
    print(screen);
    if (screen == quickActionScreen) {
      Navigator.pushNamed(context, screen);
      Navigator.pop(context);
    } else {
      Navigator.pushNamed(context, screen)
          .then((value) => setState(() => quickActionScreen = ''));
    }
    setState(() => quickActionScreen = screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              child: const Text('First page'),
              onPressed: () {
                Navigator.pushNamed(context, '/firstpage');
              }),
          ElevatedButton(
            child: const Text('Second page'),
            onPressed: () => Navigator.pushNamed(context, '/secondpage'),
          ),
        ],
      )),
    );
  }
}
