import 'package:flutter/material.dart';
import 'package:jjk/reviws.dart';
import 'actor/actor_list.dart'; 
import 'actor/data.dart'; 

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 48, 73),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.0,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: Text(
                  'List of stuff',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'JJK',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 193, 18, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActorListPage(actors: actors)),
                  );
                },
                child: Text(
                  'List of actors',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'JJK',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 193, 18, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300.0,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: Text(
                  'List of news',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'JJK',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 193, 18, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ), 
            SizedBox(height: 20),
            SizedBox(
              width: 300.0,
              child: ElevatedButton(
                  onPressed: () {
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => ReviewsPage(reviews: reviews)),
                     );
                          },

                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'JJK',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 193, 18, 31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
