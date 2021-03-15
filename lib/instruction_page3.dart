import 'package:flutter/material.dart';
import 'instruction_page4.dart';

class InstructionPage3 extends StatefulWidget {
  InstructionPage3({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
  });
  final double timeMax;
  final String subjectId;
  final int totalTrials;

  @override
  _InstructionPage3State createState() => _InstructionPage3State(
      timeMax: timeMax, subjectId: subjectId, totalTrials: totalTrials);
}

class _InstructionPage3State extends State<InstructionPage3> {
  _InstructionPage3State({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
  });
  double timeMax;
  String subjectId;
  int totalTrials;
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
                'Each trial begins with a 3 second countdown.',
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
                'You have ten seconds to complete the trial.',
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
                'A timer bar will appear on the side of the screen to indicate the time left. It turns green when the car approaches the stop sign.',
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
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstructionPage4(
                          timeMax: timeMax,
                          totalTrials: totalTrials,
                          subjectId: subjectId,
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
