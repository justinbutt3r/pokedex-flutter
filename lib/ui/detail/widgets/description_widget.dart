import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription(
      {Key? key,
      required this.description,
      this.padding = const EdgeInsets.all(16.0)})
      : super(key: key);
  final String description;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        description.replaceAll(RegExp('\n'), ' '),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
