import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

typedef IntCallback = void Function(int);

class RoundIconButtom extends StatelessWidget {
  const RoundIconButtom({super.key, required this.icon, required this.onPress});

  final Icon icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      child: icon,
    );
  }
}
