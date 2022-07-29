import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/models/type_variables.dart';

class TypeCheckbox extends StatelessWidget {
  const TypeCheckbox({
    Key? key,
    required this.typeVariable,
    this.value = false,
    required this.onClick,
  }) : super(key: key);

  final TypeVariables typeVariable;
  final bool value;
  final void Function(String name) onClick;

  @override
  Widget build(BuildContext context) {
    final TypeVariables typeVariables = typeVariable;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: value ? typeVariables.color : Colors.grey,
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              onClick(typeVariable.name);
            },
            child: Center(
              child: SizedBox(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth * 0.5,
                child: SvgPicture.asset(
                  typeVariables.image,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
