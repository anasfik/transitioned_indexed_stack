import 'dart:math';

import 'package:flutter/material.dart';

class FlipIndexedStack extends StatefulWidget {
  /// Creates An Indexed Stack with Flip Animation.
  const FlipIndexedStack({
    super.key,
    this.flipHorizontally = true,
    this.flipVertically = true,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
  }) : assert(flipHorizontally || flipVertically,
            "There is no point in flipping nothing using this widget, If you don't want to flip anything, use the IndexedStack widget instead.");

  const FlipIndexedStack.horizontally({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
  })  : flipVertically = false,
        flipHorizontally = true;

  const FlipIndexedStack.vertically({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
  })  : flipVertically = true,
        flipHorizontally = false;

  /// the sizing of the children within the IndexedStack.
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

  /// This will flip the stack vertically
  final bool flipVertically;

  /// This will flip the stack horizontally
  final bool flipHorizontally;

  @override
  State<FlipIndexedStack> createState() => FlipIndexedStackState();
}

class FlipIndexedStackState extends State<FlipIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Tween<double> _tween;
  @override
  void initState() {
    _controller = _createAnimationController();
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlipIndexedStack oldWidget) {
    final didIndexChanged = oldWidget.index != widget.index;
    if (didIndexChanged) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  AnimationController _createAnimationController() {
    return AnimationController(
      vsync: this,
      duration: widget.duration,
    );
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
          final screenSize = MediaQuery.of(context).size;

          final rotationX = widget.flipVertically
              ? Matrix4.rotationX(pi * 2 * _controller.value)
              : Matrix4.identity();
          final rotationY = widget.flipHorizontally
              ? Matrix4.rotationY(pi * 2 * _controller.value)
              : Matrix4.identity();

          return Transform(
            transform: rotationX + rotationY,
            origin: Offset(screenSize.width / 2, screenSize.height / 2),
            child: IndexedStack(
              index: widget.index,
              textDirection: widget.textDirection,
              sizing: widget.sizing,
              alignment: widget.alignment,
              children: widget.children,
            ),
          );
        });
  }
}
