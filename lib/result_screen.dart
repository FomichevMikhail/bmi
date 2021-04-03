import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi});

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: Text(
          'CALC RESULTS',
          style: kBodyTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  'YOUR BMI IS',
                  style: kResultTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 80,
                  color: kBottomContainerColour,
                  child: Center(
                      child: Text(
                    'RECALCULATE',
                    style: kLabelTextStyle,
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
