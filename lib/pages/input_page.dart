import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/card_icon.dart';
import '../constants.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  int height = 180;
  int weight = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          gender = Gender.male;
                        }),
                        child: ReusableCard(
                            color: gender == Gender.male
                                ? kActiveCardColor
                                : kInactiveCardColor,
                            child: CardIcon(
                                icon: FontAwesomeIcons.mars, text: 'MALE')),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => setState(() {
                        gender = Gender.female;
                      }),
                      child: ReusableCard(
                          color: gender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: CardIcon(
                              icon: FontAwesomeIcons.venus, text: 'FEMALE')),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kBoldTextStyle),
                          Text('cm', style: kLabelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 32),
                            thumbColor: Color(0xFFeB1555),
                            overlayColor: Color(0xFFeB1555).withAlpha(0x29)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (value) =>
                              setState(() => height = value.toInt()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        color: kActiveCardColor,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kBoldTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () =>
                                            setState(() => weight -= 1)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () =>
                                            setState(() => weight += 1)),
                                  ])
                            ])),
                  ),
                  Expanded(
                    child: ReusableCard(
                        color: kActiveCardColor,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kBoldTextStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () =>
                                            setState(() => age -= 1)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () =>
                                            setState(() => age += 1)),
                                  ])
                            ])),
                  )
                ],
              )),
              BottomButton(
                  onPressed: () {
                    CalculatorBrain calculator =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.pushNamed(context, '/result',
                        arguments: ResultsArguments(
                            bmiResult: calculator.calculateBMI(),
                            resultText: calculator.getResult(),
                            interpretation: calculator.getInterpretation()));
                  },
                  title: 'CALCULATE'),
            ]));
  }
}
