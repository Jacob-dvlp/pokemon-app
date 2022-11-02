import 'package:flutter/material.dart';

import '../home_tabs.dart';

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeTabs(),
    );
  }
}
