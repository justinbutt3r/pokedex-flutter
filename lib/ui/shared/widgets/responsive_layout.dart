import 'package:flutter/material.dart';

import '../../../utils/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    // Shown before 640. Is required.
    required this.smallWidget,
    this.mediumWidget,
    required this.largeWidget,
    this.hugeWidget,
  }) : super(key: key);

// Shown before 640. Is required.
  final Widget smallWidget;
  // Shown at 640. Defailts to small
  final Widget? mediumWidget;
  // Shown at 1024. Is required
  final Widget largeWidget;
  //showm at 1440. Defaults to large
  final Widget? hugeWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > extraLarge) {
        return hugeWidget ?? largeWidget;
      } else if (constraints.maxWidth > large) {
        return largeWidget;
      } else if (constraints.maxWidth > medium) {
        return mediumWidget ?? smallWidget;
      } else {
        return smallWidget;
      }
    });
  }
}
