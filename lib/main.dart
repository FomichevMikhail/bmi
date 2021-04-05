import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  var age = 1;
  var height = 130;
  var weight = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBG,
        appBar: AppBar(
          backgroundColor: kBG,
          title: Text(
            'РАСЧЕТ BMI (индекс массы тела)',
            style: kBodyTextStyle,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color: gender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 70,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'МУЖЧИНА',
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 70,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ЖЕНЩИНА',
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'РОСТ, см',
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Slider(
                      min: 130,
                      max: 220,
                      activeColor: kBottomContainerColour,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      })
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'ВЕС, кг',
                          style: kBodyTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'ВОЗРАСТ',
                          style: kBodyTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                final height2 = height / 100;

                final res = weight / (height2 * height2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: res.round().toString(),
                          )),
                );
              },
              child: Container(
                height: 80,
                color: kBottomContainerColour,
                child: Center(
                    child: Text(
                  'РАССЧИТАТЬ МОЙ BMI',
                  style: kLabelTextStyle,
                )),
              ),
            ),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  const ReusableCard({
    Key key,
    this.color = kInactiveCardColour,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
