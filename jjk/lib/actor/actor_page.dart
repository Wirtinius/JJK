import 'package:flutter/material.dart';
import 'package:jjk/actor/actor.dart'; 
import 'package:jjk/actor/actor_detail_page.dart'; 
import 'package:jjk/actor/addActor.dart';

class ActorPage extends StatefulWidget {
  @override
  _ActorPageState createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  late Future<List<Actors>> futureActors; 

  @override
  void initState() {
    super.initState();
    futureActors = ActorsProvider().fetchAllActors(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text(
          'Actors', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 18, 31),
      ),
      body: FutureBuilder<List<Actors>>(
        future: futureActors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActorDetailPage(actor: snapshot.data![index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data![index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'JJK',
                        ),
                      ),
                      
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          snapshot.data![index].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 193, 18, 31),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddActorPage()), 
          ).then((_) {
            setState(() {
              futureActors = ActorsProvider().fetchAllActors(); 
            });
          });
        },
      ),
    );
  }
}
