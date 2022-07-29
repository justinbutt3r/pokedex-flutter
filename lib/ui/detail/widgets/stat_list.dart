import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../utils/theme.dart';
import '../../../utils/types.dart';

const double LABEL_WIDTH = 50.0;

class StatList extends StatelessWidget {
  const StatList(
      {Key? key,
      required this.hp,
      required this.atk,
      required this.def,
      required this.satk,
      required this.sdef,
      required this.spd})
      : super(key: key);
  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stats',
            style: bodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: sizeBetween,
          ),
          StatItem(
            maxValue: 255.0,
            value: hp,
          ),
          StatItem(
            label: 'atk',
            value: atk,
          ),
          StatItem(
            label: 'def',
            maxValue: 250,
            value: def,
          ),
          StatItem(
            label: 'satk',
            value: satk,
          ),
          StatItem(
            label: 'sdef',
            maxValue: 250,
            value: sdef,
          ),
          StatItem(
            label: 'spd',
            value: spd,
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem(
      {Key? key, this.label = 'hp', this.value = 0, this.maxValue = 200.0})
      : super(key: key);
  final String label;
  final int value;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatName(
            label: label,
          ),
          StatValue(
            value: value,
          ),
          StatIndicator(
            value: value,
            maxValue: maxValue,
          ),
        ],
      ),
    );
  }
}

class StatName extends StatelessWidget {
  const StatName({Key? key, this.label = ''}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: Text(label.toUpperCase(), style: labelTextStyle),
    );
  }
}

class StatValue extends StatelessWidget {
  const StatValue({Key? key, this.value = 0}) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: Text('$value', style: labelTextStyle),
    );
  }
}

class StatIndicator extends StatelessWidget {
  const StatIndicator({Key? key, this.value = 0, this.maxValue = 200.0})
      : super(key: key);
  final int value;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    final double percentage = value / maxValue;
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - (LABEL_WIDTH * 2.75 + 32),
      animation: true,
      lineHeight: 16.0,
      animationDuration: 1000,
      percent: percentage,
      barRadius: const Radius.circular(20.0),
      backgroundColor: Colors.black,
      progressColor: grassColor,
    );
  }
}
