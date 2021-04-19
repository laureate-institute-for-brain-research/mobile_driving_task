import 'package:flutter/material.dart';
import 'instruction_page3.dart';

class InstructionPage2 extends StatefulWidget {
  InstructionPage2({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
    this.iceGain,
  });
  final double timeMax;
  final String subjectId;
  final int totalTrials;
  final double iceGain;

  @override
  _InstructionPage2State createState() => _InstructionPage2State(
      timeMax: timeMax,
      subjectId: subjectId,
      totalTrials: totalTrials,
      iceGain: iceGain);
}

class _InstructionPage2State extends State<InstructionPage2> {
  _InstructionPage2State({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
    this.iceGain,
  });
  double timeMax;
  String subjectId;
  int totalTrials;
  double iceGain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'In this task you will control a vehicle by sliding your thumb on the screen.',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'You can move your thumb forward and backward on the white dot to control the speed of the car',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  child: Text('BACK'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                  child: Text('NEXT'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstructionPage3(
                          timeMax: timeMax,
                          totalTrials: totalTrials,
                          subjectId: subjectId,
                          iceGain: iceGain,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
