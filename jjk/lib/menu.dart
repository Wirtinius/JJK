import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:jjk/event/event_page.dart';
import 'package:jjk/news/news_page.dart';
import 'package:jjk/actor/actor_page.dart';
import 'package:jjk/review/reviews_page.dart';
import 'package:jjk/auth/login_page.dart';
import 'package:jjk/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jjk/random.dart';
import 'package:jjk/stuff/stuff_page.dart';
class MenuPage extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/trailer.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

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
          stream: widget._auth.authStateChanges(),
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
                          widget._auth.signOut();
                        },
                      ),
                    ]
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      body: ListView(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            Center(child: CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'JJK - Info about the anime',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'JJK',
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}
