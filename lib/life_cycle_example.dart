import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeCyleExample extends StatefulWidget {
  const LifeCyleExample({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<LifeCyleExample> createState() => _LifeCyleExampleState();
}

class _LifeCyleExampleState extends State<LifeCyleExample>
    with WidgetsBindingObserver {
  Timer? timer;
  int count = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count += 1;
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(' didChangeAppLifecycleState : $state');
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      debugPrint('didChangeAppLifecycleState: inactive');
    }
    if (state == AppLifecycleState.resumed) {
      debugPrint('didChangeAppLifecycleState: resumed');
    }
    if (state == AppLifecycleState.detached) {
      debugPrint('didChangeAppLifecycleState: detached');
    }
    if (state == AppLifecycleState.paused) {
      debugPrint('didChangeAppLifecycleState: paused');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$count')),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    timer?.cancel();
    super.dispose();
  }
}
