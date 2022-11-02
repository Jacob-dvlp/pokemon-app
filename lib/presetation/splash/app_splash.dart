import 'package:flutter/material.dart';

import 'widget/custom_widget_splash.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({Key? key}) : super(key: key);

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 6),
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomWidgetSplash();
  }
}
