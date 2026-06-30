import 'package:flutter/material.dart';

void main() {
  runApp(BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: const Color(0xFFB2DFDB),
        backgroundColor: const Color.fromARGB(255, 121, 163, 235),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Mustafa Sayed',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              // SizedBox(height: 8),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withValues(alpha: 0.5),
                  // fontFamily: 'Pacifico',
                ),
              ),
              Divider(
                color: Colors.white.withValues(alpha: 0.5),
                thickness: 2,
                indent: 32,
                endIndent: 32,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.phone,
                      color: Color.fromARGB(255, 121, 163, 235),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+20 123 456 789',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 121, 163, 235),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 121, 163, 235),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'mustafasayed20002@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 121, 163, 235),
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.web,
                    color: Color.fromARGB(255, 121, 163, 235),
                  ),
                  title: Text(
                    'www.mustafasayed.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 121, 163, 235),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
