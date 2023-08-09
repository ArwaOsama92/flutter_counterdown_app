import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterDownApp(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSeconds = 4;
   Timer? repeatedFunction ;

  startTimer() {
  repeatedFunction =   Timer.periodic((Duration(seconds: 1)), (timer) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          numberOfSeconds = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 44, 43),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
          (numberOfSeconds>0)  ?  numberOfSeconds.toString().padLeft(2, "0")  :  "Good Job",
            style: (numberOfSeconds>0 )?   TextStyle(fontSize: 80, color: Colors.white) : TextStyle(fontSize: 40, color: Colors.yellow)
            ),
            SizedBox(height: 33),
            Text(
              "sconds",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
             SizedBox(height: 33),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                    if(numberOfSeconds == 0){
                      setState(() {
                        numberOfSeconds = 4;
                      });
                    }
                  },
                  child: Text(
                    "Start Timer",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                ),
                SizedBox(width: 22),


                ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                  },
                  child: Text(
                    "Stop Timer",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
