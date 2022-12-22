import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class FadeTransitionedIndexedStackScreen extends StatefulWidget {
  const FadeTransitionedIndexedStackScreen({super.key});

  @override
  State<FadeTransitionedIndexedStackScreen> createState() =>
      _FadeTransitionedIndexedStackScreenState();
}

class _FadeTransitionedIndexedStackScreenState
    extends State<FadeTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: FadeIndexedStack(
        beginOpacity: 0.0,
        endOpacity: 1.0,
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
