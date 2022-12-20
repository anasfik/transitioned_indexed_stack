import 'package:animated_indexed_stack/animated_indexed_stack.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class DiagonalIndexedStack extends SlideIndexedStack {
  const DiagonalIndexedStack({
    super.key,
    super.alignment,
    super.index,
    super.children,
    super.duration,
    super.curve,
    super.textDirection,
    super.sizing,
  }) : super(
          beginSlideOffset: const Offset(-1, -1),
          endSlideOffset: const Offset(0, 0),
        );

  const DiagonalIndexedStack.topLeft({
    super.key,
    super.alignment,
    super.index,
    super.children,
    super.duration,
    super.curve,
    super.textDirection,
    super.sizing,
  }) : super(
          beginSlideOffset: const Offset(-1, -1),
          endSlideOffset: const Offset(0, 0),
        );

  const DiagonalIndexedStack.bottomLeft({
    super.key,
    super.alignment,
    super.index,
    super.children,
    super.duration,
    super.curve,
    super.textDirection,
    super.sizing,
  }) : super(
          beginSlideOffset: const Offset(-1, 1),
          endSlideOffset: const Offset(0, 0),
        );
  const DiagonalIndexedStack.topRight({
    super.key,
    super.alignment,
    super.index,
    super.children,
    super.duration,
    super.curve,
    super.textDirection,
    super.sizing,
  }) : super(
          beginSlideOffset: const Offset(1, -1),
          endSlideOffset: const Offset(0, 0),
        );
  const DiagonalIndexedStack.bottomRight({
    super.key,
    super.alignment,
    super.index,
    super.children,
    super.duration,
    super.curve,
    super.textDirection,
    super.sizing,
  }) : super(
          beginSlideOffset: const Offset(1, 1),
          endSlideOffset: const Offset(0, 0),
        );
}
