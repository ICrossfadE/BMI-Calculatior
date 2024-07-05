import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/widget/MainButton.dart';
import 'package:bmi_calculator/widget/RoundIconButtom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/GenderCard.dart';
import '../widget/LayoutSpace.dart';

import '../constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kUnactiveColor;
  Color femaleCardColor = kUnactiveColor;
  int height = 180;
  int weight = 60;
  int age = 16;

  void updateColor(GenderType gender) {
    setState(() {
      maleCardColor = gender == GenderType.male ? kActiveColor : kUnactiveColor;
      femaleCardColor =
          gender == GenderType.female ? kActiveColor : kUnactiveColor;
    });
  }

  void updateHeight(double newHeight) {
    setState(() {
      height = newHeight.round();
    });
  }

  void updateStats(bool pressOperator, String type) {
    setState(() {
      if (type == 'weight') {
        pressOperator ? weight++ : weight--;
      } else if (type == 'age') {
        pressOperator ? age++ : age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Calculator calc = Calculator(
      age: age,
      height: height,
      weight: weight,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LayoutSpace(
                    onPress: () {
                      updateColor(GenderType.male);
                    },
                    selectColor: maleCardColor,
                    cardChild: const GenderCard(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutSpace(
                    onPress: () {
                      updateColor(GenderType.female);
                    },
                    selectColor: femaleCardColor,
                    cardChild: const GenderCard(
                      gender: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutSpace(
              selectColor: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLableTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyle,
                      ),
                      const Text('cm', style: kLableTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      activeColor: kColorAccent,
                      inactiveColor: kUnactiveColor,
                      onChanged: updateHeight,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: LayoutSpace(
                  selectColor: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('WEIGHT', style: kLableTextStyle),
                      Text(
                        weight.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButtom(
                            onPress: () => updateStats(false, 'weight'),
                            icon: const Icon(
                              Icons.remove,
                              size: 35,
                            ),
                          ),
                          RoundIconButtom(
                            onPress: () => updateStats(true, 'weight'),
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: LayoutSpace(
                    selectColor: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLableTextStyle),
                        Text(
                          age.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButtom(
                              onPress: () => updateStats(false, 'age'),
                              icon: const Icon(
                                Icons.remove,
                                size: 35,
                              ),
                            ),
                            RoundIconButtom(
                              onPress: () => updateStats(true, 'age'),
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: MainButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmi: calc.calculateBMI(),
                        textResult: calc.getResult(),
                        intepretation: calc.getIntepretation(),
                      );
                    },
                  ),
                );
              },
              textButton: 'CALCULATE YOUR BM',
              heightButton: 80.0,
              marginButton: 15.0,
              shapeButton: 10.0,
            ),
          )
        ],
      ),
    );
  }
}

// Container(
//               height: 80,
//               margin: const EdgeInsets.all(15.0),
//               decoration: BoxDecoration(
//                 color: kColorAccent,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Center(
//                 child: Text('CALCULATE YOUR BMI', style: kLargeButton),
//               ),
//             ),