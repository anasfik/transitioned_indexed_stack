import 'dart:math';

import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onTap,
    required this.itemsLength,
    required this.index,
  });
  final int itemsLength;
  final int index;
  final void Function(int) onTap;
  final icons = const <Icon>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.add),
    Icon(Icons.favorite),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    final selectColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(
        color: selectColor,
      ),
      selectedItemColor: selectColor,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        itemsLength,
        (index) => BottomNavigationBarItem(
          icon: icons[index],
          label: "Home",
        ),
      ),
      onTap: onTap,
    );
  }
}
