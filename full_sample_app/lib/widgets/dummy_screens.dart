import 'dart:math';

import 'package:flutter/material.dart';

final List<Widget> indexedStackScreens = List.generate(
  5,
  (index) => Container(
    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    child: Center(
      child: Text(
        'Screen ${index + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
  ),
);
