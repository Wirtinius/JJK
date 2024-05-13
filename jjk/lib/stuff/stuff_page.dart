import 'package:flutter/material.dart';
import 'package:jjk/stuff/addStuff.dart';
import 'package:jjk/stuff/stuff.dart';

class StuffPage extends StatefulWidget {
  @override
  _StuffPageState createState() => _StuffPageState();
}

class _StuffPageState extends State<StuffPage> {
  late Future<List<Stuff>> futureStuff;

  @override
  void initState() {
    super.initState();
    futureStuff = StuffProvider().fetchAllStuff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text(
          'Stuff',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 18, 31),
      ),
      body: FutureBuilder<List<Stuff>>(
        future: futureStuff,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].fullName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'JJK',
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data![index].bio,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
            MaterialPageRoute(builder: (context) => AddStuffPage()),
          ).then((_) {
            setState(() {
              futureStuff = StuffProvider().fetchAllStuff();
            });
          });
        },
      ),
    );
  }
}
