import 'package:flutter/material.dart';

void main() {
  runApp(BasketballPointsCounterApp());
}

class BasketballPointsCounterApp extends StatefulWidget {
  const BasketballPointsCounterApp({super.key});

  @override
  State<BasketballPointsCounterApp> createState() =>
      _BasketballPointsCounterAppState();
}

class _BasketballPointsCounterAppState
    extends State<BasketballPointsCounterApp> {
  int teamAScore = 0;

  int teamBScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basketball Points Counter',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Basketball Points Counter',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Team A',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '$teamAScore',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamAScore++;
                          });
                        },
                        child: Text(
                          'Add 1 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamAScore += 2;
                          });
                        },
                        child: Text(
                          'Add 2 Points',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamAScore += 3;
                          });
                        },
                        child: Text(
                          'Add 3 Points',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.orange,
                    width: 32 * 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '$teamBScore',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamBScore++;
                          });
                        },
                        child: Text(
                          'Add 1 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamBScore += 2;
                          });
                        },
                        child: Text(
                          'Add 2 Points',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            teamBScore += 3;
                          });
                        },
                        child: Text(
                          'Add 3 Points',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 64),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                // maximumSize: Size(200, 50),
              ),
              onPressed: () {},
              child: Text('Reset', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
