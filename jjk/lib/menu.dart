import 'package:flutter/material.dart';
import 'package:jjk/event/event_page.dart';
import 'package:jjk/news/news_page.dart';
import 'package:jjk/actor/actor_page.dart';
import 'package:jjk/review/reviews_page.dart';

import 'package:jjk/random.dart';
import 'package:jjk/stuff/stuff_page.dart';

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
      ),
     drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 193, 18, 31), 
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 193, 18, 31), 
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'JJK',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'List of stuff',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StuffPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'List of actors',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActorPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'List of news',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Facts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RandomTextPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'JJK',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
