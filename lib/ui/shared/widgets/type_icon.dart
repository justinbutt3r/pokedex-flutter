import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/models/type_variables.dart';

class TypeIcon extends StatelessWidget {
  const TypeIcon(
      {Key? key,
      required this.typeVariable,
      this.width = 100,
      this.height = 100,
      this.onClick})
      : super(key: key);
  final TypeVariables typeVariable;
  final double width;
  final double height;
  final void Function(String name)? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: typeVariable.color,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          onClick!(typeVariable.name);
        },
        child: Center(
          child: SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              typeVariable.image,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
