import 'package:flutter/material.dart';

class SlideIndexedStack extends StatefulWidget {
  const SlideIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.beginSlideOffset = const Offset(0, -1),
    this.endSlideOffset = const Offset(0, 0),
    this.curve = Curves.easeInOut,
  });

  const SlideIndexedStack.up({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
  })  : beginSlideOffset = const Offset(0, 1),
        endSlideOffset = const Offset(0, 0);

  const SlideIndexedStack.down({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
  })  : beginSlideOffset = const Offset(0, -1),
        endSlideOffset = const Offset(0, 0);
  const SlideIndexedStack.right({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
  })  : beginSlideOffset = const Offset(0, 0),
        endSlideOffset = const Offset(1, 0);

  const SlideIndexedStack.left({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
  })  : beginSlideOffset = const Offset(0, 0),
        endSlideOffset = const Offset(-1, 0);

  final List<Widget> children;
  final StackFit sizing;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final int? index;
  final Duration duration;
  final Offset beginSlideOffset;
  final Offset endSlideOffset;
  final Curve curve;
  @override
  State<SlideIndexedStack> createState() => SlideIndexedStackState();
}

class SlideIndexedStackState extends State<SlideIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Offset> _tween;
  @override
  void initState() {
    _controller = _createAnimationController();
    _tween = _createTween();
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideIndexedStack oldWidget) {
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;

    if (didCurveChanged || didIndexChanged) {
      _tween = _createTween();
      _controller.reset();
      _controller.forward();

      super.didUpdateWidget(oldWidget);
    }
  }

  Tween<Offset> _createTween() {
    Tween<Offset> tween = Tween<Offset>(
      begin: widget.beginSlideOffset,
      end: widget.endSlideOffset,
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
    return SlideTransition(
      position: _controller.drive(_tween),
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
