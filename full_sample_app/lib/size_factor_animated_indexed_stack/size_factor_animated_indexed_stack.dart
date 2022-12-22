import 'package:flutter/material.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/dummy_screens.dart';

class SizeFactorTransitionedIndexedStackScreen extends StatefulWidget {
  const SizeFactorTransitionedIndexedStackScreen({super.key});

  @override
  State<SizeFactorTransitionedIndexedStackScreen> createState() =>
      _SizeFactorTransitionedIndexedStackScreenState();
}

class _SizeFactorTransitionedIndexedStackScreenState
    extends State<SizeFactorTransitionedIndexedStackScreen> {
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
        axis: currentIndex % 2 == 0 ? Axis.horizontal : Axis.vertical,
        curve: Curves.easeInOut,
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
