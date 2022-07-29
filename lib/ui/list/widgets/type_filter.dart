import 'package:flutter/material.dart';

import '../../../core/models/type_variables.dart';
import '../../../utils/types.dart';
import 'type_checkbox.dart';

class TypeFilter extends StatefulWidget {
  const TypeFilter({Key? key}) : super(key: key);

  @override
  State<TypeFilter> createState() => _TypeFilterState();
}

class _TypeFilterState extends State<TypeFilter> {
  List<String> selectedTypes = [];

  void typeClicked(String name) {
    setState(() {
      if (selectedTypes.contains(name)) {
        selectedTypes.removeWhere((item) => item == name);
      } else {
        selectedTypes.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: typeVariables.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final TypeVariables variable = typeVariables[index];
        return TypeCheckbox(
          typeVariable: variable,
          key: UniqueKey(),
          onClick: typeClicked,
          value: selectedTypes.contains(variable.name),
        );
      },
    );
  }
}
