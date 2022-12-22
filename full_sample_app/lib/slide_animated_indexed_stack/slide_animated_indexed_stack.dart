import 'package:flutter/material.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class SlideTransitionedIndexedStackScreen extends StatefulWidget {
  const SlideTransitionedIndexedStackScreen({super.key});

  @override
  State<SlideTransitionedIndexedStackScreen> createState() =>
      _SlideTransitionedIndexedStackScreenState();
}

class _SlideTransitionedIndexedStackScreenState
    extends State<SlideTransitionedIndexedStackScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        index: currentIndex,
        itemsLength: indexedStackScreens.length,
        onTap: _showScreenAt,
      ),
      body: SizeFactorIndexedStack(
        beginSizeFactor: 0.0,
        endSizeFactor: 1.0,
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
