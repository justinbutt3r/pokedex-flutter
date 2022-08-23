import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description.replaceAll(RegExp('\n'), ' '),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
