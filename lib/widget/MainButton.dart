import 'package:flutter/material.dart';

import '../constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    required this.textButton,
    required this.heightButton,
    required this.marginButton,
    required this.shapeButton,
  });

  final VoidCallback onTap;
  final String textButton;
  final double heightButton;
  final double marginButton;
  final double shapeButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightButton,
        margin: EdgeInsets.all(marginButton),
        decoration: BoxDecoration(
          color: kColorAccent,
          borderRadius: BorderRadius.circular(shapeButton),
        ),
        child: Center(
          child: Text(textButton, style: kLargeButton),
        ),
      ),
    );
  }
}

//  const MainButton(
//                 textButton: 'RECALCULATE',
//                 heightButton: 80.0,
//                 marginButton: 15.0,
//                 shapeButton: 10.0,
//               ),
//             )