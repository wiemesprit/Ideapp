import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  final String tabName;
  TabText(this.tabName);
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(tabName),
    );
  }
}
