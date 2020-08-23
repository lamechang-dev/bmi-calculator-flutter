import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 180;
  int weight = 80;
  int age = 20;

  void updateColor(Gender gender) {
    maleCardColor = gender == Gender.male ? kActiveCardColor : kInactiveCardColor;
    femaleCardColor = gender == Gender.female ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    colour: maleCardColor,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        label: "MALE",
                        labelTextStyle: kLabelTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    colour: femaleCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      labelTextStyle: kLabelTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle
                    ),
                    Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      divisions: 100,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      activeColor: kSliderBarActiveColor,
                      inactiveColor: kSliderBarInactiveColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    )
                  ],

                )
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              calculator: (){
                                setState(() {
                                  if(weight < 100) {
                                    weight++;
                                  }
                                });
                              },
                              icon: Icons.add,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            RoundIconButton(
                              calculator: (){
                                setState(() {
                                  if(weight > 20) {
                                    weight--;
                                  }
                                });
                              },
                              icon: Icons.remove,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'AGE',
                            style: kLabelTextStyle
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              calculator: (){
                                setState(() {
                                  if(age < 100) {
                                    age++;
                                  }
                                });
                              },
                              icon: Icons.add,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            RoundIconButton(
                              calculator: (){
                                setState(() {
                                  if(age > 18) {
                                    age--;
                                  }
                                });
                              },
                              icon: Icons.remove,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.calculator});

  final IconData icon;
  final Function calculator;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: calculator,
      backgroundColor: Color(0xFF4c4f5b),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
