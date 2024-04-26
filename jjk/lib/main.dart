import 'package:flutter/material.dart';
import 'package:jjk/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/redSatoru.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),   
        child: Center(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Jujutso Kaisen',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 226, 226),
                  fontSize: 70,
                  fontFamily: 'JJK',
                ),
              ),
              Text(
                '*App*',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 226, 226),
                  fontSize: 70,
                  fontFamily: 'JJK',
                ),
              ),
              SizedBox(height: 50), 
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'JJK',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 48, 73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3.0,
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
