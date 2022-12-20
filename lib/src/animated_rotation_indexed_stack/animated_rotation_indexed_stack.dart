import 'package:flutter/material.dart';

class RotationIndexedStack extends StatefulWidget {
  const RotationIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.beginTurn = 0.0,
    this.endTurn = 1.0,
    this.curve = Curves.easeInOut,
  });

  final List<Widget> children;
  final StackFit sizing;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final int? index;
  final Duration duration;
  final double beginTurn;
  final double endTurn;
  final Curve curve;
  @override
  State<RotationIndexedStack> createState() => RotationIndexedStackState();
}

class RotationIndexedStackState extends State<RotationIndexedStack>
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
  void didUpdateWidget(covariant RotationIndexedStack oldWidget) {
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;

    if (didCurveChanged || didIndexChanged) {
      _tween = _createTween();
      _controller.reset();
      _controller.forward();

      super.didUpdateWidget(oldWidget);
    }
  }

  Tween<double> _createTween() {
    Tween<double> tween = Tween<double>(
      begin: widget.beginTurn,
      end: widget.endTurn,
    );
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
    return RotationTransition(
      turns: _controller.drive(_tween),
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
