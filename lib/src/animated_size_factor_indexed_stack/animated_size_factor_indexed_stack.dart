import 'package:flutter/material.dart';

class SizeFactorIndexedStack extends StatefulWidget {
  const SizeFactorIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.beginSizeFactor = 0,
    this.endSizeFactor = 1,
    this.curve = Curves.easeInOut,
    this.axis = Axis.vertical,
    this.axisAlignment = 0,
  });

  final Axis axis;
  final double axisAlignment;

  final List<Widget> children;
  final StackFit sizing;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final int? index;
  final Duration duration;
  final double beginSizeFactor;
  final double endSizeFactor;
  final Curve curve;
  @override
  State<SizeFactorIndexedStack> createState() => SizeFactorIndexedStackState();
}

class SizeFactorIndexedStackState extends State<SizeFactorIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;
  @override
  void initState() {
    _controller = _createAnimationController();
    _tween = _createTween();
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SizeFactorIndexedStack oldWidget) {
    // final didDurationChanged = oldWidget.duration != widget.duration;
    // if (didDurationChanged) {}

    final didBeginSizeFactorChanged =
        oldWidget.beginSizeFactor != widget.beginSizeFactor;
    final didEndSizeFactorChanged =
        oldWidget.endSizeFactor != widget.endSizeFactor;
    final didOpacityChanged =
        didEndSizeFactorChanged || didBeginSizeFactorChanged;
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;
    final didSizeFactorChanged =
        oldWidget.beginSizeFactor != widget.beginSizeFactor ||
            oldWidget.endSizeFactor != widget.endSizeFactor;
    final didAxisChanged = oldWidget.axis != widget.axis;
    if (didOpacityChanged ||
        didCurveChanged ||
        didIndexChanged ||
        didAxisChanged ||
        didSizeFactorChanged) {
      _tween = _createTween();
      _controller.reset();
      _controller.forward();

      super.didUpdateWidget(oldWidget);
    }
  }

  Tween<double> _createTween() {
    final tween =
        Tween<double>(begin: widget.beginSizeFactor, end: widget.endSizeFactor);
    tween.chain(
      CurveTween(curve: widget.curve),
    );

    return tween;
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
    return SizeTransition(
      axis: widget.axis,
      axisAlignment: widget.axisAlignment,
      sizeFactor: _controller.drive(_tween),
      child: IndexedStack(
        index: widget.index,
        textDirection: widget.textDirection,
        sizing: widget.sizing,
        alignment: widget.alignment,
        children: widget.children,
      ),
    );
  }
}
