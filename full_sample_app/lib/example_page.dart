import 'package:animated_indexed_stack_example/helper.dart';
import 'package:animated_indexed_stack_example/shake_animated_indexed_stack/shake_animated_indexed_stack.dart';
import 'package:flutter/material.dart';

import 'diagonal_animated_indexed_stack/diagonal_animated_indexed_stack.dart';
import 'fade_animated_indexed_stack/fade_animated_indexed_stack.dart';
import 'rotation_animated_indexed_stack/rotation_animated_indexed_stack.dart';
import 'scale_animated_indexed_stack/scale_animated_indexed_stack.dart';
import 'size_factor_animated_indexed_stack/size_factor_animated_indexed_stack.dart';
import 'slide_animated_indexed_stack/slide_animated_indexed_stack.dart';
import 'widgets/custom_drawer.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final List<Widget> screensExample = <Widget>[
    const FadeTransitionedIndexedStackScreen(),
    const ScaleTransitionedIndexedStackScreen(),
    const SlideTransitionedIndexedStackScreen(),
    const SizeFactorTransitionedIndexedStackScreen(),
    const RotationTransitionedIndexedStackScreen(),
    const DiagonalTransitionedIndexedStackScreen(),
    const ShakeTransitionedIndexedStackScreen(),
  ];
  late Widget currentScreen = screensExample.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentScreen.runtimeType.toProperName()),
      ),
      drawer: CustomDrawer(
        onElementTap: (index) {
          setState(() {
            currentScreen = screensExample[index];
          });
        },
        screensOptions: screensExample,
      ),
      body: currentScreen,
    );
  }
}
