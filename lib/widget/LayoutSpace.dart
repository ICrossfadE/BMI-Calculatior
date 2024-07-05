import 'package:flutter/material.dart';

class LayoutSpace extends StatelessWidget {
  final Color selectColor;
  final Widget? cardChild;
  final VoidCallback? onPress;

  const LayoutSpace(
      {super.key, required this.selectColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: selectColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
