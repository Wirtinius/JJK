import 'package:flutter/material.dart';
import 'actor_model.dart';

class ActorDetailPage extends StatelessWidget {
  final Actor actor;

  ActorDetailPage({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          actor.name,
          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'JJK'),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: Column(
        children: [
          Image.asset(actor.imageUrl, fit: BoxFit.cover, height: 300,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              actor.description,
              style: TextStyle(color: Colors.white70, fontSize: 30, fontFamily: 'JJK'),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 0, 48, 73),
    );
  }
}
