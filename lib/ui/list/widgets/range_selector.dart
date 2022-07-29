import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class RangeSelector extends StatefulWidget {
  const RangeSelector(
      {Key? key, required this.label, this.max = 50, this.min = 0})
      : super(key: key);

  final String label;
  final double max;
  final double min;

  @override
  State<RangeSelector> createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelector> {
  @override
  void initState() {
    min = widget.min;
    _currentRangeValues = RangeValues(min, 30);
    super.initState();
  }

  late double min;

  late RangeValues _currentRangeValues;

  @override
  Widget build(BuildContext context) {
    final RangeLabels labels = RangeLabels(
      _currentRangeValues.start.round().toString(),
      _currentRangeValues.end.round().toString(),
    );
    final double range = widget.max;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: resultTextStyle,
        ),
        RangeSlider(
          values: _currentRangeValues,
          max: range,
          min: widget.min,
          labels: labels,
          divisions: range.toInt(),
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        )
      ],
    );
  }
}
