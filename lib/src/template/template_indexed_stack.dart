import 'package:flutter/material.dart';

class TemplateIndexedStack extends StatefulWidget {
  const TemplateIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = const Duration(milliseconds: 250),
  });

  final List<Widget> children;
  final StackFit sizing;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final int? index;
  final Duration duration;

  @override
  State<TemplateIndexedStack> createState() => TemplateIndexedStackState();
}

class TemplateIndexedStackState extends State<TemplateIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant TemplateIndexedStack oldWidget) {
    final didIndexChanged = oldWidget.index != widget.index;
    final didDurationChanged = oldWidget.duration != widget.duration;

    if (didIndexChanged || didDurationChanged) {
      _controller.reset();
      _controller.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      alignment: widget.alignment,
      children: widget.children,
    );
  }
}
