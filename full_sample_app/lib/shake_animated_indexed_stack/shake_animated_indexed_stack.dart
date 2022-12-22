import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class ShakeTransitionedIndexedStackScreen extends StatefulWidget {
  const ShakeTransitionedIndexedStackScreen({super.key});

  @override
  State<ShakeTransitionedIndexedStackScreen> createState() =>
      _ShakeTransitionedIndexedStackScreenState();
}

class _ShakeTransitionedIndexedStackScreenState
    extends State<ShakeTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: ShakeIndexedStack(
        shakesCount: 10,
        shakeFrequency: 0.04,
        duration: const Duration(milliseconds: 50),
        curve: Curves.slowMiddle,
        index: currentIndex,
        children: indexedStackScreens,
      ),
    );
  }

  void _showScreenAt(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
