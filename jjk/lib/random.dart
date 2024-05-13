import 'dart:math';

import 'package:flutter/material.dart';

class RandomTextPage extends StatelessWidget {
  final List<String> randomTexts = [

"Jujutsu Kaisen is a popular anime and manga series that has taken the world by storm.",

"The story follows Yuji Itadori, an ordinary high school student who swallows the finger of a powerful curse, Sukuna.",

"To save his friends, Yuji must become a sorcerer and learn to control the curse's power.",

"The series is full of action, humor, and dark fantasy, making it a must-watch for fans of anime and manga.",

"Here are some fun facts about Jujutsu Kaisen that you might not know:",

"The name Jujutsu Kaisen literally means Cursed Technique Battle.",

"The series is set in a world where curses, which are negative emotions that manifest as monsters, exist alongside humans.",

"Curses can be exorcised by sorcerers, who use cursed energy to fight them.",

"Cursed energy is a powerful force that can be used for a variety of purposes, including combat, healing, and even creating barriers.",

"Sorcerers are trained at specialized schools, where they learn how to control cursed energy and use it to their advantage.",

"The series is known for its unique and stylish animation, which is often praised for its fluidity and creativity.",

"The characters in Jujutsu Kaisen are well-developed and complex, and they quickly become favorites among fans.",

"The series has been praised for its dark and gritty tone, which sets it apart from many other anime.",

"Jujutsu Kaisen is a popular anime and manga series for a reason. It has a great story, interesting characters, and stunning animation. If you're looking for a new anime to watch, Jujutsu Kaisen is definitely worth checking out.",
   
  ];

  String generateRandomText() {
    final Random random = Random();
    return randomTexts[random.nextInt(randomTexts.length)];
  }

  void showRandomTextDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Random Fact",  
              style: TextStyle(
                color: Color.fromARGB(255, 164, 0, 0),
                fontSize: 45,
                fontFamily: 'JJK',
              )),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          content: Text(generateRandomText(), style: TextStyle(
                color: Color.fromARGB(255, 164, 0, 0),
                fontSize: 25,
                fontFamily: 'JJK',
              )),
          actions: [
             ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
              textStyle: TextStyle(color: Colors.white),
            ),
              child: Text("Close", style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontFamily: 'JJK',
              ),)
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text("Facts", style: TextStyle(color: Colors.white, fontFamily: 'JJK')),
        backgroundColor: const Color.fromARGB(255, 193, 18, 31),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showRandomTextDialog(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
              textStyle: TextStyle(color: Colors.white),
            ),
          child: Text(
              'Show a random fact',  
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 45,
                fontFamily: 'JJK',
              ),
            ),
        ),
      ),
    );
  }
}
