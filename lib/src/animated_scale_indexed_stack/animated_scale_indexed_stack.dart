import 'package:flutter/material.dart';

class ScaleIndexedStack extends StatefulWidget {
  const ScaleIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.beginScale = 0,
    this.endScale = 1,
    this.curve = Curves.easeInOut,
  });

  final List<Widget> children;
  final StackFit sizing;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final int? index;
  final Duration duration;
  final double beginScale;
  final double endScale;
  final Curve curve;
  @override
  State<ScaleIndexedStack> createState() => ScaleIndexedStackState();
}

class ScaleIndexedStackState extends State<ScaleIndexedStack>
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
  void didUpdateWidget(covariant ScaleIndexedStack oldWidget) {
    final didBeginOpacityChanged = oldWidget.beginScale != widget.beginScale;
    final didEndOpacityChanged = oldWidget.endScale != widget.endScale;
    final didOpacityChanged = didEndOpacityChanged || didBeginOpacityChanged;
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;

    if (didOpacityChanged || didCurveChanged || didIndexChanged) {
      _tween = _createTween();
      _controller.reset();
      _controller.forward();

      super.didUpdateWidget(oldWidget);
    }
  }

  Tween<double> _createTween() {
    final tween = Tween<double>(begin: widget.beginScale, end: widget.endScale);
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
    return ScaleTransition(
      scale: _controller.drive(_tween),
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
