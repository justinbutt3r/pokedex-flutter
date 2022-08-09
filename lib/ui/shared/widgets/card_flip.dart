import 'dart:math';

import 'package:flutter/material.dart';

class CardFlip extends StatefulWidget {
  const CardFlip({Key? key, required this.front, required this.back})
      : super(key: key);

  final Widget front;
  final Widget back;

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.addStatusListener(_updateStatus);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        flip();
      },
      child: AnimatedPageFlipBuilder(
        animation: _controller,
        showFrontSide: _showFrontSide,
        front: widget.front,
        back: widget.back,
      ),
    );
  }
}

class AnimatedPageFlipBuilder extends StatelessWidget {
  const AnimatedPageFlipBuilder(
      {Key? key,
      required this.animation,
      required this.showFrontSide,
      required this.front,
      required this.back})
      : super(key: key);
  final Animation<double> animation;
  final bool showFrontSide; // we'll see how to use this later
  final Widget front;
  final Widget back;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        // this boolean tells us if we're on the first or second half of the animation
        final isAnimationFirstHalf = animation.value.abs() < 0.5;
        // decide which page we need to show
        final child = isAnimationFirstHalf ? front : back;
        // map values between [0, 1] to values between [0, pi]
        final rotationValue = animation.value * pi;
        // calculate the correct rotation angle depening on which page we need to show
        final rotationAngle =
            animation.value > 0.5 ? pi - rotationValue : rotationValue;
        // calculate tilt
        var tilt = (animation.value - 0.5).abs() - 0.5;
        // make this a small value (positive or negative as needed)
        tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
        return Transform(
          transform: Matrix4.rotationY(rotationAngle)
            // apply tilt value
            ..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
