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
  var age = 20;
  var height = 160;
  var weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBG,
        appBar: AppBar(
          backgroundColor: kBG,
          centerTitle: true,
          title: Text(
            'BMI (индекс массы тела)',
            style: kBodyTextStyleBlue,
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
                    // color: gender == Gender.male
                    //     ? kBottomContainerColour
                    //     : kInactiveCardColour,
                    border: gender == Gender.male ? true : false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 70,
                          // color: gender == Gender.male ? kTextDark : kPictoRed,
                          color: kPictoRed,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'МУЖЧИНА',
                          // style: gender == Gender.male
                          //     ? kBodyTextStyleDark
                          //     : kBodyTextStyleBlue,
                          style: kBodyTextStyleBlue,
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
                    // color: gender == Gender.female
                    //     ? kBottomContainerColour
                    //     : kInactiveCardColour,
                    border: gender == Gender.female ? true : false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 70,
                          color:
                              // gender == Gender.female ? kTextDark : kPictoRed,
                              kPictoRed,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ЖЕНЩИНА',
                          // style: gender == Gender.female
                          //     ? kBodyTextStyleDark
                          //     : kBodyTextStyleBlue,
                          style: kBodyTextStyleBlue,
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
                    style: kBodyTextStyleGrey,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    height.toString(),
                    style: kNumberTextStyleBlue,
                    textAlign: TextAlign.center,
                  ),
                  Slider(
                      min: 130,
                      max: 220,
                      activeColor: kBottomContainerColour,
                      inactiveColor: kBG,
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
                          style: kBodyTextStyleGrey,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyleBlue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              style: TextButton.styleFrom(
                                primary: kTextDark,
                                backgroundColor: kButtonColour,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(13),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              style: TextButton.styleFrom(
                                primary: kTextDark,
                                backgroundColor: kButtonColour,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(13),
                              ),
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
                          style: kBodyTextStyleGrey,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyleBlue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              style: TextButton.styleFrom(
                                primary: kTextDark,
                                backgroundColor: kButtonColour,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(13),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              style: TextButton.styleFrom(
                                primary: kTextDark,
                                backgroundColor: kButtonColour,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(13),
                              ),
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
                  style: kLabelTextStyleDark,
                )),
              ),
            ),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final bool border;
  final Widget child;
  final Function onTap;

  const ReusableCard({
    Key key,
    this.color = kInactiveCardColour,
    this.border = false,
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
            color: color,
            border: border == true
                ? Border.all(
                    color: kBottomContainerColour,
                    width: 1,
                  )
                : Border(),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
