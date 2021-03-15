import 'package:flutter/material.dart';
//import 'subj_id.dart';
import 'continue_trial.dart';
import 'package:uuid/uuid.dart';

class InstructionPage7 extends StatefulWidget {
  InstructionPage7({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
  });
  final double timeMax;
  final String subjectId;
  final int totalTrials;

  @override
  _InstructionPage7State createState() => _InstructionPage7State(
      timeMax: timeMax, subjectId: subjectId, totalTrials: totalTrials);
}

class _InstructionPage7State extends State<InstructionPage7> {
  _InstructionPage7State({
    @required this.timeMax,
    @required this.subjectId,
    @required this.totalTrials,
  });
  double timeMax;
  String subjectId;
  int totalTrials;

  var uuid = Uuid();
  int trialNumber = 0;
  int blockNumber = 1;
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
                'Please let the experimenter know if unclear of the task or have any additional questions.',
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
                'Click next when you are ready to begin.',
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
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectIDPage(),
                      ),
                    );*/
                    double lpc = MediaQuery.of(context).size.height;
                    String newId = uuid.v1();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContinuationPage(
                          subjectId: subjectId,
                          uuid: newId,
                          trialNumber: trialNumber,
                          blockNumber: blockNumber,
                          lpc: lpc,
                          totalTrials: totalTrials,
                          timeMax: timeMax,
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
