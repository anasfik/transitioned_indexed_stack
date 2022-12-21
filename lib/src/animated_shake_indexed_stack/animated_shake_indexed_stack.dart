import 'dart:math';
import 'package:flutter/material.dart';

class ShakeIndexedStack extends StatefulWidget {
  /// Creates An Indexed Stack with Shake Animation.
  const ShakeIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.shakesCount = 10,
    this.shakeFrequency = 0.04,
  });

  /// The number of shakes that will be performed during the animation duration.
  final int shakesCount;

  /// The begin shake rotation of the animation.
  final double shakeFrequency;

  /// The sizing of the children within the IndexedStack.
  final StackFit sizing;

  /// The alignment of the children within the IndexedStack.
  final AlignmentGeometry alignment;

  /// The text direction of the IndexedStack.
  final TextDirection? textDirection;

  /// THe Children Of The IndexedStack
  final List<Widget> children;

  /// The index of the child to show.
  final int? index;

  /// The animation duration.
  final Duration duration;

  /// The Animation Curve
  final Curve curve;
  @override
  State<ShakeIndexedStack> createState() => ShakeIndexedStackState();
}

class ShakeIndexedStackState extends State<ShakeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;
  late Animation<double> rotate;
  int index = 0;
  bool isEnd = false;

  Animation<double> _createScaleTween() {
    return Tween<double>(
      begin: 1 - widget.shakeFrequency,
      end: 1 + widget.shakeFrequency,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  Animation<double> _createRotationTween() {
    return Tween<double>(
      begin: pi * 2 * (1 - widget.shakeFrequency),
      end: pi * 2 * (1 + widget.shakeFrequency),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  void initState() {
    _controller = _createAnimationController();
    scale = _createScaleTween();
    rotate = _createRotationTween();
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShakeIndexedStack oldWidget) {
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;
    final didFrequencyChanged =
        oldWidget.shakeFrequency != widget.shakeFrequency;
    if (didCurveChanged || didIndexChanged || didFrequencyChanged) {
      isEnd = false;
      index = 0;
      scale = _createScaleTween();
      rotate = _createRotationTween();
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  AnimationController _createAnimationController() {
    final controller = AnimationController(
      vsync: this,
      duration: widget.duration ~/ widget.shakesCount,
    );
    controller.addListener(
      () {
        if (index <= widget.shakesCount - 1) {
          if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          }
          if (controller.status == AnimationStatus.dismissed) {
            controller.forward();
          }
          index++;
        } else {
          setState(() {
            isEnd = true;
          });
        }
      },
    );

    return controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: isEnd ? pi * 2 : rotate.value,
          child: Transform.scale(
            scale: isEnd ? 1 : scale.value,
            // scale: Random().nextBool() ? scale.value : 1 / scale.value,
            child: IndexedStack(
              index: widget.index,
              textDirection: widget.textDirection,
              sizing: widget.sizing,
              alignment: widget.alignment,
              children: widget.children,
            ),
          ),
        );
      },
    );
  }
}
