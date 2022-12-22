import 'package:animated_indexed_stack_example/helper.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.screensOptions,
    required this.onElementTap,
  });

  final List<Widget> screensOptions;

  final void Function(int) onElementTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            screensOptions.length,
            (index) {
              final current = screensOptions[index];
              return Container(
                width: double.infinity,
                height: 60,
                child: InkWell(
                  onTap: () {
                    onElementTap(index);
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        current.runtimeType.toProperName(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
