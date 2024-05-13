import 'package:flutter/material.dart';
import 'package:jjk/event/addEvent.dart';
import 'package:jjk/event/event.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late Future<List<Event>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = EventProvider().fetchAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text('Events', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor:  const Color.fromARGB(255, 193, 18, 31), 
      ),
      body: FutureBuilder<List<Event>>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name, 
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'JJK',
                  ),
                  ),
                  subtitle: Text(snapshot.data![index].date.toString(), 
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                 ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data![index].image),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 193, 18, 31),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventPage()),
          ).then((_) {
            
            setState(() {
              futureEvents = EventProvider().fetchAllEvents();
            });
          });
        },
      ),
    );
  }
}
