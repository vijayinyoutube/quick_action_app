import 'package:flutter/material.dart';
import 'package:quick_action_app/b_first_page.dart';
import 'package:quick_actions/quick_actions.dart';

import 'c_second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    initializeQuickActions();
    super.initState();
  }

  initializeQuickActions() {
    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'First page':
          _navigate(FirstPage(title: shortcutType));
          return;
        case 'Second page':
          _navigate(SecondPage(title: shortcutType));
          return;
        default:
          _navigate(FirstPage(title: shortcutType));
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

  _navigate(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
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
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const FirstPage(title: 'First Page Screen'))),
          ),
          ElevatedButton(
            child: const Text('Second page'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const SecondPage(title: 'Second Page Screen'))),
          ),
        ],
      )),
    );
  }
}
