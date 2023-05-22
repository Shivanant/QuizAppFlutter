import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:alert/alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> corans = [];
int quescnt = 0;

class _MyAppState extends State<MyApp> {
  void checkans(bool ans) {
    if (quizBrain.isfinished() == true) {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: Center(
                  child: Text("Quiz ended"),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        quizBrain.setStart();
                        corans = [];
                        Navigator.pop(context);
                      },
                      child: Text('ok'))
                ],
              ),
            );
          });
    } else {
      if (quizBrain.getAns() == ans) {
        corans.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        corans.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      setState(() {
        quizBrain.nextques();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQues(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    onPressed: () {
                      checkans(true);
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        width: 250,
                        height: 70,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "True",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    onPressed: () {
                      checkans(false);
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        width: 250,
                        height: 70,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "False",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(children: corans)
            ],
          ),
        ),
      ),
    );
  }
}
