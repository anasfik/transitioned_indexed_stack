import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class ScaleTransitionedIndexedStackScreen extends StatefulWidget {
  const ScaleTransitionedIndexedStackScreen({super.key});

  @override
  State<ScaleTransitionedIndexedStackScreen> createState() =>
      _ScaleTransitionedIndexedStackScreenState();
}

class _ScaleTransitionedIndexedStackScreenState
    extends State<ScaleTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: ScaleIndexedStack(
        beginScale: 0.0,
        endScale: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
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
