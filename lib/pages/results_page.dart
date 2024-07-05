import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widget/LayoutSpace.dart';
import 'package:bmi_calculator/widget/MainButton.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmi,
    required this.textResult,
    required this.intepretation,
  });

  final String bmi;
  final String textResult;
  final String intepretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Your Result',
                style: kTextStyle,
              ),
            ),
            Expanded(
              child: LayoutSpace(
                selectColor: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(textResult, style: kStatysText),
                    Text(bmi, style: kIntStatys),
                    Text(
                      intepretation,
                      textAlign: TextAlign.center,
                      style: kMessageStatys,
                    ),
                  ],
                ),
              ),
            ),
            MainButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              textButton: 'RECALCULATE',
              heightButton: 80.0,
              marginButton: 15.0,
              shapeButton: 10.0,
            ),
          ],
        ));
  }
}
