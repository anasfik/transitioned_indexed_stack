import 'package:animated_indexed_stack/animated_indexed_stack.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class DiagonalIndexedStack extends SlideIndexedStack {
  /// Cannot be used directly.
  const DiagonalIndexedStack._();

  /// Creates An Indexed Stack with Diagonal Slide Animation from the top left.
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

  /// Creates An Indexed Stack with Diagonal Slide Animation from the bottom left.
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

  /// Creates An Indexed Stack with Diagonal Slide Animation from the top right.
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

  /// Creates An Indexed Stack with Diagonal Slide Animation from the bottom right.
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
