import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(8)),
    );
  }
}
