import 'package:flutter/material.dart';
import '../../../core/models/list_page_arguments.dart';
import '../../../utils/theme.dart';

class GenerationCard extends StatelessWidget {
  const GenerationCard({Key? key, this.generation = 1}) : super(key: key);
  final int generation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            'Generation $generation',
            style: largeTextStyle,
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/list',
          arguments: ListPageArgument(generation: generation),
        );
      },
    );
  }
}
