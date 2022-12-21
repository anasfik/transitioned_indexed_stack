import 'package:flutter/material.dart';

class RotationIndexedStack extends StatefulWidget {
  /// Creates An Indexed Stack with Rotation Animation.
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

  /// The Initial Rotation Turn Animation Value.
  final double beginTurn;

  /// The End Rotation Turn Animation Value.
  final double endTurn;

  /// The Animation Curve
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
