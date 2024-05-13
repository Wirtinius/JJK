import 'package:flutter/material.dart';
import 'package:jjk/actor/actor.dart'; 

class ActorDetailPage extends StatelessWidget {
  final Actors actor;

  ActorDetailPage({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          actor.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 8.0),
            Text(
              actor.bio,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'JJK',
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(height: 8.0),
            Image.network(
              actor.image,
              width: 500,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 48, 73),
    );
  }
}
