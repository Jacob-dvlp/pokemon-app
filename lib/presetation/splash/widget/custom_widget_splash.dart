import 'package:app_pokmon/presetation/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../src/constant/constant_img.dart';

class CustomWidgetSplash extends StatelessWidget {
  const CustomWidgetSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(backgroundSplash),
            ],
          ),
          const Positioned(
              left: 20,
              right: 20,
              bottom: 50,
              child: Center(
                  child: CircularProgressIndicator(
                color: Color(0xfffeca05),
              )))
        ],
      ),
    );
  }
}
