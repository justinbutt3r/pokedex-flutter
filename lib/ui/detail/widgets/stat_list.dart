import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../utils/theme.dart';

const double LABEL_WIDTH = 50.0;

class StatList extends StatelessWidget {
  const StatList({
    Key? key,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
    this.color = Colors.white,
    this.baseWidth,
  }) : super(key: key);
  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;
  final Color color;
  final double? baseWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stats',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: sizeBetween,
          ),
          StatItem(
            maxValue: 255.0,
            value: hp,
            color: color,
            baseWidth: baseWidth,
          ),
          StatItem(
            label: 'atk',
            value: atk,
            color: color,
            baseWidth: baseWidth,
          ),
          StatItem(
            label: 'def',
            maxValue: 250,
            value: def,
            color: color,
            baseWidth: baseWidth,
          ),
          StatItem(
            label: 'satk',
            value: satk,
            color: color,
            baseWidth: baseWidth,
          ),
          StatItem(
            label: 'sdef',
            maxValue: 250,
            value: sdef,
            color: color,
            baseWidth: baseWidth,
          ),
          StatItem(
            label: 'spd',
            value: spd,
            color: color,
            baseWidth: baseWidth,
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({
    Key? key,
    this.label = 'hp',
    this.value = 0,
    this.maxValue = 200.0,
    this.baseWidth,
    required this.color,
  }) : super(key: key);
  final String label;
  final int value;
  final double maxValue;
  final Color color;
  final double? baseWidth;

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
            color: color,
            baseWidth: baseWidth,
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
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
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
      child: Text(
        '$value',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class StatIndicator extends StatelessWidget {
  const StatIndicator({
    Key? key,
    this.value = 0,
    this.maxValue = 200.0,
    required this.color,
    this.baseWidth,
  }) : super(key: key);
  final int value;
  final double maxValue;
  final Color color;
  final double? baseWidth;

  @override
  Widget build(BuildContext context) {
    final double percentage = value / maxValue;
    return LinearPercentIndicator(
      width: (baseWidth ?? MediaQuery.of(context).size.width) -
          (LABEL_WIDTH * 2.75 + 32),
      animation: true,
      lineHeight: 16.0,
      animationDuration: 1000,
      percent: percentage,
      barRadius: const Radius.circular(20.0),
      backgroundColor: Theme.of(context).indicatorColor,
      progressColor: color,
    );
  }
}

class StatListMini extends StatelessWidget {
  const StatListMini({
    Key? key,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
    this.color = Colors.white,
    this.baseWidth,
  }) : super(key: key);

  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;
  final Color color;
  final double? baseWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.black.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MiniStatIndicator(
            label: MiniLabel(label: 'hp - ${hp.toString()}'),
            maxValue: 255.0,
            value: hp,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
          MiniStatIndicator(
            label: MiniLabel(label: 'atk - ${atk.toString()}'),
            value: atk,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
          MiniStatIndicator(
            label: MiniLabel(label: 'def - ${def.toString()}'),
            maxValue: 250,
            value: def,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
          MiniStatIndicator(
            label: MiniLabel(label: 'satk - ${satk.toString()}'),
            value: satk,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
          MiniStatIndicator(
            label: MiniLabel(label: 'sdef - ${sdef.toString()}'),
            maxValue: 250,
            value: sdef,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
          MiniStatIndicator(
            label: MiniLabel(label: 'spd - ${spd.toString()}'),
            value: spd,
            color: color,
            baseWidth: baseWidth! - 10,
          ),
        ],
      ),
    );
  }
}

class MiniLabel extends StatelessWidget {
  const MiniLabel({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
            shadows: textShadow,
            color: Theme.of(context).toggleableActiveColor),
      ),
    );
  }
}

class MiniStatIndicator extends StatelessWidget {
  const MiniStatIndicator({
    Key? key,
    this.value = 0,
    this.maxValue = 200.0,
    required this.color,
    this.baseWidth,
    this.label,
  }) : super(key: key);
  final int value;
  final double maxValue;
  final Color color;
  final double? baseWidth;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final double percentage = value / maxValue;
    return LinearPercentIndicator(
      width: baseWidth,
      animation: true,
      lineHeight: 16.0,
      animationDuration: 1000,
      percent: percentage,
      barRadius: const Radius.circular(20.0),
      backgroundColor: Theme.of(context).indicatorColor,
      progressColor: color,
      center: label,
      padding: EdgeInsets.zero,
    );
  }
}
