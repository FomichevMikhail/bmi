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
          'РЕЗУЛЬТАТЫ РАСЧЕТА',
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
                  'ВАШ BMI',
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
                  height: 70,
                  color: kBottomContainerColour,
                  child: Center(
                      child: Text(
                    'ПЕРЕСЧИТАТЬ',
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
