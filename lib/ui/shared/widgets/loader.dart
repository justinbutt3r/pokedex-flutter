import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      builder: (context, child, double value) {
        return Transform.rotate(
          angle: pi * value,
          child: SizedBox(
            width: 150,
            height: 150,
            child: SvgPicture.asset(
              'assets/images/pokeball_2.svg',
            ),
          ),
        );
      },
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 2),
    );
  }
}
