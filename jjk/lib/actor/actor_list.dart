import 'package:flutter/material.dart';
import 'actor_model.dart';
import 'actor_detail_page.dart'; 

class ActorListPage extends StatelessWidget {
  final List<Actor> actors;

  ActorListPage({required this.actors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Actors',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontFamily: 'JJK'),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: ListView.builder(
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return ListTile(
            title: Text(
              actor.name,
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: 'JJK'),
            ),
            subtitle: Text(
              actor.description,
              style: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: 'JJK'),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(actor.imageUrl),
              backgroundColor: Color.fromARGB(255, 193, 18, 31),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActorDetailPage(actor: actor),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Color.fromARGB(255, 0, 48, 73),
    );
  }
}
