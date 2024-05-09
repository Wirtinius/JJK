import 'package:flutter/material.dart';
import 'package:jjk/event/event_page.dart';
import 'package:jjk/news/news_page.dart';
import 'package:jjk/actor/actor_page.dart';
import 'package:jjk/review/reviews_page.dart';
import 'package:jjk/auth/login_page.dart';
import 'package:jjk/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jjk/random.dart';
import 'package:jjk/stuff/stuff_page.dart';

class MenuPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        child: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              return Container(
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
                    // Other list tiles for navigation
                    _buildTile(context, 'List of stuff', StuffPage()),
                    _buildTile(context, 'List of actors', ActorPage()),
                    _buildTile(context, 'List of news', NewsPage()),
                    _buildTile(context, 'Reviews', ReviewsPage()),
                    _buildTile(context, 'Facts', RandomTextPage()),
                    _buildTile(context, 'Events', EventPage()),
                    if (user == null) ...[
                      _buildTile(context, 'Login', LoginScreen()),
                      _buildTile(context, 'Sign Up', SignUpScreen()),
                    ] else ...[
                      ListTile(
                        title: Text(
                          user.email ?? 'No email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'JJK',
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'JJK',
                          ),
                        ),
                        onTap: () {
                          _auth.signOut();
                        },
                      ),
                    ]
                  ],
                ),
              );
            }
            return CircularProgressIndicator(); // Loading state while waiting for auth
          },
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, Widget destination) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'JJK',
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}
