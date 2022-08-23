import 'package:flutter/material.dart';

import '../../../core/models/list_page_arguments.dart';
import '../../../core/models/type_variables.dart';
import '../../../utils/types.dart';
import '../../shared/widgets/page_heading.dart';
import '../../shared/widgets/type_icon.dart';

class PokemonTypesPage extends StatelessWidget {
  const PokemonTypesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void typeClicked(String name) {
      Navigator.pushNamed(
        context,
        '/list',
        arguments: ListPageArgument(type: name),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            const PageHeading(title: 'By Types'),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: typeVariables.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final TypeVariables variable = typeVariables[index];
                  return LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return TypeIcon(
                        typeVariable: variable,
                        key: UniqueKey(),
                        height: constraints.maxHeight * 0.5,
                        width: constraints.maxWidth * 0.5,
                        onClick: typeClicked,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
