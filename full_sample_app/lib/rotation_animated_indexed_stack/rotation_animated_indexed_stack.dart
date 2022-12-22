import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class RotationTransitionedIndexedStackScreen extends StatefulWidget {
  const RotationTransitionedIndexedStackScreen({super.key});

  @override
  State<RotationTransitionedIndexedStackScreen> createState() =>
      _RotationTransitionedIndexedStackScreenState();
}

class _RotationTransitionedIndexedStackScreenState
    extends State<RotationTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: RotationIndexedStack(
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
