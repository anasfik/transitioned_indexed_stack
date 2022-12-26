import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class FlipTransitionedIndexedStackScreen extends StatefulWidget {
  const FlipTransitionedIndexedStackScreen({super.key});

  @override
  State<FlipTransitionedIndexedStackScreen> createState() =>
      _FlipTransitionedIndexedStackScreenState();
}

class _FlipTransitionedIndexedStackScreenState
    extends State<FlipTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: FlipIndexedStack.vertically(
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
