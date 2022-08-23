import 'package:flutter/material.dart';

class GenericInfo extends StatelessWidget {
  const GenericInfo({Key? key, required this.height, required this.weight})
      : super(key: key);
  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    final String heightValue = (height / 10).toString();
    final String weightValue = (weight / 10).toString();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoItem(label: 'Height', value: '$heightValue m'),
          InfoItem(label: 'Weight', value: '$weightValue kg'),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
